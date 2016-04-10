use clap drop table orderform
create table orderform(
od_id int   ,
mb_email varchar(50)   ,
od_time datetime   ,
od_total int   ,
os_id decimal   PRIMARY KEY(od_id))

insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('49834','Ellen283@gamil.com','2012-7-6','80345','3');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('73894','Alexander24@gamil.com','2011-10-23','42602','1');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('69333','Franklin328@gamil.com','2011-6-9','30158','4');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('31175','Zoe886@gamil.com','2007-12-6','37162','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('24738','Jonathan456@gamil.com','2010-5-28','95422','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('79237','Derrick240@gamil.com','2009-11-7','17017','1');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('72066','Page660@gamil.com','2007-12-25','31606','4');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('71113','Andrew45@gamil.com','2008-12-24','80478','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('43722','Doris254@gamil.com','2007-10-22','66933','4');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('45622','Lillian517@gamil.com','2013-5-26','99960','5');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('93026','Anna50@gamil.com','2009-10-18','74167','4');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('24915','Leo506@gamil.com','2014-3-23','107559','1');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('23876','Angelo48@gamil.com','2010-8-13','45809','3');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('3143','Mamie542@gamil.com','2013-12-21','51628','3');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('1922','Patricia664@gamil.com','2008-7-7','12928','1');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('92778','Gail334@gamil.com','2007-12-12','60396','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('62457','Enoch299@gamil.com','2015-6-11','108173','4');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('10419','Ansel52@gamil.com','2014-5-16','72733','5');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('46996','Ann49@gamil.com','2011-2-6','18950','5');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('633','Doris254@gamil.com','2007-5-26','77925','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('97803','Paul666@gamil.com','2013-2-11','18419','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('88418','Donna251@gamil.com','2007-7-3','54401','1');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('88372','Spencer767@gamil.com','2007-9-17','62495','1');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('42857','Susie779@gamil.com','2006-4-6','34606','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('53338','Duke258@gamil.com','2012-10-13','39351','3');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('28596','Dolores245@gamil.com','2008-12-17','11361','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('28596','Angelo48@gamil.com','2014-9-18','95107','4');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('28596','Martha558@gamil.com','2012-7-15','65990','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('28596','Barlow87@gamil.com','2009-10-14','102408','2');
insert into orderform(od_id,mb_email,od_time,od_total,os_id) values('28596','Adrian15@gamil.com','2012-3-16','55285','4');

use clap drop table orderdetail
create table orderdetail(
od_id int   ,
pd_id int   REFERENCES product(pd_Id),
ct_quantity int   PRIMARY KEY(od_id,pd_id))

insert into orderdetail(od_id,pd_id,ct_quantity) values('49834','2','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('73894','17','3');
insert into orderdetail(od_id,pd_id,ct_quantity) values('69333','28','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('31175','23','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('24738','21','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('79237','17','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('72066','10','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('71113','24','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('43722','30','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('45622','29','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('93026','13','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('24915','19','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('23876','2','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('3143','6','3');
insert into orderdetail(od_id,pd_id,ct_quantity) values('1922','5','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('92778','15','3');
insert into orderdetail(od_id,pd_id,ct_quantity) values('62457','16','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('10419','20','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('46996','23','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('633','26','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('97803','3','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('88418','2','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('88372','24','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('42857','7','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('53338','23','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('28596','18','1');
insert into orderdetail(od_id,pd_id,ct_quantity) values('28596','28','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('28596','28','3');
insert into orderdetail(od_id,pd_id,ct_quantity) values('28596','8','2');
insert into orderdetail(od_id,pd_id,ct_quantity) values('28596','2','2');

use clap drop table category
create table category(
cg_id varchar(30)   ,
cg_name varchar(30)   PRIMARY KEY(cg_id))

insert into category(cg_id,cg_name) values('1','Kidneys');
insert into category(cg_id,cg_name) values('2','Ureters');
insert into category(cg_id,cg_name) values('3','Bladder');
insert into category(cg_id,cg_name) values('4','Urethra');
insert into category(cg_id,cg_name) values('5','Ovaries');
insert into category(cg_id,cg_name) values('6','Fallopian tubes');
insert into category(cg_id,cg_name) values('7','Uterus');
insert into category(cg_id,cg_name) values('8','Vagina');
insert into category(cg_id,cg_name) values('9','Vulva');
insert into category(cg_id,cg_name) values('10','Clitoris');

use clap drop table product
create table product(
pd_id int   ,
pd_name varchar(60) ,
pd_price float NOT NULL  ,
pd_description varchar(100) NOT NULL  ,
pd_rating int   ,
pd_discount float   ,
cg_id varchar(30)   REFERENCES category(cg_id) PRIMARY KEY(pd_id))

insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('1','Human skeleton','41581','Human skeleton : description','2','0.9','8');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('2','Joints','98680','Joints : description','5','0.7','3');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('3','Ligaments','30616','Ligaments : description','3','0.9','9');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('4','Muscular system','22768','Muscular system : description','3','0.9','1');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('5','Tendons','71176','Tendons : description','3','0.9','8');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('6','Mouth','63856','Mouth : description','3','0.9','2');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('7','Teeth','54923','Teeth : description','4','0.8','2');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('8','Tongue','28581','Tongue : description','5','1','2');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('9','Salivary glands','109199','Salivary glands : description','3','0.9','5');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('10','Parotid glands','53749','Parotid glands : description','3','0.8','6');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('11','Submandibular glands','104052','Submandibular glands : description','4','0.6','6');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('12','Sublingual glands','31692','Sublingual glands : description','4','1','3');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('13','Pharynx','47499','Pharynx : description','3','0.8','3');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('14','Esophagus','80297','Esophagus : description','4','0.8','6');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('15','Stomach','85864','Stomach : description','2','0.7','1');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('16','Small intestine','59025','Small intestine : description','3','0.9','5');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('17','Duodenum','75324','Duodenum : description','3','0.7','5');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('18','Jejunum','71212','Jejunum : description','4','0.8','5');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('19','Ileum','16108','Ileum : description','5','0.9','2');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('20','Large intestine','60757','Large intestine : description','4','1','8');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('21','Liver','62149','Liver : description','2','0.9','4');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('22','Gallbladder','59846','Gallbladder : description','4','0.9','10');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('23','Pancreas','51526','Pancreas : description','2','0.8','7');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('24','Nasal cavity','33608','Nasal cavity : description','4','0.8','4');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('25','Pharynx','82622','Pharynx : description','3','0.7','10');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('26','Larynx','90116','Larynx : description','4','0.7','1');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('27','Trachea','68402','Trachea : description','2','0.8','8');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('28','Bronchi','30575','Bronchi : description','4','0.9','4');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('29','Lungs','87838','Lungs : description','5','0.7','5');
insert into product(pd_id,pd_name,pd_price,pd_description,pd_rating,pd_discount,cg_id) values('30','Diaphragm','37960','Diaphragm : description','1','0.8','7');