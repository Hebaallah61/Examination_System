window.repositoryObject = {"parameters":[{"name":"id","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p368","name":"dbo.delete_topic","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Exam System Project","id":"d11"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"delete_topic"},{"field":"Type","value":"Procedure"}],"script":"---delete topic \r\ncreate proc delete_topic @id int \r\nas\r\ndelete from Topic where id=@id","imported_at":"2023-01-17 08:53"};