window.repositoryObject = {"columns_custom_fields":[],"relations_custom_fields":[],"unique_keys_custom_fields":[],"triggers_custom_fields":[],"columns":[{"id":"column-34770","object_id":"column-34770","name":"ssn","name_without_path":"ssn","description":null,"is_pk":true,"is_identity":false,"data_type":"int","data_length":null,"is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-34771","object_id":"column-34771","name":"fname","name_without_path":"fname","description":null,"is_pk":false,"is_identity":false,"data_type":"nvarchar","data_length":"70","is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-34772","object_id":"column-34772","name":"lname","name_without_path":"lname","description":null,"is_pk":false,"is_identity":false,"data_type":"nvarchar","data_length":"70","is_nullable":true,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-34773","object_id":"column-34773","name":"age","name_without_path":"age","description":null,"is_pk":false,"is_identity":false,"data_type":"int","data_length":null,"is_nullable":true,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-34774","object_id":"column-34774","name":"address","name_without_path":"address","description":null,"is_pk":false,"is_identity":false,"data_type":"nvarchar","data_length":"90","is_nullable":true,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-34775","object_id":"column-34775","name":"email","name_without_path":"email","description":null,"is_pk":false,"is_identity":false,"data_type":"nvarchar","data_length":"70","is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-34776","object_id":"column-34776","name":"dept_id","name_without_path":"dept_id","description":null,"is_pk":false,"is_identity":false,"data_type":"int","data_length":null,"is_nullable":true,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[{"id":"t3762","name":"dbo.Department","name_show_schema":"dbo.Department"}],"linked_lookup":null}],"relations":[{"name":"FK_Student_Department","title":null,"description":null,"is_user_defined":false,"foreign_table":"dbo.Student","foreign_table_show_schema":"dbo.Student","foreign_table_verbose":"dbo.Student","foreign_table_verbose_show_schema":"dbo.Student","foreign_table_object_id":"t3769","primary_table":"dbo.Department","primary_table_show_schema":"dbo.Department","primary_table_verbose":"dbo.Department","primary_table_verbose_show_schema":"dbo.Department","primary_table_object_id":"t3762","pk_cardinality":"1x","fk_cardinality":"mx","constraints":[{"primary_column_path":null,"primary_column":"dept_id","foreign_column_path":null,"foreign_column":"dept_id"}],"custom_fields":{}},{"name":"FK_Exam_std_quest_Student","title":null,"description":null,"is_user_defined":false,"foreign_table":"dbo.Exam_std_quest","foreign_table_show_schema":"dbo.Exam_std_quest","foreign_table_verbose":"dbo.Exam_std_quest","foreign_table_verbose_show_schema":"dbo.Exam_std_quest","foreign_table_object_id":"t3764","primary_table":"dbo.Student","primary_table_show_schema":"dbo.Student","primary_table_verbose":"dbo.Student","primary_table_verbose_show_schema":"dbo.Student","primary_table_object_id":"t3769","pk_cardinality":"1x","fk_cardinality":"mx","constraints":[{"primary_column_path":null,"primary_column":"ssn","foreign_column_path":null,"foreign_column":"std_ssn"}],"custom_fields":{}},{"name":"FK_Student_course_Student","title":null,"description":null,"is_user_defined":false,"foreign_table":"dbo.Student_course","foreign_table_show_schema":"dbo.Student_course","foreign_table_verbose":"dbo.Student_course","foreign_table_verbose_show_schema":"dbo.Student_course","foreign_table_object_id":"t3770","primary_table":"dbo.Student","primary_table_show_schema":"dbo.Student","primary_table_verbose":"dbo.Student","primary_table_verbose_show_schema":"dbo.Student","primary_table_object_id":"t3769","pk_cardinality":"1x","fk_cardinality":"mx","constraints":[{"primary_column_path":null,"primary_column":"ssn","foreign_column_path":null,"foreign_column":"std_ssn"}],"custom_fields":{}}],"unique_keys":[{"name":"PK_Student","description":null,"is_pk":true,"is_user_defined":false,"columns":[{"path":null,"name_without_path":"ssn","name":"ssn"}],"custom_fields":{}}],"triggers":[],"dependencies":{"uses":[{"object_name":"dbo.Student","object_name_show_schema":"dbo.Student","object_type":"TABLE","object_id":"t3769","type":"NORMAL","object_user_defined":false,"user_defined":false,"children":[{"object_name":"dbo.Department","object_name_show_schema":"dbo.Department","object_type":"TABLE","object_id":"t3762","type":"RELATION","pk_cardinality":"1x","fk_cardinality":"mx","object_user_defined":false,"user_defined":false,"children":[]}]}],"used_by":[{"object_name":"dbo.Student","object_name_show_schema":"dbo.Student","object_type":"TABLE","object_id":"t3769","type":"NORMAL","object_user_defined":false,"user_defined":false,"children":[{"object_name":"dbo.Exam_std_quest","object_name_show_schema":"dbo.Exam_std_quest","object_type":"TABLE","object_id":"t3764","type":"RELATION","pk_cardinality":"1x","fk_cardinality":"mx","object_user_defined":false,"user_defined":false,"children":[]},{"object_name":"dbo.Student_course","object_name_show_schema":"dbo.Student_course","object_type":"TABLE","object_id":"t3770","type":"RELATION","pk_cardinality":"1x","fk_cardinality":"mx","object_user_defined":false,"user_defined":false,"children":[]}]}]},"object_id":"t3769","name":"dbo.Student","subtype":"TABLE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Exam System Project","id":"d11"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"Student"},{"field":"Type","value":"Table"}],"script":"","imported_at":"2023-01-17 08:53"};