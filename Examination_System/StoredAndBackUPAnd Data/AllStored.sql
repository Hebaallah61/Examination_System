--asmaa stored proc
--select Student (all || by fname || by ssn)
create proc select_student @ssn int = -1,@fname nvarchar(70)=' '
as
if @ssn = -1 and @fname !=' '
begin
if exists(select fname from Student where fname = @fname)
select ssn Std_ssn,fname [first name],lname[last name],age std_age,address std_address,email std_Email,s.dept_id [department id],dept_name [department name]
from Student s, Department d where s.dept_id=d.dept_id and fname = @fname
else select 'no matching student'
end
else if  @ssn != -1 and @fname =' '
begin 
if exists(select ssn from Student where ssn = @ssn)
select ssn Std_ssn,fname [first name],lname[last name],age std_age,address std_address,email std_Email,s.dept_id [department id],dept_name [department name]
from Student s, Department d where s.dept_id=d.dept_id and ssn = @ssn
else select 'no matching student'
end
else select ssn Std_ssn,fname [first name],lname[last name],age std_age,address std_address,email std_Email,s.dept_id [department id],dept_name [department name]
from Student s, Department d where s.dept_id=d.dept_id


go
--insert new student
create proc insert_student @ssn int,@fname nvarchar(70),@lname nvarchar(70)=null,@age int=null , @add nvarchar(90)=null,@mail nvarchar(70),@did int
as
begin try
insert into Student values(@ssn,@fname,@lname,@age,@add,@mail,@did)
end try
begin catch
select 'an error happened while inserting'
end catch

 go

--delete student by id
create proc delete_student @id int
as
if exists(select ssn from Student where ssn = @id)
begin
delete from Student where ssn = @id
delete from Exam_std_quest where std_ssn = @id
delete from Student_course where std_ssn = @id
end
else select 'this id does not exist'
go
--update student data  --on update cascade
create proc update_student @ssn int,@newssn int =0,@fname nvarchar(70)='NA',@lname nvarchar(70)='NA',@age int=0 , @add nvarchar(90)='NA',@mail nvarchar(70)='NA',@did int=0
as
if exists(select ssn from Student where ssn =@ssn)
begin
begin try 
if @fname != 'NA' 
update Student set fname=@fname where ssn = @ssn
if @lname != 'NA' 
update Student set lname=@lname where ssn = @ssn
if @age != 0
update Student set age=@age where ssn = @ssn
if @add != 'NA'
update Student set address=@add where ssn = @ssn
if @mail != 'NA'
update Student set email=@mail where ssn = @ssn
if @did != 0
update Student set dept_id=@did where ssn = @ssn
if @newssn != 0
update Student set ssn=@newssn where ssn = @ssn
end try
begin catch
select 'error,can not update'
end catch
end
else select 'no matched ssn'

go

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------



--select instructor (all || by fname || by ssn)
create proc select_instructor @ssn int = -1,@name nvarchar(70)=' '
as
if @ssn = -1 and @name !=' '
begin
if exists(select ins_name from Instructor where ins_name = @name)
select ins_ssn SSN,ins_name [name],salary Ins_Salary,email Ins_Email,age Ins_Age,i.dept_id [department id],dept_name [department name]
from Instructor i,Department d where d.dept_id=i.dept_id and ins_name = @name
else select 'no matching instructor'
end
else if  @ssn != -1 and @name =' '
begin 
if exists(select ins_ssn from Instructor where ins_ssn = @ssn)
select ins_ssn SSN,ins_name [name],salary Ins_Salary,email Ins_Email,age Ins_Age,i.dept_id [department id],dept_name [department name]
from Instructor i,Department d where d.dept_id=i.dept_id and ins_ssn = @ssn
else select 'no matching instructor'
end
else select ins_ssn SSN,ins_name [name],salary Ins_Salary,email Ins_Email,age Ins_Age,i.dept_id [department id],dept_name [department name]
from Instructor i,Department d where d.dept_id=i.dept_id 


go
--insert new instructor
create proc insert_instructor @ssn int,@name nvarchar(70),@sal float,@mail nvarchar(70)=null,@age int=null,@did int
as
begin try
insert into Instructor values(@ssn,@name,@sal,@mail,@age,@did)
end try
begin catch
--select Error_message()
select 'an error happened while inserting'
end catch

go
--delete ins by id
create proc delete_instructor @id int
as
if exists(select ins_ssn from Instructor where ins_ssn = @id)
begin
delete from Instructor where ins_ssn = @id
delete from Instructor_course where ins_id = @id
end
else select 'this id does not exist'

go

--update instructor data
create proc update_instructor @ssn int,@newssn int =0,@name nvarchar(70)='NA',@age int=0 , @sal int=0,@mail nvarchar(70)='NA',@did int=0
as
if exists(select ins_ssn from Instructor where ins_ssn = @ssn)
begin
begin try 

if @name != 'NA'
update Instructor set ins_name=@name where ins_ssn = @ssn
if @age != 0
update Instructor set age=@age where ins_ssn = @ssn
if @sal != 0
update Instructor set salary=@sal where ins_ssn = @ssn
if @mail != 'NA'
update Instructor set email=@mail where ins_ssn = @ssn
if @did != 0
update Instructor set dept_id=@did where ins_ssn = @ssn
if @newssn != 0
update Instructor set ins_ssn=@newssn where ins_ssn = @ssn
end try
begin catch
select 'error,can not update'
end catch
end
else select 'no matched ssn'

go

----------------------------------------------------------------------------------------
--maha stored proc

---select topic 
create proc select_topic  @id int =-1 , @name nvarchar(20) =' '
as
if @id =-1 and @name !=' '
begin
IF EXISTS(select name from Topic where name=@name )
select t.id as [topic id] , t.name as [topic name],t.crs_id as [Course Id],c.name as [Course Name] from Topic t inner join course c
on t.crs_id=c.id
where t.name=@name
else select 'topic not found' as [message]
end
else if @id !=-1 and @name =' '
begin 
IF EXISTS(select id from Topic where id=@id)
select t.id as [topic id] , t.name as [topic name],t.crs_id as [Course Id],c.name as [Course Name] from Topic t inner join course c
on t.crs_id=c.id
where t.id=@id
else select 'topic not found' as [message]
end 
else 
select t.id as [topic id] , t.name as [topic name],t.crs_id as [Course Id],c.name as [Course Name] from Topic t inner join course c
on t.crs_id=c.id
go
---insert new topic 
create proc insert_topic @name nvarchar(20),@crs_id int
as 
begin try
insert into Topic values(@name,@crs_id)
end try
begin catch
select 'an error happened while inserting in topic'
end catch

go
---update topic 
create proc update_topic @id int , @name nvarchar(50)='',@crs_id int=0
as
if exists(select id from Topic where id=@id)
begin
begin try 
if(@name<>'')
update topic set name = @name where id=@id
if(@crs_id<>0)
update Topic set crs_id=@crs_id where id=@id
end try 
begin catch 
select 'an error happened while updating in topic'
end catch 
end 
else select 'topic not found' 

go
---delete topic 
create proc delete_topic @id int 
as
delete from Topic where id=@id
go
-----------------------------------------------------------------------------------------------
---department 
create proc select_department @id int =-1 , @name nvarchar(50)=' ' 
as
if @id=-1 and @name!=' ' 
begin 
if exists (select dept_name from Department where dept_name=@name )
select dept_id as [dept id] , dept_name as [dept name] from Department where dept_name=@name 
else select 'department not found' 
end
else if @id!=-1 and @name=' ' 
begin 
if exists (select dept_id from Department where dept_id=@id )
select dept_id as [dept id] , dept_name as [dept name] from Department where dept_id=@id
else select 'department not found' 
end
else 
select dept_id as [dept id] , dept_name as [dept name] from Department

go
---update 
create proc update_department @id int , @name nvarchar(50) 
as
if exists(select dept_id from Department where dept_id=@id)
begin
update Department set dept_name = @name where dept_id=@id
end 
else select 'department not found'

go
---insert 
create proc insert_department  @name nvarchar(20)
as 
insert into Department values(@name)

go
---delete 
create proc delete_department @id int
as
if exists(select dept_id from Department where dept_id=@id)
begin
update Instructor set dept_id=NULL where dept_id=@id
update Student set dept_id=NULL where dept_id=@id
delete  from Department where dept_id=@id
end
else select 'department not found' 

go
---------------------------------------------------------------------------------
---course 

create proc select_course  @id int =-1
as
if(@id!=-1)
select id as [course id] , name as [course name]  from Course where id=@id
else 
select id as [course id] , name as [course name]  from Course

go
---update 
create proc update_course @id int , @name nvarchar(50)
as
if exists(select id from Course where id=@id)
update Course set name = @name where id=@id
else select 'course not found'

go

---insert 
create proc insert_course  @name nvarchar(20)
as 
insert into Course values(@name)

go
--delete proc
create proc delete_course @id int 
as
if exists(select id from course where id=@id)
begin---
delete from Question_Choices where ques_id in (select id from Question where crs_id = @id)
delete from Exam_std_quest where quest_id in (select id from question where crs_id=@id)
delete from Question where crs_id in (select id from course where id=@id)
delete from Instructor_course where crs_id =@id
delete from Student_course where crs_id=@id
delete from Exam where crs_id =@id
delete from Topic where crs_id=@id
delete  from Course where id=@id
end---
else select 'course not found' 
go

-----------------------------------------------------
--mohamed stored proc

create procedure select_exam @x int=-1
as
if @x!=-1
	select e.id as exam_id,time as exam_time,crs_id as crs_time,name as crs_name 
	from exam e,Course c
	where e.crs_id=c.id and e.id=@x
else
select e.id as exam_id,time as exam_time,crs_id as crs_time,name as crs_name
from exam e,Course c
where e.crs_id=c.id
 ----------------------------------
 go

create procedure insert_exam @x int,@y int
as 
begin try
insert into exam 
values (@x,@y)
end try
begin catch
select 'error in foreign key'
end catch

------------------------------------
go
create procedure update_exam @id int,@time int=-1,@crsid int=-1
as
if exists(select* from exam where id=@id)
begin
begin try
if @time!=-1
update exam set time=@time where id=@id
if @crsid!=-1
update exam set crs_id=@crsid where id=@id
end try
begin catch
select 'error in foreign key'
end catch
end
else
select 'no matched id'

---------------------------------------
go
create procedure delete_exam @id int
as
delete from Exam_std_quest
where ex_id=@id
delete from exam 
where id=@id

--------------------------------------------------------
go
-------------------------------
create procedure select_student_course @id int=-1,@ssn int=-1
as
if @id!=-1 and @ssn!=-1
select crs_id as crs_id,std_ssn as stu_ssn ,ssn as student_ssn,fname as f_name,c.id as crs_id,c.name as crs_name 
from Student_course sc inner join Student s
on s.ssn=sc.std_ssn inner join Course c
on sc.crs_id=c.id
where sc.crs_id=@id and sc.std_ssn=@ssn

else if @id!=-1 and @ssn=-1
select crs_id as crs_id,std_ssn as stu_ssn ,ssn as student_ssn,fname as f_name,c.id as crs_id,c.name as crs_name 
from Student_course sc inner join Student s
on s.ssn=sc.std_ssn inner join Course c
on sc.crs_id=c.id
where sc.crs_id=@id

else if @id=-1 and @ssn!=-1
select crs_id as crs_id,std_ssn as stu_ssn ,ssn as student_ssn,fname as f_name,c.id as crs_id,c.name as crs_name 
from Student_course sc inner join Student s
on s.ssn=sc.std_ssn inner join Course c
on sc.crs_id=c.id
where sc.std_ssn=@ssn
else
select crs_id as crs_id,std_ssn as stu_ssn ,ssn as student_ssn,fname as f_name,c.id as crs_id,c.name as crs_name 
from Student_course sc inner join Student s
on s.ssn=sc.std_ssn inner join Course c
on sc.crs_id=c.id

------------------------------------
go

create procedure insert_student_course @id int,@ssn int
as
begin try
insert into student_course
values (@id,@ssn,null)
end try 
begin catch
select 'error in insert'
end catch

go
-------------------------------------------
create proc update_student_course @crs_is int , @std_ssn int,@crs_newId int=0 , @std_newId int=0
as
begin try
if(@crs_newId<>0)
	update student_course set crs_id=@crs_newId where crs_id=@crs_is and std_ssn=@std_ssn
if(@std_ssn<>0)
	update student_course set std_ssn=@std_newId where crs_id=@crs_is and std_ssn=@std_ssn
if(@crs_newId<>0 and @std_newId<>0)
	update student_course set crs_id=@crs_newId where crs_id=@crs_is and std_ssn=@std_ssn
end try
begin catch
select 'please enter valid data'
end catch

go
-------------------------------------------
create procedure delete_student_course @id int=-1,@ssn int=-1
as 
if @id!=-1 and @ssn!=-1
delete from Student_course
where crs_id=@id and std_ssn=@ssn
else if  @id!=-1 and @ssn=-1
delete from Student_course
where crs_id=@id
else if @id=-1 and @ssn!=-1
delete from Student_course
where std_ssn=@ssn

go


---------------------------------
--heba stored and trigger
--select all from question table
create proc select_question @qustion_id int=0
as
if @qustion_id !=0 
select q.id as [QuestionID],q.model_ans as [Model Answer],q.title as [Question Title], q.grade as [Question Grade] 
,q.type as [Question Type], q.crs_id as [Course Id],c.name as [Course Name]
from Question q inner join Course c on q.crs_id=c.id
where q.id= @qustion_id
else 
select q.id as [QuestionID],q.model_ans as [Model Answer],q.title as [Question Title], q.grade as [Question Grade] 
,q.type as [Question Type], q.crs_id as [Course Id],c.name as [Course Name]
from Question q inner join Course c on q.crs_id=c.id
--select all from question-choices table
go
create proc select_allquestion_choices @id int=0
as
if @id !=0
select ques_id as [QuestionId],choice as [Choices]  from Question_Choices 
where ques_id=@id
else
select ques_id as [QuestionId],choice as [Choices]  from Question_Choices 



--insert all values into question table
go
create proc insert_question @model_answer nvarchar(90),@title nvarchar(max),@grade int,@type nvarchar(max),@course_id int
as
begin try
insert into Question
values(@model_answer,@title,@grade,@type,@course_id)
select 'data inserted successfully'
end try
begin catch
select 'an error happend from insert_question proc'
end catch



--insert all values into question-choices table
go
create proc insert_question_choices @question_id int,@choice nvarchar(90)
as
begin try
insert into Question_Choices
values(@question_id,@choice)
end try
begin catch
select 'an error happend from insert_question_choices proc [this id not exist]'
end catch


--delete based on id from question table
go
create proc delete_question @qustion_id int
as
delete from Question_Choices where ques_id =@qustion_id
delete from Exam_std_quest where quest_id=@qustion_id
delete from Question
where id=@qustion_id


--delete based on id from question-choices table
go
create proc delete_question_choices @qustion_id int
as
delete from Question_Choices where ques_id=@qustion_id


--update question table
go

create proc update_question @qustion_id int,
@model_answer nvarchar(90)='NA'
,@title nvarchar(max)='NA'
,@grade int=0
,@type nvarchar(max)='NA'
,@course_id int=0
as
if exists(select id from Question where id=@qustion_id)
begin
begin try

if @model_answer != 'NA'
update Question set model_ans=@model_answer where id= @qustion_id
if @title != 'NA'
update Question set title=@title where id = @qustion_id
if @grade != 0
update Question set grade=@grade where id = @qustion_id
if @type != 'NA'
update Question set type=@type where id = @qustion_id
if @course_id != 0
update Question set crs_id=@course_id where id = @qustion_id

end try
begin catch
select 'an error happend from update_question proc'
end catch
end



--update question-choices table
go
create proc update_question_choice @qustion_id int,@choice nvarchar(90),@oldchoice nvarchar(90)
as
begin try
update Question_Choices set choice=@choice
where ques_id=@qustion_id and choice=@oldchoice
end try
begin catch
select 'an error happend from update_question_choice proc'
end catch

go

create trigger tr_delete
on question
instead of delete 
as select 'it is not allowed to delete'

go
--*--------------------------------
--taha stored proc


--select from InstructorCourse
create proc select_instructor_Course @ins_id int=0 ,@crs_id int =0
as 
if(@ins_id=0 and @crs_id<>0)
	select crs_id as courseID ,c.name as courseName,ins_id as instructorID ,i.ins_name InstructorName   from Instructor_course ic
	inner join Course c on ic.crs_id=c.id  inner join Instructor i on i.ins_ssn=ic.ins_id
	where ic.crs_id=@crs_id
else if(@crs_id=0 and @ins_id<>0)
	select crs_id as courseID ,c.name as courseName,ins_id as instructorID ,i.ins_name InstructorName   from Instructor_course ic
	inner join Course c on ic.crs_id=c.id  inner join Instructor i on i.ins_ssn=ic.ins_id
	where ic.ins_id=@ins_id
else if(@ins_id=0 and @crs_id=0)
	select crs_id as courseID ,c.name as courseName,ins_id as instructorID ,i.ins_name InstructorName   from Instructor_course ic
	inner join Course c on ic.crs_id=c.id  inner join Instructor i on i.ins_ssn=ic.ins_id
else 
	select crs_id as courseID ,c.name as courseName,ins_id as instructorID ,i.ins_name InstructorName   from Instructor_course ic
	inner join Course c on ic.crs_id=c.id  inner join Instructor i on i.ins_ssn=ic.ins_id
	where ic.crs_id=@crs_id and ic.ins_id=@ins_id



go

--insert into Instructor_Course
create proc insert_instructor_Course @ins_id int ,@crs_id int
as
begin try
insert into Instructor_course values(@crs_id,@ins_id)
end try
begin catch
select 'please enter valid data'
end catch

go
--update instructor_Course
create proc update_instructor_Course @crs_id int , @ins_id int,@ins_newId int=0 , @crs_newId int=0
as
begin try 
if(@ins_newId<>0)
	update Instructor_course set ins_id=@ins_newId where crs_id=@crs_id and ins_id=@ins_id
if(@crs_newId<>0 and @ins_newId=0)
	update Instructor_course set crs_id=@crs_newId where crs_id=@crs_id and ins_id=@ins_id
if(@crs_newId<>0 and @ins_newId<>0)
	update Instructor_course set crs_id=@crs_newId where crs_id=@crs_id and ins_id=@ins_newId
end try
begin catch
select 'please enter valid data'
end catch

go

--delete instructor_course
create proc delete_instructor_Course @ins_id int = 0,@crs_id int =0
as 
if(@ins_id<>0 and @crs_id =0)
delete from Instructor_course where ins_id=@ins_id
else if (@ins_id =0 and @crs_id <>0)
	delete from Instructor_course where crs_id=@crs_id
else if(@ins_id<>0 and @crs_id<>0) 
	delete from Instructor_course where ins_id=@ins_id and crs_id=@crs_id

go


--select from exam_std_quest
create proc select_exStdQuest @ex_id int=0 , @std_id int =0 , @quest_id int =0
as 
if (@ex_id<>0 and @std_id <>0 and @quest_id<>0)
	select  esq.ex_id examID , esq.std_ssn studentSSN,CONCAT(s.fname,' ',s.lname) StudentName, esq.quest_id QuestionID,q.title QuestionHeader,
	esq.date as ExamDate, esq.std_answer StudentAnswer
	from Exam_std_quest esq inner join Student s 
	on esq.std_ssn=s.ssn inner join Question q 
	on esq.quest_id=q.id inner join Exam e
	on esq.ex_id=e.id
	where esq.ex_id=@ex_id and esq.std_ssn=@std_id and esq.quest_id=@quest_id
	else
	select  esq.ex_id examID , esq.std_ssn studentSSN,CONCAT(s.fname,' ',s.lname) StudentName, esq.quest_id QuestionID,q.title QuestionHeader,
	esq.date as ExamDate, esq.std_answer StudentAnswer
	from Exam_std_quest esq inner join Student s 
	on esq.std_ssn=s.ssn inner join Question q 
	on esq.quest_id=q.id inner join Exam e
	on esq.ex_id=e.id

go
--insert into exam_std_quest
create proc insert_exStdQuest @ex_id int , @quest_id int ,@std_ssn int , @date date , @std_answer nvarchar(100)
as
begin try
insert into Exam_std_quest values(@ex_id,@quest_id,@std_ssn,@date,@std_answer)
end try
begin catch
select 'Please enter valid data'
end catch 
go

--update exam_std_quest
create proc update_exStdQuest @ex_id int,@quest_id int,@std_ssn int ,@date date ='',@std_answer nvarchar(100)=''
as
begin try
if(@date<>'')
	update Exam_std_quest set date=@date where ex_id=@ex_id and quest_id=@quest_id and std_ssn=@std_ssn
if(@std_answer<>'')
update Exam_std_quest set std_answer=@std_answer where ex_id=@ex_id and quest_id=@quest_id and std_ssn=@std_ssn
end try
begin catch
select 'Please enter valid data'
end catch

go
--delete from exam_std_quest
create proc delete_exStdQuest @ex_id int =0,@quest_id int =0,@std_ssn int =0
as
if(@ex_id<>0 and @quest_id=0 and @std_ssn=0)
	delete from Exam_std_quest where ex_id=@ex_id
else if (@ex_id=0 and @quest_id<>0 and @std_ssn=0)
	delete from Exam_std_quest where quest_id=@quest_id
else if (@ex_id=0 and @quest_id=0 and @std_ssn<>0)
	delete from Exam_std_quest where std_ssn=@std_ssn
else if (@ex_id<>0 and @quest_id<>0 and @std_ssn<>0)
	delete from Exam_std_quest where quest_id=@quest_id and ex_id=@ex_id and std_ssn=@std_ssn
else 
	select 'you must enter either examId or StudentSSN or Question ID or ALL'

	go


----------------------------------------
--exam stored proc

create proc Exam_Generation @crs_type nvarchar(50), @std_ssn int , @t_fQ int , @M_Q int
as
if (@t_fQ + @M_Q <>10)
select 'Enter valid number of question'
else 
begin
begin try
declare @crs_id int
declare @questions table (quest_id int)
-- create new exam
select @crs_id=id from Course where name=@crs_type
insert into Exam values (60,@crs_id)
-- insert question 

insert into @questions
select top(@t_fQ) id from Question 
where type='t/f'and crs_id=@crs_id
order by NEWID()
--
insert into @questions
select top(@M_Q) id from Question 
where type='mcq'and crs_id=@crs_id
order by NEWID()
-- create new exam  
-- generated 10 question
declare @CurrentExam_id int 
select top(1)@CurrentExam_id=id from Exam order by id desc
declare c1 cursor
for select * from @questions
for read only
declare @id int 
open c1 
fetch c1 into @id
while @@FETCH_STATUS=0
begin
insert into Exam_std_quest values (@CurrentExam_id,@id,@std_ssn,GETDATE(),null)
fetch c1 into @id
end
close c1 
deallocate c1
select * from Exam_std_quest esq
inner join Question q
on esq.quest_id=q.id
where
ex_id=@CurrentExam_id and std_ssn=@std_ssn 
order by quest_id
end try
begin catch
select 'An error has occured'
end catch 
end

go

-- procedure to enter answers
create proc ExamAnswers @exam_id int ,@std_id int ,
@a1 nvarchar(20),@a2 nvarchar(20),@a3 nvarchar(20),@a4 nvarchar(20),
@a5 nvarchar(20),@a6 nvarchar(20),@a7 nvarchar(20),@a8 nvarchar(20),
@a9 nvarchar(20),@a10 nvarchar(20)
as 
-- 
if exists(select * from Exam_std_quest where ex_id=@exam_id and std_ssn=@std_id)
begin
begin try
declare @answers_table table(ans nvarchar(20))
insert into @answers_table values(@a1),(@a2),(@a3),(@a4),(@a5),(@a6),(@a7),(@a8),(@a9),(@a10)
declare c1 cursor
for select quest_id from Exam_std_quest where ex_id=@exam_id and std_ssn=@std_id
for read only
declare @question_id int 
open c1 
fetch c1 into @question_id
declare c2 cursor
for select ans from @answers_table 
for read only
declare @ans nvarchar(20) 
open c2 
fetch c2 into @ans
while @@FETCH_STATUS=0
begin
update Exam_std_quest set std_answer =@ans where ex_id=@exam_id and std_ssn=@std_id and quest_id=@question_id
fetch c1 into @question_id
fetch c2 into @ans
end
close c1 
close c2
deallocate c1
deallocate c2
end try
begin catch
select 'An error has occured'
end catch
end
else 
select 'enter valid data'

--
go


--
create proc Exam_Correction	@exam_id int , @std_id int
as
declare @Totalgrade decimal(5,1)=0
declare @studentgrade decimal(5,1)=0 
declare @percent decimal(5,1)=0
declare c1 cursor
for select std_answer,model_ans,grade from Exam_std_quest esq inner join Question q on
esq.quest_id=q.id 
where ex_id=@exam_id and std_ssn=@std_id
for read only
declare @studentAnswer nvarchar(20)
declare @model_answer nvarchar(20)
declare @grade int
open c1 
fetch c1 into @studentAnswer,@model_answer,@grade
while @@FETCH_STATUS=0
begin
	if(TRIM(@studentAnswer)=TRIM(@model_answer))
		begin
			set @Totalgrade+=@grade
			set @studentgrade+=@grade
		end
	else 
	begin
	set @Totalgrade+=@grade
	end
	set @percent = (@studentgrade/@Totalgrade)*100
fetch c1 into @studentAnswer,@model_answer,@grade
end
select CONCAT(@percent,'%') as StudentGrade
close c1 
deallocate c1
declare @crs_id int
select @crs_id=e.crs_id from Exam_std_quest esq inner join Exam e
on e.id = esq.ex_id
where esq.std_ssn=@std_id and esq.ex_id=@exam_id
update Student_course set grade = @percent
where crs_id=@crs_id and std_ssn=@std_id

go
------------------------------
--report stored proc

create proc StudentInfoR1 @dept_no int
as
select s.ssn,s.fname,s.lname,s.email,s.address,s.age,d.dept_name from Student s inner join Department d 
on s.dept_id=d.dept_id
where s.dept_id=@dept_no

go

create proc StudentGradesR2 @std_id int
as
select sc.std_ssn,c.name,sc.grade from Student_course sc inner join Course c
on c.id=sc.crs_id 
where sc.std_ssn=@std_id

go



create proc InstructorCoursesR3 @ins_id int
as
select i.ins_name,c.name,Count(sc.crs_id) as [Student No] from Instructor_course ic inner join Instructor i
on ic.ins_id=i.ins_ssn inner join Student_course sc
on sc.crs_id=ic.crs_id inner join Course c
on c.id=sc.crs_id
where i.ins_ssn=@ins_id
group by i.ins_name,c.name

go

create proc CourseTopics @crs_id int
as
select c.name as [course Name],t.name as [topic Name] from Course c inner join Topic t
on c.id=t.crs_id
where c.id=@crs_id

go

create proc StudentAnswersR6  @ex_id int ,@std_id int
as
select esq.std_ssn, q.title,esq.std_answer ,q.model_ans from Exam_std_quest esq inner join Question q 
on esq.quest_id=q.id 
where esq.ex_id=@ex_id and esq.std_ssn=@std_id

go


-- this is the free form report
create proc freeFormReport @ex_id int 
as
declare @counter int =1
declare c1 cursor 
for 
select q.title,LEAD(q.title) over (order by id) as titleNext ,qc.choice from Question q inner join Question_Choices qc 
on q.id=qc.ques_id inner join Exam_std_quest esq on 
esq.quest_id=q.id where esq.ex_id=@ex_id
for read only
declare @currentTitle nvarchar(200),@nextTitle nvarchar(200),@choice nvarchar(200)
declare @showTable table (title nvarchar(200),choice nvarchar(200))
open c1
fetch c1 into @currentTitle,@nextTitle,@choice 
while @@FETCH_STATUS=0
begin
declare @title nvarchar(200)= concat(@counter,') ',@currentTitle)
insert into @showTable values (@title,@choice)
if @currentTitle<>@nextTitle
set @counter=@counter+1
fetch c1 into @currentTitle,@nextTitle,@choice 
end
close c1 
deallocate c1
select * from @showTable
