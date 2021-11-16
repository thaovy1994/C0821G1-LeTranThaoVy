USE quanlysinhvien;

SELECT *
FROM Student;

SELECT *
FROM Student
WHERE Status = true;

SELECT *
FROM Subject
WHERE Credit < 10;

SELECT s.student_id, s.student_name, c.class_name
FROM student s join class c on S.class_id = c.class_id;

SELECT s.student_id, s.student_name, c.class_name
FROM student s join class c on S.class_id = c.class_id
WHERE c.class_name = 'A1';

SELECT s.student_id, s.student_name, sub.sub_name, m.mark
FROM student s join mark m on s.student_id = m.student_id join Subject sub on m.sub_id = sub.sub_id
WHERE sub.sub_name = 'CF';