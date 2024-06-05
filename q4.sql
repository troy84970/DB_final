with count_of_dept_and_field as(
	select s.student_dept as dept,cf.curriculum_field as field,count(*) as count,sum(count(*)) over (partition by s.student_dept) as total
	from course_arrangement as ca 
		join enrollment as e on ca.arrangement_id = e.course_arrangement_id
		join student as s on s.student_id = e.student_id
		join course as c on c.course_no = ca.course_no
		join curriculum_field as cf on cf.course_no = c.course_no
	where e.select_result <> '落選'
	group by s.student_dept,cf.curriculum_field
	order by s.student_dept
)
select c.dept,c.field,c.count as 'person-time' ,concat(c.count/c.total*100,'%' ) as proportion
from count_of_dept_and_field as c