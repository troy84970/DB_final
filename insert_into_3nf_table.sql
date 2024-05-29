INSERT INTO course (course_no, course_name, course_type, course_credit)
SELECT DISTINCT course_no, course_name, course_type, course_credit
FROM one_nf_course_data;

INSERT INTO student (student_name, student_dept, student_grade, student_status, student_class)
SELECT DISTINCT student_name, student_dept, student_grade, student_status, student_class
FROM one_nf_course_data;

INSERT INTO teacher (teacher_name)
SELECT DISTINCT teacher_name
FROM one_nf_course_data;

INSERT INTO course_arrangement (course_no, semester, course_room, course_time, course_limit, course_status)
SELECT DISTINCT course_no, semester, course_room, course_time, course_limit, course_status
FROM one_nf_course_data;

INSERT INTO curriculum_field (curriculum_field, course_no)
SELECT DISTINCT o.curriculum_field, o.course_no
FROM one_nf_course_data o;

INSERT INTO course_score (student_id, course_arrangement_id, course_score)
SELECT s.student_id, ca.arrangement_id, o.course_score
FROM student s
JOIN one_nf_course_data o ON o.student_name = s.student_name
JOIN course_arrangement ca ON ca.course_no = o.course_no;

INSERT INTO course_feedback (student_id, course_arrangement_id, feedback_rank)
SELECT s.student_id, ca.arrangement_id, o.feedback_rank
FROM student s
JOIN one_nf_course_data o ON o.student_name = s.student_name
JOIN course_arrangement ca ON ca.course_no = o.course_no;

INSERT INTO enrollment (student_id, course_arrangement_id, select_result)
SELECT s.student_id, ca.arrangement_id, o.select_result
FROM student s
JOIN one_nf_course_data o ON o.student_name = s.student_name
JOIN course_arrangement ca ON ca.course_no = o.course_no;

INSERT INTO room_information (course_room, course_building)
SELECT DISTINCT course_room, course_building
FROM one_nf_course_data;

INSERT INTO teach (teacher_id, course_arrangement_id)
SELECT t.teacher_id, ca.arrangement_id
FROM teacher t
JOIN one_nf_course_data o ON o.teacher_name = t.teacher_name
JOIN course_arrangement ca ON ca.course_no = o.course_no;






