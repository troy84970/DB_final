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


select * 
from master_student_with_selected_course as c
join course_score as cs
on c.course_arrangement_id = cs.course_arrangement_id and c.student_id = cs.student_id;

drop view student_with_selected_course;
drop view master_student_with_selected_course;
drop view college_student_with_selected_course;