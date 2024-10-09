--Creating the Tables
CREATE TABLE students (student_id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, school_enrollment_date DATE)

CREATE TABLE professors (professor_id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, department TEXT)

CREATE TABLE courses (course_id SERIAL PRIMARY KEY, course_name TEXT, course_description TEXT, professor_id INT REFERENCES professors(professor_id))

CREATE TABLE enrollments (student_id INT REFERENCES students(student_id), course_id INT REFERENCES courses(course_id), enrollment_date DATE, PRIMARY KEY (student_id, course_id))

-- Inserting the Data
INSERT INTO students(first_name, last_name, email, school_enrollment_date)
VALUES('Jane', 'Fonda', 'j.fonda24@gmail.com', 'September 3 2022'),
('Ryan', 'Reynolds', 'deadpool42@gmail.com', 'September 5 2024'),
('Bruce', 'Wayne', 'bat_lover33@gmail.com', 'May 25 2007'),
('Maggie', 'Smith', 'ladyviolet@gmail.com', 'September 1 2019'),
('Valerie', 'Frizzle', 'magicschoolbus@gmail.com', 'June 15 2017');

INSERT INTO professors(first_name, last_name, department)
VALUES('Charlie', 'Chaplin', 'Theatre Arts'),
('Gwen', 'Stefani', 'Music'),
('Bill', 'Nye', 'Science'),
('Edgar', 'Poe', 'English');

INSERT INTO courses(course_name, course_description, professor_id)
VALUES('Intro to Music Theory', '"Intro to Music Theory" explores the fundamental concepts of music, including notation, harmony, rhythm, and melody, empowering students to understand and create their own musical compositions.', 2),
('Shakespeare', '"Shakespeare" delves into the life, works, and enduring influence of William Shakespeare, examining his plays and poetry through historical, cultural, and literary lenses.', 4),
('Fundimentals of Rudimentary Chemistry', '"Fundamentals of Rudimentary Chemistry" introduces essential concepts of chemistry, including atomic structure, chemical reactions, and basic laboratory techniques, laying the groundwork for further exploration in the field.', 3);

INSERT INTO enrollments(student_id, course_id, enrollment_date)
VALUES (1, 3, 'September 6, 2022'),
(1, 2, 'September 6, 2022'),
(2, 2, 'September 7, 2024'),
(3, 1, 'June 3, 2007'),
(3, 3, 'September 2, 2007'),
(4, 2, 'September 5, 2019');

--Retrieving Full Name
SELECT students.first_name || ' ' || students.last_name AS stud_in_shakespeare
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
WHERE enrollments.course_id = 2;

--Retrieving Course List with Professor's Full Name
SELECT courses.course_name, professors.first_name || ' ' || professors.last_name AS prof_full_name
FROM courses
INNER JOIN professors ON professors.professor_id = courses.professor_id;

--Retrieving Courses with students enrolled
SELECT courses.course_name AS course_with_students
FROM courses
INNER JOIN students ON students.student_id = courses.course_id;