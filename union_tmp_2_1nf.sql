CREATE TABLE IF NOT EXISTS one_nf_course_data (
	semester	varchar(4),
	course_no	varchar(5),
	course_name	varchar(255),
	course_type	varchar(10),
	course_room	varchar(20),
	course_building	varchar(20),
	course_time	varchar(20),
	course_credit	INTEGER,
	course_limit	INTEGER,
	course_status	varchar(10),
	teacher_name	varchar(20),
	student_name	varchar(20),
	student_dept	varchar(30),
	student_grade	INTEGER,
	student_status	varchar(10),
	curriculum_field	TEXT,
	student_class	varchar(1),
	select_result	varchar(10),
	course_score	decimal(4,1),
	feedback_rank	INTEGER
);
insert into one_nf_course_data (semester, course_no, course_name, course_type, course_room, course_building, course_time, course_credit, course_limit, course_status, teacher_name, student_name, student_dept, student_grade, student_status, curriculum_field, student_class, select_result, course_score, feedback_rank)
select * from 
	tmp_course_data_teacher_field_ll
	union select * from tmp_course_data_teacher_field_lr
    union select * from tmp_course_data_teacher_field_rl
    union select * from tmp_course_data_teacher_field_rr;
    