with student_failing_course as(
	select ca.arrangement_id,
			ca.course_no,
		sum(
			case 
				when (s.student_dept IN (select dept from department_degree where degree = '碩士')) and  cs.course_score < 70 then 1
				else 0
			end
        ) as failed_master_students,
		sum(
			case 
				when (s.student_dept IN (select dept from department_degree where degree = '學士')) and  cs.course_score < 60 then 1
				else 0
			end
        ) as failed_college_students,
        count(*) as total_students
    from enrollment as e
		join student as s on e.student_id = s.student_id
		join course_arrangement as ca on ca.arrangement_id = e.course_arrangement_id
		join course_score  as cs on e.course_arrangement_id = cs.course_arrangement_id and e.student_id = cs.student_id
	where e.select_result <> '落選'
    group by ca.arrangement_id
)

# select * from student_failing_course;

select course_name,group_concat(teacher_name) as teacher_name,failed_students,total_students,failure_rate
from(select course_name,
		   teacher_name,
		   (sfc.failed_master_students+sfc.failed_college_students) as failed_students,
		   sfc.total_students,
		   (sfc.failed_master_students+sfc.failed_college_students)/sfc.total_students as failure_rate
	from student_failing_course as sfc
		join course as c on sfc.course_no = c.course_no
		join teach as t on  sfc.arrangement_id = t.course_arrangement_id
		join teacher on teacher.teacher_id = t.teacher_id) as result
group by course_name,failed_students,total_students,failure_rate;