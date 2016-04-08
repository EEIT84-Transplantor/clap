use clap 

drop table creditcard
drop table giftcard
drop table promocode
drop table promo
drop table Member
drop table hospital 
drop table message

create table member(
mb_email varchar(320) NOT NULL,
mb_password  varbinary(256) NOT NULL,
mb_name varchar(50),
mb_phone char(10),
mb_contenttype varchar(30),
mb_photo image,
mb_oneclick bit,
hp_id int,
cc_number char(16),
mb_autorenew bit,
mb_expire date,
gc_amount float
primary key(mb_email))


insert into Member values
('caca@gmail.com',CONVERT(VARBINARY, 'caca'), 'caca', '0912345678', null , null, 0, null, null, 0, '2016-05-04', 0);
insert into Member values
('andrew@gmail.com',CONVERT(VARBINARY, 'andrew'), 'andrew', '0912345678', null , null, 0, null, null, 0, '2016-06-04', 0);
insert into Member values
('lee@gmail.com',CONVERT(VARBINARY, 'lee'), 'lee', '0912345678', null , null, 0, null, null, 0, '2016-07-04', 0);
insert into Member values
('poan@gmail.com',CONVERT(VARBINARY, 'poan'), 'poan', '0912345678', null , null, 0, null, null, 0, '2016-08-04', 0);
select*from Member
------------------------------------------------------------------------------------------------------------------------------------------------
create table creditcard(
mb_email varchar(320) FOREIGN KEY REFERENCES Member(mb_email),
cc_number varchar(50) ,
cc_goodthru varchar(50) NOT NULL,
cc_cvv varchar(10) NOT NULL,
PRIMARY KEY (mb_email, cc_number)
)


insert into creditcard(mb_email,cc_number,cc_goodthru,cc_cvv) values('caca@gmail.com','1111222233335555','12/30','444');
insert into creditcard(mb_email,cc_number,cc_goodthru,cc_cvv) values('caca@gmail.com','1111222233334444','12/22','555');
insert into creditcard(mb_email,cc_number,cc_goodthru,cc_cvv) values('lee@gmail.com','5555666677778888','01/18','666');
select*from creditcard
------------------------------------------------------------------------------------------------------------------------------------------------
create table giftcard(
gc_number varchar(16) PRIMARY KEY,
gc_code varchar(10) NOT NULL,
gc_amount float NOT NULL,
gc_available int NOT NULL
)


insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('1111','gccode1',1000,1);
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('2222','gccode2',500,0);
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('4444','gccode4',500,1);
select * from giftcard
------------------------------------------------------------------------------------------------------------------------------------------------
create table promo(
pm_code varchar(50) PRIMARY KEY,
pd_category varchar(50) NOT NULL,
pm_expire date NOT NULL,
pm_tiltle varchar(50) NOT NULL,
pm_discount float NOT NULL
)


insert into promo(pm_code,pd_category,pm_expire,pm_tiltle,pm_discount) values('111','heart','2016-5-20','50% OFF',0.5);
insert into promo(pm_code,pd_category,pm_expire,pm_tiltle,pm_discount) values('222','lung','2016-5-20','40% OFF',0.6);
insert into promo(pm_code,pd_category,pm_expire,pm_tiltle,pm_discount) values('333','heart','2016-5-20','30% OFF',0.7);
select * from promo
------------------------------------------------------------------------------------------------------------------------------------------------
create table promocode(
mb_email varchar(320) FOREIGN KEY REFERENCES Member(mb_email),
pm_code varchar(50) FOREIGN KEY REFERENCES promo(pm_code),
PRIMARY KEY (mb_email, pm_code)
)

insert into promocode(mb_email,pm_code) values('caca@gmail.com','111');
insert into promocode(mb_email,pm_code) values('caca@gmail.com','222');
insert into promocode(mb_email,pm_code) values('lee@gmail.com','333');
select * from promocode
------------------------------------------------------------------------------------------------------------------------------------------------
create table hospital(
hp_id int primary key identity,
hp_name nvarchar(50) not null,
hp_address nvarchar(50) not null
)

insert hospital values('NTUH', '100 Renai Road');
insert hospital values('NCKUH', '100 Renai Road');
insert hospital values('超級醫院', '100 Renai Road');
select * from hospital
------------------------------------------------------------------------------------------------------------------------------------------------
create table message (
message_Id int primary key identity,
mb_email varchar(320) FOREIGN KEY REFERENCES Member(mb_email) ,
message_sender varchar(50) not null,
message_subject varchar(500),
message_content varchar(max),
message_date datetime ,
message_deleted bit)

insert into message values('lee@gmail.com', 'caca@gmail.com', 'Hello i am caca', 'test test', CURRENT_TIMESTAMP, 0);
insert into message values('andrew@gmail.com', 'caca@gmail.com', 'Hello i am caca', 'test test', CURRENT_TIMESTAMP, 0);
insert into message values('caca@gmail.com', 'caca@gmail.com', 'Hello i am caca', 'test test', CURRENT_TIMESTAMP, 0);
insert into message values('poan@gmail.com', 'caca@gmail.com', 'Hello i am caca', 'test test', CURRENT_TIMESTAMP, 0);
insert into message values('lee@gmail.com', 'lee@gmail.com', 'Hello i am leelee', 'test test', CURRENT_TIMESTAMP, 0);
insert into message values('andrew@gmail.com', 'lee@gmail.com', 'Hello i am leelee', 'test test', CURRENT_TIMESTAMP, 0);
insert into message values('caca@gmail.com', 'lee@gmail.com', 'Hello i am leelee', 'test test', CURRENT_TIMESTAMP, 0);
insert into message values('poan@gmail.com', 'lee@gmail.com', 'Hello i am leelee', 'test test', CURRENT_TIMESTAMP, 0);


select * from message
