USE quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT sub_id, sub_name, MAX(credit) 
FROM `subject`;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select sub.sub_id, s.student_name, max(m.mark)
from student AS s
join mark AS m on m.student_id = s.student_id
join `subject` AS sub on sub.sub_id = m.sub_id;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id, s.student_name, avg(m.mark)
from student AS s
left join mark AS m on m.student_id = s.student_id
group by s.student_id
order by mark desc;