USE quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT sub_id, sub_name, MAX(credit) 
FROM `subject` 
WHERE credit >6
GROUP BY sub_id, sub_name;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần