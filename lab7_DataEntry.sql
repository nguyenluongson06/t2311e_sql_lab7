use [t2311e_lab7]

insert into users(name, address, dob)
	values('Nguyen Van An', '111 Nguyen Trai, Thanh Xuan, Ha Noi', '1987-11-18'),
	('Tran Khanh Binh', '25 Dai Mo, Nam Tu Liem, Ha Noi', '1997-05-04'),
	('Le Minh Anh', '42 Tran Huu Tuoc, Dong Da, Ha Noi', '1995-10-10'),
	('Nguyen Van Nam', '125 Nguyen Trai, Thanh Xuan, Ha Noi', '1987-12-12');

insert into phone_numbers(user_id, number)
	values(1, '987654321'),
	(1, '09873452'),
	(1, '09832323'),
	(1, '09439433'),
	(2, '03622469'),
	(3, '03589554'),
	(3, '03549891'),
	(4, '123456789');
	
select * from users;
select * from phone_numbers;