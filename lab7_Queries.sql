use [t2311e_lab7]

--cau 4
select name from users;
select number from phone_numbers;

--cau 5
select name from users order by name asc;
select number from phone_numbers where user_id in
	(select id from users where name = 'Nguyen Van An');
select name from users where dob = '2009-12-12';

--cau 6
select user_id, count(number) as 'number_count' from phone_numbers group by user_id;
select count(id) as 'born_in_december' from users where month(users.dob) = month('2000-12-12');
select phone_numbers.*, name, address, dob from phone_numbers
	left join users on phone_numbers.user_id = users.id;
select * from users where id in 
	(select user_id from phone_numbers where number = '123456789');

--cau 7
begin transaction change_dob
	update users set dob = DATEADD(day, -1, cast(getdate() as datetime)) where users.id = 1; --chi cap nhat ngay sinh cho user co id 1, tranh cap nhat toan bo db
	select * from users;
rollback;

--primary keys
SELECT 
    t.name AS table_name,
    c.name AS column_name,
    ix.name AS primary_key_name
FROM 
    sys.tables AS t
JOIN 
    sys.indexes AS ix ON t.object_id = ix.object_id
JOIN 
    sys.index_columns AS ic ON ix.object_id = ic.object_id AND ix.index_id = ic.index_id
JOIN 
    sys.columns AS c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE 
    ix.is_primary_key = 1
ORDER BY 
    t.name, ix.name, ic.key_ordinal;

--foreign keys
SELECT 
    fk.name AS foreign_key_name,
    OBJECT_NAME(fk.parent_object_id) AS child_table,
    c1.name AS child_column,
    OBJECT_NAME(fk.referenced_object_id) AS parent_table,
    c2.name AS parent_column
FROM 
    sys.foreign_keys AS fk
INNER JOIN 
    sys.foreign_key_columns AS fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN 
    sys.columns AS c1 ON fkc.parent_object_id = c1.object_id AND fkc.parent_column_id = c1.column_id
INNER JOIN 
    sys.columns AS c2 ON fkc.referenced_object_id = c2.object_id AND fkc.referenced_column_id = c2.column_id
ORDER BY 
    child_table, foreign_key_name;

--add column contact_start_date
begin transaction add_contact_start_date
	alter table phone_numbers add contact_start_date datetime;
	select * from phone_numbers;
rollback;

--cau 8
if not exists (select * from sys.indexes where name = 'IX_HoTen') create index IX_HoTen on users(name);
if not exists (select * from sys.indexes where name = 'IX_SoDienThoai') create index IX_SoDienThoai on phone_numbers(number);