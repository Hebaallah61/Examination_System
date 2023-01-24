window.repositoryObject = {"parameters":[{"name":"ex_id","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]},{"name":"std_id","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]},{"name":"quest_id","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p384","name":"dbo.select_exStdQuest","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Exam System Project","id":"d11"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"select_exStdQuest"},{"field":"Type","value":"Procedure"}],"script":"--select from exam_std_quest\r\ncreate proc select_exStdQuest @ex_id int=0 , @std_id int =0 , @quest_id int =0\r\nas \r\nif (@ex_id<>0 and @std_id <>0 and @quest_id<>0)\r\n\tselect  esq.ex_id examID , esq.std_ssn studentSSN,CONCAT(s.fname,' ',s.lname) StudentName, esq.quest_id QuestionID,q.title QuestionHeader,\r\n\tesq.date as ExamDate, esq.std_answer StudentAnswer\r\n\tfrom Exam_std_quest esq inner join Student s \r\n\ton esq.std_ssn=s.ssn inner join Question q \r\n\ton esq.quest_id=q.id inner join Exam e\r\n\ton esq.ex_id=e.id\r\n\twhere esq.ex_id=@ex_id and esq.std_ssn=@std_id and esq.quest_id=@quest_id\r\n\telse\r\n\tselect  esq.ex_id examID , esq.std_ssn studentSSN,CONCAT(s.fname,' ',s.lname) StudentName, esq.quest_id QuestionID,q.title QuestionHeader,\r\n\tesq.date as ExamDate, esq.std_answer StudentAnswer\r\n\tfrom Exam_std_quest esq inner join Student s \r\n\ton esq.std_ssn=s.ssn inner join Question q \r\n\ton esq.quest_id=q.id inner join Exam e\r\n\ton esq.ex_id=e.id","imported_at":"2023-01-17 08:53"};