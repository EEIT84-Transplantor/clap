use clap 
drop table cart 
drop table orderdetail
drop table orderform
drop table doctor 
drop table productimg 
drop table inoutlog
drop table inventory
drop table product
drop table creditcard
drop table giftcard
drop table promocode
drop table promo
drop table category
drop table hospital 
drop table message
drop table member

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
create table category (
category_id	int,
category_name varchar(60)
PRIMARY KEY (category_id)
)

insert into category values(1,'Kidneys');
insert into category values(2,'Ureters');
insert into category values(3,'Bladder');
insert into category values(4,'Urethra');
insert into category values(5,'Ovaries');
insert into category values(6,'Fallopian tubes');
insert into category values(7,'Uterus');
insert into category values(8,'Vagina');
insert into category values(9,'Vulva');
insert into category values(10,'Clitoris');
select * from category
------------------------------------------------------------------------------------------------------------------------------------------------
create table promo(
pm_code varchar(50) PRIMARY KEY,
pd_category int NOT NULL FOREIGN KEY REFERENCES category(category_id),
pm_expire date NOT NULL,
pm_title varchar(50) NOT NULL,
pm_discount float NOT NULL
)


insert into promo(pm_code,pd_category,pm_expire,pm_title,pm_discount) values('111',1,'2016-5-20','50% OFF',0.5);
insert into promo(pm_code,pd_category,pm_expire,pm_title,pm_discount) values('222',2,'2016-5-20','40% OFF',0.6);
insert into promo(pm_code,pd_category,pm_expire,pm_title,pm_discount) values('333',3,'2016-5-20','30% OFF',0.7);
select * from promo
------------------------------------------------------------------------------------------------------------------------------------------------
create table promocode(
mb_email varchar(320) FOREIGN KEY REFERENCES Member(mb_email),
pm_code varchar(50) FOREIGN KEY REFERENCES promo(pm_code),
PRIMARY KEY (mb_email, pm_code)
)
go

insert into promocode(mb_email,pm_code) values('caca@gmail.com','111');
insert into promocode(mb_email,pm_code) values('caca@gmail.com','222');
insert into promocode(mb_email,pm_code) values('lee@gmail.com','333');
select * from promocode
------------------------------------------------------------------------------------------------------------------------------------------------
create table hospital(
hospital_id int primary key identity,
hospital_name nvarchar(50) not null,
hospital_address nvarchar(50) not null
)

insert into hospital values('NTUH', '100 Renai Road');
insert into hospital values('NCKUH', '100 Renai Road');
insert into hospital values('超級醫院', '100 Renai Road');
select * from hospital
------------------------------------------------------------------------------------------------------------------------------------------------
create table doctor(
doctor_id int primary key identity,
doctor_name nvarchar(50) not null
)

insert into doctor values('Dr. Wu');
insert into doctor values('Dr. Ma');
insert into doctor values('Dr. Ca');
select * from doctor

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


------------------------------------------------------------------------------------------------------------------------------------------------
create table product (
pd_Id int,
product_name	varchar(60),
product_price	float,
product_description	nvarchar(1000),
product_rating	int,
product_discount	float,
category_id int foreign key REFERENCES category(category_id)
PRIMARY KEY (pd_Id)
)
insert into product values(1, 'product1', 100, 'Heart1', 1, 0.9, 1);
insert into product values(2, 'product1', 200, 'Heart2', 1, 0.9, 1);
select * from product

------------------------------------------------------------------------------------------------------------------------------------------------
create table productimg (
pd_Id int FOREIGN KEY REFERENCES product(pd_id),
productimg_img image
PRIMARY KEY (pd_Id)
)
insert into productimg values(1, null);
insert into productimg values(2, null);
select * from productimg

------------------------------------------------------------------------------------------------------------------------------------------------
create table inventory (
inventory_id varchar(50),
pd_id	int FOREIGN KEY REFERENCES product(pd_id),
inventory_quantity	int,
inventory_manufactureDate datetime,
inventory_expiryDate datetime,
PRIMARY KEY (inventory_id)
)
insert into inventory values(1, 1, 10, '2016-05-04', '2017-05-04');
insert into inventory values(2, 2, 10, '2016-05-04', '2017-05-04');
insert into inventory values(3, 1, 10, '2016-05-04', '2017-05-04');
insert into inventory values(4, 2, 10, '2016-05-04', '2017-05-04');
select * from inventory

------------------------------------------------------------------------------------------------------------------------------------------------
create table inoutlog (
inoutlog_id	varchar(50),
inventory_id varchar(50) FOREIGN KEY REFERENCES inventory(inventory_Id),
pd_id int FOREIGN KEY REFERENCES product(pd_id),
inoutlog_inQuantity	int,
inoutlog_outQuantity	int,
inoutlog_manufactureDate	datetime,
inoutlog_expiryDate	datetime,
inoutlog_destination	nvarchar(100),
inoutlog_date	datetime
PRIMARY KEY (inoutlog_id)
)
insert into inoutlog values(1, 1, 1, 10, 0, '2016-05-04', '2017-05-04', 'Taipei', '2016-04-04');
insert into inoutlog values(2, 2, 1, 0, 43, '2016-05-04', '2017-05-04', 'Taipei', '2016-04-04');
insert into inoutlog values(3, 1, 1, 10, 0, '2016-03-04', '2017-06-04', 'Taipei', '2016-07-04');
insert into inoutlog values(4, 2, 1, 0, 43, '2016-02-04', '2017-03-04', 'Taipei', '2016-08-04');
select * from inoutlog

------------------------------------------------------------------------------------------------------------------------------------------------
create table cart (
mb_email varchar(320) FOREIGN KEY REFERENCES Member(mb_email) ,
pd_id int FOREIGN KEY REFERENCES product(pd_id) ,
ct_quantity int not null,
PRIMARY KEY (mb_email, pd_id)
)

insert into cart values('caca@gmail.com', 1,10);
insert into cart values('caca@gmail.com', 2,20);
insert into cart values('lee@gmail.com', 1,10);
select * from cart

------------------------------------------------------------------------------------------------------------------------------------------------
create table orderform(
orderform_id int primary key identity,
mb_email varchar(320) FOREIGN KEY REFERENCES Member(mb_email),
orderform_time date not null,
orderform_total float not null,
orderform_status tinyint not null,
hospital_id int FOREIGN KEY REFERENCES hospital(hospital_id)
)

insert into orderform values('caca@gmail.com','3000-12-11 20:45:11',10000,2,1);
insert into orderform values('caca@gmail.com','3000-10-13 20:41:11',500,4,2);
insert into orderform values('lee@gmail.com','3100-10-13 20:41:11',700,1,1);
select * from orderform
------------------------------------------------------------------------------------------------------------------------------------------------
create table orderdetail(
orderdetail_id int primary key identity,
orderform_id int FOREIGN KEY REFERENCES orderform(orderform_id),
product_id int FOREIGN KEY REFERENCES product(pd_Id),
cart_quantity int,
orderdetail_time datetime,
doctor_id int FOREIGN KEY REFERENCES doctor(doctor_id)
)

insert into orderdetail values(1,1,10,CURRENT_TIMESTAMP,1);
insert into orderdetail values(2,2,20,CURRENT_TIMESTAMP,2);
select * from orderdetail