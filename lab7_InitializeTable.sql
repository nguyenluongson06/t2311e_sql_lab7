use [t2311e_lab7]

drop table if exists users, phone_numbers;

create table users(
	id int not null primary key identity(1,1),
	name varchar(50) not null,
	address text,
	dob datetime,
)

create table phone_numbers(
	user_id int foreign key references users(id),
	number varchar(20) not null,
)