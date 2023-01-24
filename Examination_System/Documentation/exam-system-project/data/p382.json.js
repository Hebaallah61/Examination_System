window.repositoryObject = {"parameters":[{"name":"id","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]},{"name":"name","description":null,"mode":"IN","data_type":"nvarchar(50)","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p382","name":"dbo.select_department","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Exam System Project","id":"d11"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"select_department"},{"field":"Type","value":"Procedure"}],"script":"-----------------------------------------------------------------------------------------------\r\n---department \r\ncreate proc select_department @id int =-1 , @name nvarchar(50)=' ' \r\nas\r\nif @id=-1 and @name!=' ' \r\nbegin \r\nif exists (select dept_name from Department where dept_name=@name )\r\nselect dept_id as [dept id] , dept_name as [dept name] from Department where dept_name=@name \r\nelse select 'department not found' \r\nend\r\nelse if @id!=-1 and @name=' ' \r\nbegin \r\nif exists (select dept_id from Department where dept_id=@id )\r\nselect dept_id as [dept id] , dept_name as [dept name] from Department where dept_id=@id\r\nelse select 'department not found' \r\nend\r\nelse \r\nselect dept_id as [dept id] , dept_name as [dept name] from Department","imported_at":"2023-01-17 08:53"};