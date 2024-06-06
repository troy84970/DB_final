-- ll part
INSERT INTO tmp_course_data_teacher_field_ll (semester, course_no, course_name, course_type, course_room, course_building, course_time, course_credit, course_limit, course_status, teacher_name, student_name, student_dept, student_grade, student_status, curriculum_field, student_class, select_result, course_score, feedback_rank)
select
	semester, 
    course_no, 
    course_name, 
    course_type, 
    course_room, 
    course_building, 
    course_time, 
    course_credit, 
    course_limit, 
    course_status, 
    substring_index(teacher_name,',',1), 
    student_name, 
    student_dept, 
    student_grade, 
    student_status, 
    trim(substring_index(curriculum_field,',',1)),
    student_class, 
    select_result, 
    course_score, 
    feedback_rank
FROM course_data;

-- lr part
INSERT INTO tmp_course_data_teacher_field_lr (semester, course_no, course_name, course_type, course_room, course_building, course_time, course_credit, course_limit, course_status, teacher_name, student_name, student_dept, student_grade, student_status, curriculum_field, student_class, select_result, course_score, feedback_rank)
select
	semester, 
    course_no, 
    course_name, 
    course_type, 
    course_room, 
    course_building, 
    course_time, 
    course_credit, 
    course_limit, 
    course_status, 
    substring_index(teacher_name,',',1),
    student_name, 
    student_dept, 
    student_grade, 
    student_status, 
    trim(substring_index(curriculum_field,',',-1)), 
    student_class, 
    select_result, 
    course_score, 
    feedback_rank
FROM course_data;

-- rl part
INSERT INTO tmp_course_data_teacher_field_rl (semester, course_no, course_name, course_type, course_room, course_building, course_time, course_credit, course_limit, course_status, teacher_name, student_name, student_dept, student_grade, student_status, curriculum_field, student_class, select_result, course_score, feedback_rank)
select
	semester, 
    course_no, 
    course_name, 
    course_type, 
    course_room, 
    course_building, 
    course_time, 
    course_credit, 
    course_limit, 
    course_status, 
    substring_index(teacher_name,',',-1), 
    student_name, 
    student_dept, 
    student_grade, 
    student_status, 
    trim(substring_index(curriculum_field,',',1)), 
    student_class, 
    select_result, 
    course_score, 
    feedback_rank
FROM course_data;

-- rr part
INSERT INTO tmp_course_data_teacher_field_rr (semester, course_no, course_name, course_type, course_room, course_building, course_time, course_credit, course_limit, course_status, teacher_name, student_name, student_dept, student_grade, student_status, curriculum_field, student_class, select_result, course_score, feedback_rank)
select
	semester, 
    course_no, 
    course_name, 
    course_type, 
    course_room, 
    course_building, 
    course_time, 
    course_credit, 
    course_limit, 
    course_status, 
    substring_index(teacher_name,',',-1), 
    student_name, 
    student_dept, 
    student_grade, 
    student_status, 
    trim(substring_index(curriculum_field,',',-1)), 
    student_class, 
    select_result, 
    course_score, 
    feedback_rank
FROM course_data;