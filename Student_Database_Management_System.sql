create database student_db;
use student_db;
create table student(stu_id int primary key,stu_name VARCHAR(50),stu_age int,
  gender char(6) check(gender in('female','male')),city VARCHAR(100),marks INT);
  create table course(course_id int primary key,course_name varchar(100),duration varchar(20));
  create table enrollment(enroll_id int primary key,stu_id int,course_id int, 
  foreign key(stu_id) references student(stu_id),
  foreign key(course_id) references course(course_id));
  INSERT INTO student VALUES
(1, 'Ravi', 20, 'Male', 'Hyderabad', 85),
(2, 'Sita', 21, 'Female', 'Vijayawada', 90),
(3, 'Arjun', 19, 'Male', 'Guntur', 78),
(4, 'Meena', 20, 'Female', 'Hyderabad', 88),
(5, 'Kiran', 22, 'Male', 'Warangal', 72),
(6, 'Anjali', 20, 'Female', 'Nellore', 95),
(7, 'Rahul', 21, 'Male', 'Kurnool', 81),
(8, 'Pooja', 19, 'Female', 'Tirupati', 86),
(9, 'Suresh', 23, 'Male', 'Kadapa', 69),
(10, 'Lakshmi', 21, 'Female', 'Ongole', 92),
(11, 'Manoj', 20, 'Male', 'Vizag', 75),
(12, 'Divya', 22, 'Female', 'Rajahmundry', 89),
(13, 'Vamsi', 21, 'Male', 'Eluru', 84),
(14, 'Keerthi', 19, 'Female', 'Chittoor', 91),
(15, 'Prakash', 22, 'Male', 'Nizamabad', 67),
(16, 'Sandhya', 20, 'Female', 'Khammam', 88),
(17, 'Rohit', 21, 'Male', 'Adilabad', 73),
(18, 'Bhavya', 19, 'Female', 'Srikakulam', 96),
(19, 'Naresh', 23, 'Male', 'Anantapur', 79),
(20, 'Sneha', 20, 'Female', 'Machilipatnam', 90);
INSERT INTO course VALUES
(101, 'DBMS', '3 Months'),
(102, 'Python', '2 Months'),
(103, 'Java', '4 Months'),
(104, 'C Programming', '3 Months'),
(105, 'Data Structures', '4 Months'),
(106, 'Operating Systems', '3 Months'),
(107, 'Computer Networks', '3 Months'),
(108, 'Web Development', '2 Months'),
(109, 'Machine Learning', '5 Months'),
(110, 'Cloud Computing', '3 Months');
INSERT INTO enrollment VALUES
(1, 1, 101),
(2, 1, 102),
(3, 2, 103),
(4, 3, 101),
(5, 4, 102),
(6, 5, 104),
(7, 6, 105),
(8, 7, 106),
(9, 8, 107),
(10, 9, 104),
(11, 10, 108),
(12, 11, 105),
(13, 12, 109),
(14, 13, 106),
(15, 14, 110),
(16, 15, 101),
(17, 16, 102),
(18, 17, 107),
(19, 18, 109),
(20, 19, 108),
(21, 20, 110),
(22, 2, 105),
(23, 3, 108),
(24, 4, 106),
(25, 6, 110),
(26, 7, 101),
(27, 8, 102),
(28, 10, 103),
(29, 12, 104),
(30, 18, 105);
select * from student;
select * from course;
select * from enrollment;
select *from student 
order by marks desc;
select avg(marks) 
as avg_marks from student;
select* from student
where city='hyderabad';
SELECT s.stu_name, c.course_name
FROM student s
JOIN enrollment e ON s.stu_id = e.stu_id
JOIN course c ON e.course_id = c.course_id;
SELECT c.course_name, COUNT(e.stu_id) AS total_students
FROM course c
JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;
UPDATE student
SET marks = 92
WHERE stu_id = 3;
#DELETE FROM student WHERE stu_id = 15;

SELECT * FROM student WHERE stu_id = 3;








