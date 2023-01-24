window.repositoryObject = {"parameters":[{"name":"exam_id","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]},{"name":"std_id","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p402","name":"ExamStored.Exam_Correction","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Exam System Project","id":"d11"}},{"field":"Schema","value":"ExamStored"},{"field":"Name","value":"Exam_Correction"},{"field":"Type","value":"Procedure"}],"script":"--\r\ncreate proc Exam_Correction\t@exam_id int , @std_id int\r\nas\r\ndeclare @Totalgrade decimal(5,1)=0\r\ndeclare @studentgrade decimal(5,1)=0 \r\ndeclare @percent decimal(5,1)=0\r\ndeclare c1 cursor\r\nfor select std_answer,model_ans,grade from Exam_std_quest esq inner join Question q on\r\nesq.quest_id=q.id \r\nwhere ex_id=@exam_id and std_ssn=@std_id\r\nfor read only\r\ndeclare @studentAnswer nvarchar(20)\r\ndeclare @model_answer nvarchar(20)\r\ndeclare @grade int\r\nopen c1 \r\nfetch c1 into @studentAnswer,@model_answer,@grade\r\nwhile @@FETCH_STATUS=0\r\nbegin\r\n\tif(TRIM(@studentAnswer)=TRIM(@model_answer))\r\n\t\tbegin\r\n\t\t\tset @Totalgrade+=@grade\r\n\t\t\tset @studentgrade+=@grade\r\n\t\tend\r\n\telse \r\n\tbegin\r\n\tset @Totalgrade+=@grade\r\n\tend\r\n\tset @percent = (@studentgrade/@Totalgrade)*100\r\nfetch c1 into @studentAnswer,@model_answer,@grade\r\nend\r\nselect CONCAT(@percent,'%') as StudentGrade\r\nclose c1 \r\ndeallocate c1\r\ndeclare @crs_id int\r\nselect @crs_id=e.crs_id from Exam_std_quest esq inner join Exam e\r\non e.id = esq.ex_id\r\nwhere esq.std_ssn=@std_id and esq.ex_id=@exam_id\r\nupdate Student_course set grade = @percent\r\nwhere crs_id=@crs_id and std_ssn=@std_id","imported_at":"2023-01-17 08:53"};