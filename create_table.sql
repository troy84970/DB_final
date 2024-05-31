create table IF NOT EXISTS student(
    student_id INTEGER AUTO_INCREMENT,
    student_name VARCHAR(20),
    student_dept VARCHAR(30),
    student_grade INTEGER,
    student_status VARCHAR(10),
    student_class VARCHAR(1),
    primary key (student_id)
);
CREATE TABLE IF NOT EXISTS teacher (
    teacher_id INTEGER AUTO_INCREMENT,
    teacher_name VARCHAR(20),
    primary key (teacher_id)
);
CREATE TABLE IF NOT EXISTS course (
    course_no VARCHAR(10),
    course_name VARCHAR(255),
    course_type VARCHAR(10),
    course_credit INT,
	primary key (course_no)
);
CREATE TABLE IF NOT EXISTS room_information (
    course_room VARCHAR(20),
    course_building VARCHAR(20),
    primary key (course_room)
);
CREATE TABLE IF NOT EXISTS course_arrangement (
    arrangement_id INTEGER AUTO_INCREMENT,
    course_no VARCHAR(10),
    semester VARCHAR(4),
    course_room VARCHAR(20),
    course_time VARCHAR(20),
    course_limit INT,
    course_status VARCHAR(10),
    primary key (arrangement_id),
    foreign key (course_no) references course (course_no),
    foreign key (course_room) references room_information (course_room)
);
CREATE TABLE IF NOT EXISTS teach (
    teacher_id INTEGER,
    course_arrangement_id INT,
    primary key (teacher_id,course_arrangement_id),
	foreign key (teacher_id) references teacher(teacher_id),
    foreign key (course_arrangement_id) references course_arrangement(arrangement_id)
);
CREATE TABLE IF NOT EXISTS curriculum_field (
    curriculum_field VARCHAR(50),
    course_no VARCHAR(10),
    primary key (curriculum_field,course_no),
    foreign key (course_no) references course (course_no)
);
CREATE TABLE IF NOT EXISTS enrollment (
    student_id INT,
    course_arrangement_id INT,
    select_result VARCHAR(10),
    primary key (student_id,course_arrangement_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_arrangement_id) REFERENCES course_arrangement(arrangement_id)
);
CREATE TABLE IF NOT EXISTS course_feedback (
    student_id INTEGER,
    course_arrangement_id INTEGER,
    feedback_rank INTEGER,
    primary key (student_id,course_arrangement_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_arrangement_id) REFERENCES course_arrangement(arrangement_id)
);
CREATE TABLE IF NOT EXISTS course_score (
    student_id INTEGER,
    course_arrangement_id INTEGER,
    course_score decimal(4,1),
    primary key (student_id,course_arrangement_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_arrangement_id) REFERENCES course_arrangement(arrangement_id)
);





