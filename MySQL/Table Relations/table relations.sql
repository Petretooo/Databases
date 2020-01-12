CREATE TABLE students(
student_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(60)
);

CREATE TABLE exams(
exam_id INT(11) NOT NULL PRIMARY KEY,
name VARCHAR(60)
);

CREATE TABLE students_exams(
student_id INT(11),
exam_id INT(11),
CONSTRAINT pk_students_exams
PRIMARY KEY (student_id, exam_id),
CONSTRAINT fk_students_exams_students
FOREIGN KEY (student_id)
REFERENCES students(student_id),
CONSTRAINT pk_students_exams_exams
FOREIGN KEY (exam_id)
REFERENCES exams(exam_id)
);

INSERT INTO students(name)
VALUES('Mila'), ('Toni'), ('Ron');

INSERT INTo exams(exam_id, name)
VALUES(101, 'Spring MVC'),
(102, 'Neo4j'),
(103, 'Oracle 11g');

INSERT INTO students_exams(student_id, exam_id)
VALUES(1,101),(1,102),(2, 101),(3,103),(2, 102);