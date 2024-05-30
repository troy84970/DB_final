create view student_with_selected_course as
select e.course_arrangement_id,e.student_id,student_name,student_dept,e.select_result
from enrollment as e
	join student as s
	on e.student_id = s.student_id
where e.select_result = '中選';

-- 研究所 or 碩士班 為結尾 是 碩士
create view master_student_with_selected_course as
select *
from student_with_selected_course 
where student_dept like '%研究所' or student_dept like '%碩士班';

CREATE VIEW college_student_with_selected_course as
select *
from student_with_selected_course 
where student_dept not like '%研究所' and student_dept not like '%碩士班';


/*
select c.course_arrangement_id,c.student_id,course_score
from master_student_with_selected_course as c
join course_score as cs
on c.course_arrangement_id = cs.course_arrangement_id and c.student_id = cs.student_id
where course_score >= 70;

select c.course_arrangement_id,c.student_id,course_score
from college_student_with_selected_course as c
join course_score as cs
on c.course_arrangement_id = cs.course_arrangement_id and c.student_id = cs.student_id
where course_score >= 60;
*/

/*
select 
    c.course_arrangement_id,
    count(*) AS total_students,
    SUM(CASE WHEN cs.course_score < 70 THEN 1 ELSE 0 END) AS failed_students
from master_student_with_selected_course AS c
join course_score as cs
on c.course_arrangement_id = cs.course_arrangement_id AND c.student_id = cs.student_id
group by c.course_arrangement_id
order by course_arrangement_id;
*/
/*
select
    c.course_arrangement_id,
    count(*) AS total_students,
    SUM(CASE WHEN cs.course_score < 70 THEN 1 ELSE 0 END) AS failed_students
from college_student_with_selected_course AS c
join course_score as cs
on c.course_arrangement_id = cs.course_arrangement_id AND c.student_id = cs.student_id
group by c.course_arrangement_id
order by course_arrangement_id;
*/

create view course_score_distribution as
select 
    course_arrangement_id,
    SUM(total_students) as total_students,
    SUM(failed_students) as failed_students
from (
    (select
        c.course_arrangement_id,
        COUNT(*) as total_students,
        SUM(CASE WHEN cs.course_score < 70 THEN 1 ELSE 0 END) AS failed_students
    from master_student_with_selected_course AS c
    join course_score AS cs ON c.course_arrangement_id = cs.course_arrangement_id AND c.student_id = cs.student_id
    group by c.course_arrangement_id) 
    union all 
    (select
        c2.course_arrangement_id,
        COUNT(*) AS total_students,
        SUM(CASE WHEN cs2.course_score < 60 THEN 1 ELSE 0 END) AS failed_students
    from college_student_with_selected_course AS c2
    join course_score AS cs2 ON c2.course_arrangement_id = cs2.course_arrangement_id AND c2.student_id = cs2.student_id
    group by c2.course_arrangement_id)
) as combined_data
group by course_arrangement_id;

/*
select * from course_score_distribution
order by course_arrangement_id;
*/

-- final result
select c.course_name,t.teacher_name, csd.failed_students,csd.total_students,csd.failed_students/csd.total_students as failure_rate
from course_score_distribution as csd
join course_arrangement as ca
on ca.arrangement_id = csd.course_arrangement_id
join teach 
on teach.course_arrangement_id = csd.course_arrangement_id
join teacher as t
on t.teacher_id = teach.teacher_id
join course as c
on c.course_no = ca.course_no;
    


drop view student_with_selected_course;
drop view master_student_with_selected_course;
drop view college_student_with_selected_course;
drop view course_score_distribution;