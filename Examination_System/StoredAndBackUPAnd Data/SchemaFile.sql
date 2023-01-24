select * from Student
create schema ExamStored
alter schema ExamStored transfer [dbo].[Exam_Correction]
alter schema ExamStored transfer [dbo].[Exam_Generation]
alter schema ExamStored transfer [dbo].[ExamAnswers]


create schema Reports
alter schema Reports transfer [dbo].[StudentInfoR1] 
alter schema Reports transfer [dbo].[StudentGradesR2]
alter schema Reports transfer [dbo].[InstructorCoursesR3]
alter schema Reports transfer [dbo].[CourseTopics]
alter schema Reports transfer [dbo].[freeFormReport]
alter schema Reports transfer [dbo].[StudentAnswersR6]