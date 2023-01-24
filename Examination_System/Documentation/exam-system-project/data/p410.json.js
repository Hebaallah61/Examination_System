window.repositoryObject = {"parameters":[{"name":"dept_no","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p410","name":"Reports.StudentInfoR1","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Exam System Project","id":"d11"}},{"field":"Schema","value":"Reports"},{"field":"Name","value":"StudentInfoR1"},{"field":"Type","value":"Procedure"}],"script":"------------------------------\r\n--report stored proc\r\n\r\ncreate proc StudentInfoR1 @dept_no int\r\nas\r\nselect s.ssn,s.fname,s.lname,s.email,s.address,s.age,d.dept_name from Student s inner join Department d \r\non s.dept_id=d.dept_id\r\nwhere s.dept_id=@dept_no","imported_at":"2023-01-17 08:53"};