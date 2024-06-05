with course_feedback_analyze as (
	select ca.arrangement_id,c.course_no,sum(cf.feedback_rank) as total_feedback,avg(cf.feedback_rank) as avg_feedback
	from course_arrangement as ca 
		join enrollment as e on ca.arrangement_id = e.course_arrangement_id
		join student as s on s.student_id = e.student_id
		join course as c on c.course_no = ca.course_no
		join course_feedback as cf on cf.student_id = s.student_id and cf.course_arrangement_id = ca.arrangement_id
	where (e.select_result = '中選'or e.select_result = '人工加選') and s.student_status = '在學'
	group by c.course_no,ca.arrangement_id
)
select course_no,course_name,group_concat(teacher_name) as teacher_name,total_feedback,avg_feedback
from (
	select cfa.course_no,c.course_name,t.teacher_name,cfa.total_feedback, cfa.avg_feedback
	from course_feedback_analyze as cfa
		join course as c on cfa.course_no = c.course_no
		join teach on teach.course_arrangement_id = cfa.arrangement_id
		join teacher as t on t.teacher_id = teach.teacher_id
    ) as normalize_result
group by course_no,course_name,total_feedback,avg_feedback
order by avg_feedback desc;