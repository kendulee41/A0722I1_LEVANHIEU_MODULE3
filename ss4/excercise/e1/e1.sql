use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select subId,SubName,max(credit) as credit,status
from subject
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select markId,SubID,studentid,max(mark) as mark,examtimes
from mark
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên
-- xếp hạng theo thứ tự điểm giảm dần
select studentName,avg(mark) as avg
from student inner join mark on student.studentiD = mark.studentiD
group by mark.studentiD
order by mark desc;