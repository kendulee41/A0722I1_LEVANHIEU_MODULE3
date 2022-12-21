
select *
from student
where StudentName like "h%";
select *
from class
where StartDate like "%-12-%";
select *
from subject
where credit <= 5 and credit >=3;
use quanlysinhvien;
update student
set ClassId = 2
where StudentName like 'Hung';
select student.StudentName, subject.SubName, mark.Mark
from student join mark join subject
on student.StudentId = mark.studentId and subject.SubId = mark.SubId
order by mark.Mark desc,student.StudentName;