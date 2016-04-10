use clap drop table orderform
create table orderform(
od_id int   ,
mb_email varchar(50)   ,
od_time datetime   ,
od_total int   ,
st_id decimal   PRIMARY KEY(od_id))

insert into orderform(od_id,mb_email,od_time,od_total,st_id) values('1981','iceisicey@gmail.com','2000/1/1','3000','3');
insert into orderform(od_id,mb_email,od_time,od_total,st_id) values('1982','betty123362@gmail.com','2000/1/1','4000','3');
insert into orderform(od_id,mb_email,od_time,od_total,st_id) values('1983','sing159951@gmail.com','2000/1/1','5000','1');
insert into orderform(od_id,mb_email,od_time,od_total,st_id) values('1984','DS19930128@gmail.com','2000/1/1','6000','3');
insert into orderform(od_id,mb_email,od_time,od_total,st_id) values('1985','edithlal1993@gmail.com','2000/1/1','7000','3');
insert into orderform(od_id,mb_email,od_time,od_total,st_id) values('1986','tinadu810218@gmail.com','2000/1/1','8000','1');
insert into orderform(od_id,mb_email,od_time,od_total,st_id) values('1987','xup6qo4qo4@gmail.com','2000/1/1','9000','3');

use clap drop table orderform
create table orderform(
od_id int   ,
pd_id int   REFERENCES product(pd_Id),
ct_quantity int   PRIMARY KEY(od_id,pd_id))

insert into orderform(od_id,pd_id,ct_quantity) values('49834','5397','1');
insert into orderform(od_id,pd_id,ct_quantity) values('73894','8668','3');
insert into orderform(od_id,pd_id,ct_quantity) values('69333','8068','2');
insert into orderform(od_id,pd_id,ct_quantity) values('31175','7472','1');
insert into orderform(od_id,pd_id,ct_quantity) values('24738','1873','1');
insert into orderform(od_id,pd_id,ct_quantity) values('79237','5479','1');
insert into orderform(od_id,pd_id,ct_quantity) values('72066','9325','2');
insert into orderform(od_id,pd_id,ct_quantity) values('71113','941','1');
insert into orderform(od_id,pd_id,ct_quantity) values('43722','7637','2');
insert into orderform(od_id,pd_id,ct_quantity) values('45622','3332','2');
insert into orderform(od_id,pd_id,ct_quantity) values('93026','3337','2');
insert into orderform(od_id,pd_id,ct_quantity) values('24915','9331','1');
insert into orderform(od_id,pd_id,ct_quantity) values('23876','85','2');
insert into orderform(od_id,pd_id,ct_quantity) values('3143','8069','3');
insert into orderform(od_id,pd_id,ct_quantity) values('1922','1649','2');
insert into orderform(od_id,pd_id,ct_quantity) values('92778','5286','3');
insert into orderform(od_id,pd_id,ct_quantity) values('62457','8083','2');
insert into orderform(od_id,pd_id,ct_quantity) values('10419','1900','1');
insert into orderform(od_id,pd_id,ct_quantity) values('46996','7015','1');
insert into orderform(od_id,pd_id,ct_quantity) values('633','4236','2');
insert into orderform(od_id,pd_id,ct_quantity) values('97803','5791','1');
insert into orderform(od_id,pd_id,ct_quantity) values('88418','6545','2');
insert into orderform(od_id,pd_id,ct_quantity) values('88372','8959','1');
insert into orderform(od_id,pd_id,ct_quantity) values('42857','6075','1');
insert into orderform(od_id,pd_id,ct_quantity) values('53338','9141','2');
insert into orderform(od_id,pd_id,ct_quantity) values('28596','2866','1');
insert into orderform(od_id,pd_id,ct_quantity) values('28596','5430','2');
insert into orderform(od_id,pd_id,ct_quantity) values('28596','529','3');
insert into orderform(od_id,pd_id,ct_quantity) values('28596','9940','2');
insert into orderform(od_id,pd_id,ct_quantity) values('28596','6934','2');