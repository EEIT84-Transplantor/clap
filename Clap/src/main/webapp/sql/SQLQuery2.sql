use clap
drop table inoutlog
drop table inventory
drop table orderdetail
drop table doctor
drop table cart
drop table orderform
drop table productimg 
drop table product 
drop table promocode
drop table giftcard
drop table promo
drop table category
drop table message
drop table creditcard
drop table member
drop table hospital

create table hospital(
hospital_id int ,
hospital_name varchar(100) ,
hospital_address varchar(100) ,
PRIMARY KEY(hospital_id))










create table member(
mb_email varchar(320) ,
mb_password varbinary(30) ,
mb_name varchar(30) ,
mb_phone int ,
mb_contenttype varchar(50) ,
mb_photo image ,
mb_oneclick bit ,
mb_autorenew bit ,
mb_expire date ,
mb_amount float ,
hospital_id int REFERENCES hospital(hospital_id),
cc_number char(16) ,
PRIMARY KEY(mb_email))

create table creditcard(
mb_email varchar(320) REFERENCES member(mb_email),
cc_number char(16) ,
cc_goodrhru char(5) ,
cc_cvv char(3) ,
PRIMARY KEY(mb_email,cc_number))









create table message(
msg_id  int ,
mb_email varchar(320) REFERENCES member(mb_email),
msg_sender varchar(50) ,
msg_subject varchar(500) ,
msg_content varchar(max) ,
msg_date datetime ,
msg_deleted bit ,
PRIMARY KEY(msg_id ))






create table category(
category_id int ,
category_name varchar(50) ,
category_specialty varchar(50) ,
category_value1 float ,
category_specialty_plus varchar(50) ,
category_value2 float ,
PRIMARY KEY(category_id))







create table promo(
pm_code int ,
pm_expire date ,
pm_tiltle varchar(50) ,
pm_discount float ,
PRIMARY KEY(pm_code))









create table giftcard(
gc_number int ,
gc_code int ,
gc_amount float ,
gc_available bit ,
PRIMARY KEY(gc_number))









create table promocode(
mb_email varchar(320) REFERENCES member(mb_email),
pc_code int ,
PRIMARY KEY(mb_email,pc_code))











create table product (
product_id int ,
product_name varchar(50) ,
product_price float ,
product_description nvarchar(1000) ,
product_rating tinyint ,
product_discount float ,
category_id int REFERENCES category(category_id),
product_value1 varchar(50) ,
product_value2 varchar(50) ,
PRIMARY KEY(product_id))




create table productimg (
product_id int REFERENCES product(product_id),
productimg_img image ,
PRIMARY KEY(product_id))











create table orderform(
orderform_id int identity ,
orderform_time datetime ,
orderform_total float ,
orderform_status tinyint ,
hospital_id int REFERENCES hospital(hospital_id),
mb_email varchar(320) REFERENCES member(mb_email),
PRIMARY KEY(orderform_id))







create table cart(
mb_email varchar(320) REFERENCES member(mb_email),
product_id int REFERENCES product(product_id),
cart_quantity tinyint  ,
PRIMARY KEY(mb_email,product_id))










create table doctor(
doctor_id int ,
doctor_name varchar(50) ,
PRIMARY KEY(doctor_id))











create table orderdetail(
orderdetail_id int  identity ,
orderform_id int REFERENCES orderform(orderform_id),
product_id int REFERENCES product(product_id),
cart_quantity tinyint ,
doctor_id int REFERENCES doctor(doctor_id),
orderdetail_surgerytime datetime ,
PRIMARY KEY(orderdetail_id))







create table inventory(
inventory_id int ,
product_id int REFERENCES product(product_id),
inventory_quantity tinyint  ,
inventory_manufactureDate datetime ,
inventory_expiryDate datetime ,
PRIMARY KEY(inventory_id))








create table inoutlog(
inoutlog_id int ,
inventory_id int REFERENCES inventory(inventory_id),
product_id int REFERENCES product(product_id),
inoutlog_inQuantity tinyint  ,
inoutlog_outQuantity tinyint  ,
inoutlog_manufactureDate datetime ,
inoutlog_expiryDate datetime ,
inoutlog_destination nvarchar(100) ,
inoutlog_date datetime ,
PRIMARY KEY(inoutlog_id))

insert into hospital(hospital_id,hospital_name,hospital_address) values('1','��߶����j�Ǫ��]��|','�y�����y�����s����152��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('2','�]�Ϊk�H�ѥD���F��|ù�F�t����|','�y����ù�F�����n��160��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('3','�]�Ϊk�Hù�\����|ù�F�շR��|','�y����ù�F��n����81�B83���B���e�n��61�B63��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('4','�åͺ֧Q������| ','�򶩥��H�q�ϫH�G��268��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('5','���������]�Ϊk�H�򶩪���������|�Ψ䱡�H��|��','�򶩥��w�ְϳ�����222��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('6','�O�_�����p�X��|�����|��','�O�_���j�P�ϾG�{��145��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('7','�O�_�����p�X��|�����|��','�O�_���h�L�ϫB�n��105��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('8','�O�_�����p�X��|�M�������|�ϤΨ�����|��','�O�_�������Ϥ��ظ��G�q33��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('9','�O�_�����p�X��|�����|��','�O�_���n��ϦP�w��87��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('10','�O�_�����p�X��|�L�˰|��','�O�_�����s�ϪL�˥_��530��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('11','�O�_�����p�X��|���R�|��','�O�_���j�w�Ϥ��R���|�q10��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('12','��ߥx�W�j����ǰ|���]��|','�O�_�������Ϥ��s�n��7�B8���F�`�w��1��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('13','�T�x�`��|�Q�s���|���]�����E���A�ȳB','�O�_���Q�s�ϰ��d��131��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('14','�T�x�`��|���]�����E���A�ȳB�Ψ�Ŧ{�|��','�O�_������Ϧ��\���G�q325��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('15','�O�_�a���`��|','�O�_���_��ϥ۵P���G�q201��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('16','���������]�Ϊk�H�x�_����������|','�O�_���Q�s�ϴ��ƥ_��199��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('17','����_�{�w����|�����]�Ϊk�H�O�w��|','�O�_���Q�s�ϤK�w���G�q424�B426��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('18','��������]�Ϊk�H�����X��|','�O�_���j�w�Ϥ��R���|�q266��6���B280��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('19','�]�Ϊk�H�O�W������ѱз|�����������|�Ʒ~����|����������|','�O�_�����s�Ϥ��s�_���G�q92��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('20','�s�������]�Ϊk�H�s���d���������|','�O�_���h�L�Ϥ����95���Τh�Ӹ�51��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('21','���������]�Ϊk�H������|','�O�_���_��Ϯ�����45��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('22','�����]�Ϊk�H�d���G����|�M�H�v��������|','�O�_���_��ϥ߼w��125��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('23','�O�_��Ǥj�Ǫ��]��|','�O�_���H�q�ϧd����252��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('24','�x�_���߸U����|�Щe�U�]�Ϊk�H�p�߻O�_��Ǥj�ǿ�z ','�O�_����s�Ͽ������T�q111��  ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('25','�s�_�����p�X��|�Ψ�O���|��','�s�_���T���Ϥ��s��2���F�O���ϭ^�h��198��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('26','�åͺ֧Q���O�_��|','�s�_���s���ϫ䷽��127��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('27','�����]�Ϊk�H�}�����������İ���|�ȪF������|','�s�_���O���ϫn���n���G�q21��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('28','��зO�������]�Ϊk�H�x�_�O����|','�s�_���s���ϫذ��289���a�U1-3�Ӧܦa�W1-15��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('29','��Ѯc�����ӷ~�����]�Ϊk�H���D����|','�s�_���T�l�ϴ_����399���B���s��198��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('30','��������]�Ϊk�H��������X��|','�s�_������ϫئ���59��2���a�U4�Ӧܦa�W12��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('31','�ѥD�ЯѲ������]�Ϊk�H�Ѳ���|','�s�_���s���Ϥ�����362��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('32','�åͺ֧Q�����M��|(�e�U�O�_��Ǥj�ǿ��ظg��)','�s�_�����M�Ϥ�����291�������j�Ӧa�U2�h�ܦa�W12�h  ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('33','�åͺ֧Q�������|','��鿤��饫���s��1492��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('34','��x����`��|���]�����E���A�ȳB','��鿤�s��m������168��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('35','�O�_�a���`��|�����|','��鿤��饫���\���T�q100��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('36','�Ѧ��������Ϊk�H������|','��鿤���c��������155��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('37','�F���w�t�O�S�פk�|�����]�Ϊk�H�t�O�S��|','��鿤��饫�طs��123��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('38','�Ӳ���X��|�Ψ�T���|��','��鿤��饫�g���168���B��鿤��饫�T�����T�q106��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('39','�c�s��|','��鿤�����s����77��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('40','��߻O�W�j����ǰ|���]��|�s�ˤ��|','�s�˥��_�ϸg����@�q442��25��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('41','�]�Ϊk�H����������|�s�ˤ��|','�s�˥��F�ϥ��_�����_���G�q690��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('42','�F����X��|','�s�˿��˥_�����F�G��69��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('43','�åͺ֧Q���]����|','�]�߿��]�ߥ�������747��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('44','�]�Ϊk�H����������|�Ψ�F���|��','�]�߿��Y����H�q��128��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('45','�åͺ֧Q���O����| ','�O������ϼs�����T����1�q199�� ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('46','�åͺ֧Q���׭���|','�O�����׭�Ϧw�d��100�� ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('47','��x�O���`��|���]�����E���A�ȳB','�O�����ӥ��Ϥ��s���G�q348��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('48','�O���a���`��|','�O������ٰϻO�W�j�D4�q1650��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('49','�L�s�������Ϊk�H�L�s��|','�O�����n�ٰϴf�����T�q36��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('50','����X�������Ϊk�H�j�ҧ���X��|','�O�����j�ҰϤK�w��2��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('51','�����������Ϊk�H���к�X��|�Ψ�j�Ұ|��','�O�����j�Ұϸg���321��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('52','����X�������Ϊk�H����X��|�Ψ�F���|��','�O������ϰϻO�W�j�D�K�q699��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('53','��зO�������]�Ϊk�H�x���O����|','�O������l���׿����@�q66���B88��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('54','���R�����]�Ϊk�H�j�����R��|','�O�����j���ϪF�a��483��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('55','���s��Ǥj�Ǫ��]��|','�O�����n�ϫذ�_���@�q110��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('56','�������Ĥj�Ǫ��]��|','�O�����_�Ϩ|�w��2��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('57','��M��X��|','�O�������ϥ�����139�� ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('58','��M��X��|������|','�O������ٰϻO�W�j�D4�q966��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('59','�åͺ֧Q��������|','���ƿ��H�߶m�������G�q80��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('60','�q���������Ϊk�H�q�Ǭ�����|','���ƿ����ƥ��n�������s��1�q542��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('61','���ư���������]�Ϊk�H���ư������|�Ψ䤤�ظ��|��','���ƿ����ƥ��n�յ�135���B���ظ�176���B������235�B320��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('62','�q�������]�Ϊk�H���بq�Ǭ�����|','���ƿ���������u��6���B6-2��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('63','�H�������]�Ϊk�H�H���������|','�n�뿤�H�����K�s��1��  ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('64','��߻O�W�j����ǰ|���]��|���L���|�Ψ����|��','���L���椻�����L���G�q579��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('65','�]�Ϊk�H�ѥD�ЭY����|','���L�������s�͸�74��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('66','���ư���������]�Ϊk�H���L�������|','���L��������s�ר������n��375�� ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('67','�������Ĥj�ǥ_����]��|','���L���_����s�w��123��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('68','�O���a���`��|�Ÿq���| ','�Ÿq����ϼB���@����G�q600��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('69','���w�������]�Ϊk�H�Ÿq�������| ','�Ÿq���F�Ϥ��ܨ�������539���F�F�ϫ�򨽫O�ص�100���F�F�ϳ��ܨ�������642��  ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('70','�ѥD�Ф��ظt���פk�|�����]�Ϊk�H�ѥD�иt�����w��|�Ψ���v�|��','�Ÿq���F�ϵu�˨��j�����G�q565��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('71','���������]�Ϊk�H�Ÿq����������|','�Ÿq�����l�����M���Ŧ�����q6���B8��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('72','��зO�������]�Ϊk�H�j�L�O����|','�Ÿq���j�L���L�����͸�2��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('73','�åͺ֧Q���x�n��|','�O�n�����Ϥ��s��125��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('74','�x�n������|','�O�n���F�ϱR�w��670��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('75','��ߦ��\�j����ǰ|���]��|','�O�n���_�ϳӧQ��138��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('76','�x�W������ѱз|�s�������]�Ϊk�H�¨��s����|','�O�n���¨��Ϥp�񨽭d�l�L20��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('77','�x�W������ѱз|�s�������]�Ϊk�H�x�n�s����|','�O�n���F�ϪF�����@�q57�� ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('78','�_�������]�Ϊk�H�h��_����| ','�O�n���h��Ϥӱd��201��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('79','����X��|','�O�n������ϥ��͸�2�q6.8.10.12.14.18.20.22.23.24.25.27.44��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('80','�_�������]�Ϊk�H�_����|�Ψ�x�n���|','�O�n���ñd�Ϥ��ظ�901��  ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('81','���������p�X��|','���������s�Ϥ��ؤ@��976��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('82','�������ߤj�P��|(�e�U�]�Ϊk�H�p�߰�����Ǥj�Ǫ��]���M������|�g��)','�������e���Ϥ��ؤT��68��  ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('83','��x�����`��|������|���]�����E���A�ȳB ','����������ϭx�ո�553��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('84','��x�����`��|���]�����E���A�ȳB','�������d���ϫحx��5��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('85','�����a���`��|','����������Ϥj���@��386��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('86','����X�������Ϊk�H����X��|','�������d���Ϧ��\�@��162���B�|���|��136���B166���B�é���49��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('87','�������ߤp����|(�e�U�]�Ϊk�H�p�߰�����Ǥj�Ǹg��)','�������p��Ϥs����482��B1-10��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('88','���������]�Ϊk�H��������������|','���������Q�Ϥj���123��  ');
insert into hospital(hospital_id,hospital_name,hospital_address) values('89','�q�j�����]�Ϊk�H�q�j��|','�������P�_�Ϩ��J���q�j��1��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('90','�]�Ϊk�H�p�߰�����Ǥj�Ǫ��]���M������|','�������T���ϤQ���@��100��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('91','�åͺ֧Q���̪F��|','�̪F���̪F���ۥѸ�270��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('92','�_���������Ϊk�H�_����|','�̪F���̪F�����s��123��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('93','�w���������Ϊk�H�w����|','�̪F���F���������@�q210��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('94','�̰������]�Ϊk�H�̪F�������|�Ψ����|��','�̪F���̪F���j�s��60��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('95','���^��ޤj�Ǫ��]��|','�̪F���F�����s��5��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('96','�꤯��|','�̪F���̪F�����ͪF��12��2��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('97','����������|�x�F���|','�O�F���O�F�����F��303��1��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('98','��x�Ὤ�`��|���]�����E���A�ȳB','�Ὤ���s���m�Ũ���163��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('99','��зO�������]�Ϊk�H�Ὤ�O����|','�Ὤ���Ὤ���������T�q707��');
insert into hospital(hospital_id,hospital_name,hospital_address) values('100','�O�W����Ъ��շ|�����]�Ϊk�H������|','�Ὤ���Ὤ�����v��44��');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('patrick665@gmail.com',0x65,'patrick665','0916867714',null,null,'TRUE','FALSE',null,null,29,'4476763953123621');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('jay433@gmail.com',0x65,'jay433','0919729176',null,null,'FALSE','TRUE',null,null,null,'5662123460583724');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('timothy798@gmail.com',0x65,'timothy798','0996181901',null,null,'FALSE','TRUE',null,null,null,'2255939699928014');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('sigrid761@gmail.com',0x65,'sigrid761','0963193490',null,null,'TRUE','TRUE',null,'19569',22,'6762468585767130');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('darnell227@gmail.com',0x65,'darnell227','0985362614',null,null,'TRUE','TRUE',null,'11396',29,'3893293935376813');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('rita712@gmail.com',0x65,'rita712','0923453000',null,null,'TRUE','TRUE',null,null,33,'8977588315970649');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('theobald790@gmail.com',0x65,'theobald790','0924622172',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('candance161@gmail.com',0x65,'candance161','0910505968',null,null,'FALSE','TRUE',null,null,null,'5286669873979639');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('todd803@gmail.com',0x65,'todd803','0987344563',null,null,'FALSE','TRUE',null,null,null,'1473948098765256');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('murray610@gmail.com',0x65,'murray610','0980524681',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('carr168@gmail.com',0x65,'carr168','0998978685',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('berg110@gmail.com',0x65,'berg110','0963048960',null,null,'FALSE','FALSE','2017-7-24T00:00:00','1115',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('perry672@gmail.com',0x65,'perry672','0931203310',null,null,'FALSE','TRUE',null,null,null,'4340301554918723');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('grace357@gmail.com',0x65,'grace357','0949495805',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('paddy657@gmail.com',0x65,'paddy657','0993230288',null,null,'FALSE','TRUE',null,'1563',null,'4840706735695941');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('naomi615@gmail.com',0x65,'naomi615','0952272208',null,null,'FALSE','FALSE','2017-4-28T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('bowen138@gmail.com',0x65,'bowen138','0945220919',null,null,'TRUE','TRUE',null,null,96,'3909354589276890');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('julia465@gmail.com',0x65,'julia465','0957680325',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('janet429@gmail.com',0x65,'janet429','0928068887',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('boyd140@gmail.com',0x65,'boyd140','0912873528',null,null,'FALSE','TRUE',null,null,null,'1446941026149127');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('quintina694@gmail.com',0x65,'quintina694','0933441068',null,null,'TRUE','FALSE',null,null,9,'6975354481881785');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('tom804@gmail.com',0x65,'tom804','0982250788',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('jacqueline425@gmail.com',0x65,'jacqueline425','0956685696',null,null,'FALSE','FALSE','2017-2-15T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('spring768@gmail.com',0x65,'spring768','0942539397',null,null,'FALSE','TRUE',null,'5175',null,'2702255554420486');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('hedy384@gmail.com',0x65,'hedy384','0998767655',null,null,'FALSE','FALSE','2016-12-20T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('odelia641@gmail.com',0x65,'odelia641','0927367006',null,null,'FALSE','TRUE',null,null,null,'9372361028491765');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('blithe132@gmail.com',0x65,'blithe132','0987056339',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('cyril218@gmail.com',0x65,'cyril218','0921100159',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('vic831@gmail.com',0x65,'vic831','0975886969',null,null,'TRUE','TRUE',null,null,73,'5525503754111879');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('giselle350@gmail.com',0x65,'giselle350','0961144856',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('bradley141@gmail.com',0x65,'bradley141','0948187251',null,null,'FALSE','FALSE','2015-3-27T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('pamela661@gmail.com',0x65,'pamela661','0986564646',null,null,'TRUE','FALSE',null,null,11,'2986279469058604');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('molly597@gmail.com',0x65,'molly597','0957984695',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('may672@gmail.com',0x65,'perry672','0985852981',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('gail334@gmail.com',0x65,'gail334','0958694040',null,null,'FALSE','FALSE','2017-2-9T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('douglas256@gmail.com',0x65,'douglas256','0925860557',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('murphy608@gmail.com',0x65,'murphy608','0944168452',null,null,'TRUE','FALSE',null,null,44,'5319498691652118');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('sebastiane751@gmail.com',0x65,'sebastiane751','0928367730',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('reuben709@gmail.com',0x65,'reuben709','0933553221',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('heather381@gmail.com',0x65,'heather381','0977530561',null,null,'FALSE','FALSE','2017-3-16T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('lorraine523@gmail.com',0x65,'lorraine523','0989008550',null,null,'TRUE','FALSE','2016-10-17T00:00:00',null,40,'7983491595624458');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('owen656@gmail.com',0x65,'owen656','0965621698',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('corey210@gmail.com',0x65,'corey210','0918901830',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('kirk489@gmail.com',0x65,'kirk489','0952120595',null,null,'TRUE','FALSE','2015-12-12T00:00:00',null,6,'2274007291214858');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('joanna450@gmail.com',0x65,'joanna450','0991674022',null,null,'FALSE','FALSE','2016-5-14T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('hermosa390@gmail.com',0x65,'hermosa390','0941548943',null,null,'FALSE','TRUE',null,null,null,'3290031629045294');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('dale220@gmail.com',0x65,'dale220','0915355250',null,null,'FALSE','FALSE','2016-3-27T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('lewis515@gmail.com',0x65,'lewis515','0923545495',null,null,'TRUE','FALSE','2017-8-25T00:00:00',null,65,'6874994186597850');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('eli279@gmail.com',0x65,'eli279','0969768055',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('hilda393@gmail.com',0x65,'hilda393','0997859861',null,null,'FALSE','FALSE',null,'6059',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('wordsworth866@gmail.com',0x65,'wordsworth866','0957471702',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('everley313@gmail.com',0x65,'everley313','0911328580',null,null,'FALSE','FALSE','2016-12-16T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('cynthia217@gmail.com',0x65,'cynthia217','0942156300',null,null,'FALSE','TRUE',null,null,null,'4238813492180215');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('clare193@gmail.com',0x65,'clare193','0930871442',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('bert115@gmail.com',0x65,'bert115','0930712587',null,null,'FALSE','TRUE',null,'9474',null,'5084985331731357');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('geoffrey342@gmail.com',0x65,'geoffrey342','0919285509',null,null,'TRUE','TRUE',null,'11178',41,'5029963318445974');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('saxon747@gmail.com',0x65,'saxon747','0965833552',null,null,'FALSE','TRUE',null,null,null,'7777588830399531');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('tim797@gmail.com',0x65,'tim797','0920573559',null,null,'TRUE','FALSE',null,'1400',3,'5408094223708102');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('samantha739@gmail.com',0x65,'samantha739','0967531057',null,null,'FALSE','TRUE',null,null,null,'7658629777487064');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('willie860@gmail.com',0x65,'willie860','0940959134',null,null,'TRUE','FALSE',null,'12168',78,'3750401746364973');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('victoria834@gmail.com',0x65,'victoria834','0944188704',null,null,'FALSE','TRUE',null,'16771',null,'7087010658604468');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('ted803@gmail.com',0x65,'todd803','0986129667',null,null,'FALSE','TRUE',null,null,null,'3580747485178297');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('emily295@gmail.com',0x65,'emily295','0971066924',null,null,'FALSE','TRUE',null,'17632',null,'1920331872298783');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('kent482@gmail.com',0x65,'kent482','0915910886',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('myrna612@gmail.com',0x65,'myrna612','0957904888',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('stanley772@gmail.com',0x65,'stanley772','0964090237',null,null,'TRUE','FALSE',null,'14975',63,'9377438036913337');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('valentine821@gmail.com',0x65,'valentine821','0958334179',null,null,'FALSE','FALSE',null,'5043',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('howar399@gmail.com',0x65,'howar399','0963835524',null,null,'TRUE','FALSE',null,null,96,'7753463399222633');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('regina705@gmail.com',0x65,'regina705','0935171081',null,null,'TRUE','FALSE',null,null,70,'4426193576174438');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('judy464@gmail.com',0x65,'judy464','0961739906',null,null,'FALSE','FALSE','2016-5-10T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('gene339@gmail.com',0x65,'gene339','0974758120',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('ian407@gmail.com',0x65,'ian407','0915389977',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('gustave363@gmail.com',0x65,'gustave363','0944883520',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('elsie290@gmail.com',0x65,'elsie290','0948204380',null,null,'TRUE','TRUE',null,null,17,'4692680365612973');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('enoch299@gmail.com',0x65,'enoch299','0928452294',null,null,'FALSE','FALSE','2015-2-11T00:00:00','1863',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('drew257@gmail.com',0x65,'drew257','0959613242',null,null,'FALSE','FALSE',null,'14526',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('webster853@gmail.com',0x65,'webster853','0995079602',null,null,'FALSE','FALSE',null,'6352',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('kitty110@gmail.com',0x65,'berg110','0920210716',null,null,'FALSE','FALSE',null,'18036',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('mandy544@gmail.com',0x65,'mandy544','0975721148',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('elroy288@gmail.com',0x65,'elroy288','0977863227',null,null,'FALSE','TRUE',null,null,null,'8384838487956154');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('bennett108@gmail.com',0x65,'bennett108','0948974024',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('zebulon883@gmail.com',0x65,'zebulon883','0917724645',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('kerwin484@gmail.com',0x65,'kerwin484','0978932489',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('lauren498@gmail.com',0x65,'lauren498','0943307668',null,null,'TRUE','FALSE','2017-11-27T00:00:00',null,31,'9113629644221934');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('otto655@gmail.com',0x65,'otto655','0912656237',null,null,'FALSE','FALSE','2016-9-27T00:00:00','17117',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('edward272@gmail.com',0x65,'edward272','0987081251',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('norman635@gmail.com',0x65,'norman635','0974124575',null,null,'FALSE','FALSE','2015-6-19T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('george343@gmail.com',0x65,'george343','0993180157',null,null,'FALSE','FALSE',null,'2612',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('gilbert347@gmail.com',0x65,'gilbert347','0921760360',null,null,'TRUE','TRUE',null,null,16,'1172544529377592');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('laura496@gmail.com',0x65,'laura496','0945680322',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('harold374@gmail.com',0x65,'harold374','0928495824',null,null,'TRUE','FALSE',null,'18091',60,'5688321224445684');
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('ellay288@gmail.com',0x65,'elroy288','0928248583',null,null,'FALSE','FALSE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('webb852@gmail.com',0x65,'webb852','0999233100',null,null,'FALSE','FALSE',null,'11336',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('oliver645@gmail.com',0x65,'oliver645','0922835305',null,null,'FALSE','TRUE',null,null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('kevin485@gmail.com',0x65,'kevin485','0927270876',null,null,'FALSE','FALSE','2017-2-22T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('kelly478@gmail.com',0x65,'kelly478','0910242142',null,null,'FALSE','TRUE','2016-12-12T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('ursula819@gmail.com',0x65,'ursula819','0932702146',null,null,'FALSE','FALSE','2016-12-10T00:00:00',null,null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('felix318@gmail.com',0x65,'felix318','0915944905',null,null,'FALSE','FALSE',null,'19679',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('lock523@gmail.com',0x65,'lorraine523','0965344923',null,null,'FALSE','FALSE',null,'13174',null,null);
insert into member(mb_email,mb_password,mb_name,mb_phone,mb_contenttype,mb_photo,mb_oneclick,mb_autorenew,mb_expire,mb_amount,hospital_id,cc_number) values('reginald706@gmail.com',0x65,'reginald706','0993344407',null,null,'FALSE','FALSE','2017-5-26T00:00:00',null,null,null);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(1,'patrick665@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(2,'jay433@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(3,'timothy798@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(4,'sigrid761@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(5,'darnell227@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(6,'rita712@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(7,'theobald790@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(8,'candance161@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(9,'todd803@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(10,'murray610@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(11,'carr168@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(12,'berg110@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(13,'perry672@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(14,'grace357@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(15,'paddy657@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(16,'naomi615@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(17,'bowen138@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(18,'julia465@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(19,'janet429@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(20,'boyd140@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(21,'quintina694@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(22,'tom804@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(23,'jacqueline425@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(24,'spring768@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(25,'hedy384@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(26,'odelia641@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(27,'blithe132@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(28,'cyril218@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(29,'vic831@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(30,'giselle350@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(31,'bradley141@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(32,'pamela661@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(33,'molly597@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(34,'perry672@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(35,'gail334@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(36,'douglas256@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(37,'murphy608@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(38,'sebastiane751@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(39,'reuben709@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(40,'heather381@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(41,'lorraine523@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(42,'owen656@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(43,'corey210@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(44,'kirk489@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(45,'joanna450@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(46,'hermosa390@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(47,'dale220@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(48,'lewis515@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(49,'eli279@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(50,'hilda393@gmail.com','admin@gmail.com','[���i] 2016/05/05 ��� 4:00 ~ 6:00 �������i','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u�誺�����A�ȫ~��,�ڭ̱N�� 2016/05/05 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(51,'wordsworth866@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(52,'everley313@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(53,'cynthia217@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(54,'clare193@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(55,'bert115@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(56,'geoffrey342@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(57,'saxon747@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(58,'tim797@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(59,'samantha739@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(60,'willie860@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(61,'victoria834@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(62,'todd803@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(63,'emily295@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(64,'kent482@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(65,'myrna612@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(66,'stanley772@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(67,'valentine821@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(68,'howar399@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(69,'regina705@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(70,'judy464@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(71,'gene339@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(72,'ian407@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(73,'gustave363@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(74,'elsie290@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(75,'enoch299@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(76,'patrick665@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(77,'jay433@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(78,'timothy798@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(79,'sigrid761@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(80,'darnell227@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(81,'rita712@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(82,'theobald790@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(83,'candance161@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(84,'todd803@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(85,'murray610@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(86,'carr168@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(87,'berg110@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(88,'perry672@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(89,'grace357@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(90,'paddy657@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(91,'naomi615@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(92,'bowen138@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(93,'julia465@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(94,'janet429@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(95,'boyd140@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(96,'quintina694@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(97,'tom804@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(98,'jacqueline425@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(99,'spring768@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into message(msg_id ,mb_email,msg_sender,msg_subject,msg_content,msg_date,msg_deleted) values(100,'hedy384@gmail.com','admin@gmail.com','���C���e$50�U��ڪ��A�a�A�K�O�hClubMed�����a��','�˷R���|���j�a�n�G���F���ѵ��Ҧ��|�����u���ʪ��~��,�ڭ̱N�� 2016/05/10 �i������]�ƪ���s�P�ɯŬ��O�D�ֳt�a�����o�Ӱʧ@�A���ɥ����|�i�J�������A�A���槹���B���յL�~��|�ɳt�}��A�ȡA�P�¦U��|��������P�t�X�I','2016-4-4',0);
insert into promo(pm_code,pm_expire,pm_tiltle,pm_discount) values('99999999','2016-9-1','[�P�P]���w�ӫ~���b9��, �]������','0.9');
insert into promo(pm_code,pm_expire,pm_tiltle,pm_discount) values('88888888','2016-8-1','�i�|���S��j�̫�2��!!���Top 30 �E���~���A�D 8��_','0.8');
insert into promo(pm_code,pm_expire,pm_tiltle,pm_discount) values('77777777','2016-7-1','�w�y2016���ɫP�P��ץ��]7��!','0.7');
insert into promo(pm_code,pm_expire,pm_tiltle,pm_discount) values('66666666','2016-6-1','Happy Mother DAY �S�O���R�� �S�O��§ 6��promo code','0.6');
insert into promo(pm_code,pm_expire,pm_tiltle,pm_discount) values('55555555','2016-5-1','����101�p���u�f����5��_','0.5');
insert into promo(pm_code,pm_expire,pm_tiltle,pm_discount) values('44444444','2016-4-1','���ʦ~�׫P�P�I�R�˰ӫ~4���u�f','0.4');
insert into category(category_id,category_name,category_specialty,category_value1,category_specialty_plus,category_value2) values('1','Heart','Rhythm','100','EF','100');
insert into category(category_id,category_name,category_specialty,category_value1,category_specialty_plus,category_value2) values('2','Lung','FVC','100','RR','100');
insert into category(category_id,category_name,category_specialty,category_value1,category_specialty_plus,category_value2) values('3','Liver','GOT','100','GPT','100');
insert into category(category_id,category_name,category_specialty,category_value1,category_specialty_plus,category_value2) values('4','Kidney','GFR','100','null','100');
insert into category(category_id,category_name,category_specialty,category_value1,category_specialty_plus,category_value2) values('5','Pancreas','null','100','null','100');
insert into category(category_id,category_name,category_specialty,category_value1,category_specialty_plus,category_value2) values('6','Cornea','Sight','100','null','100');
insert into category(category_id,category_name,category_specialty,category_value1,category_specialty_plus,category_value2) values('7','Blood','RBC','100','null','100');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('94929433','9','9000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('60169447','6','6000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('48391165','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('82419114','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('36978852','3','3000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('61601219','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('66465657','6','6000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('48764402','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('27669771','2','2000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('53584852','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('73587106','7','7000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('43398907','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('24934773','2','2000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('52608851','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('25796283','2','2000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('35817926','3','3000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('54780203','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('68802535','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('47387108','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('33744075','3','3000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('92125449','9','9000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('49019730','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('66325103','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('69291132','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('87568130','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('88631575','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('73189394','7','7000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('67997126','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('43395494','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('78473734','7','7000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('63208577','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('83422023','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('64662346','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('45893364','4','4000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('93460786','9','9000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('52505268','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('63655815','6','6000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('41341098','4','4000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('99808256','9','9000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('49378565','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('78567287','7','7000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('64453408','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('40636671','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('57829138','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('29691781','2','2000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('96070624','9','9000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('56969670','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('15108840','1','1000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('98975118','9','9000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('55135939','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('91028763','9','9000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('92284383','9','9000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('61229190','6','6000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('61920704','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('47809001','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('28824028','2','2000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('57835607','5','5000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('61521338','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('76740705','7','7000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('51616032','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('16258080','1','1000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('44073146','4','4000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('33007576','3','3000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('81114180','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('71183826','7','7000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('50626374','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('80591465','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('69805691','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('45614314','4','4000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('76129812','7','7000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('11614178','1','1000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('20696827','2','2000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('32725662','3','3000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('93467249','9','9000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('99046547','9','9000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('56011532','5','5000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('91819008','9','9000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('84992090','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('22355166','2','2000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('28798373','2','2000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('64181144','6','6000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('80505466','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('78157022','7','7000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('82641127','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('87175758','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('43123139','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('90452404','9','9000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('77168328','7','7000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('67385569','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('96976499','9','9000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('97506358','9','9000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('49557059','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('86125679','8','8000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('83192991','8','8000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('74949010','7','7000','TRUE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('34726337','3','3000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('43148457','4','4000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('63101279','6','6000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('27165084','2','2000','FALSE');
insert into giftcard(gc_number,gc_code,gc_amount,gc_available) values('19415371','1','1000','FALSE');
insert into promocode(mb_email,pc_code) values('wordsworth866@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('everley313@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('cynthia217@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('clare193@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('bert115@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('geoffrey342@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('saxon747@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('tim797@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('samantha739@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('willie860@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('victoria834@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('todd803@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('emily295@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('kent482@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('myrna612@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('stanley772@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('valentine821@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('howar399@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('regina705@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('judy464@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('gene339@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('ian407@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('gustave363@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('elsie290@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('enoch299@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('drew257@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('webster853@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('berg110@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('mandy544@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('elroy288@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('bennett108@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('zebulon883@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('kerwin484@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('lauren498@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('otto655@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('edward272@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('norman635@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('george343@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('gilbert347@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('laura496@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('harold374@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('elroy288@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('webb852@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('oliver645@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('kevin485@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('kelly478@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('ursula819@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('felix318@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('lorraine523@gmail.com','33333333');
insert into promocode(mb_email,pc_code) values('reginald706@gmail.com','22222222');
insert into promocode(mb_email,pc_code) values('drew257@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('webster853@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('berg110@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('mandy544@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('elroy288@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('bennett108@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('zebulon883@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('kerwin484@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('lauren498@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('otto655@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('edward272@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('norman635@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('george343@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('gilbert347@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('laura496@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('harold374@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('elroy288@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('webb852@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('oliver645@gmail.com','77777777');
insert into promocode(mb_email,pc_code) values('kevin485@gmail.com','66666666');
insert into promocode(mb_email,pc_code) values('kelly478@gmail.com','55555555');
insert into promocode(mb_email,pc_code) values('ursula819@gmail.com','44444444');
insert into promocode(mb_email,pc_code) values('felix318@gmail.com','99999999');
insert into promocode(mb_email,pc_code) values('lorraine523@gmail.com','88888888');
insert into promocode(mb_email,pc_code) values('reginald706@gmail.com','77777777');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('11','P11','10000','description','1','0.53','1','1','1.1');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('12','P12','20000','description','4','0.54','1','1.1','1.1');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('13','P13','30000','description','3','0.63','1','1.2','1.1');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('14','P14','40000','description','2','0.61','1','1.2','1.1');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('15','P15','50000','description','3','0.81','1','1.2','1.2');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('21','P21','10000','description','2','0.74','2','1.3','1.3');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('22','P22','20000','description','4','0.88','2','1.3','1.3');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('23','P23','30000','description','5','0.71','2','1.4','1.4');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('24','P24','40000','description','3','0.85','2','1.4','1.5');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('25','P25','50000','description','3','0.54','2','1.5','1.6');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('31','P31','10000','description','4','0.91','3','1.5','1.8');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('32','P32','20000','description','1','0.65','3','1.5','2');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('33','P33','30000','description','3','0.79','3','1.6','2.2');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('34','P34','40000','description','4','0.93','3','1.6','2.2');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('35','P35','50000','description','3','0.74','3','1.6','2.2');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('41','P41','10000','description','4','0.71','4','1.6','2.3');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('42','P42','20000','description','2','0.65','4','1.7','2.4');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('43','P43','30000','description','5','0.71','4','1.8','2.4');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('44','P44','40000','description','3','0.92','4','1.8','2.4');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('45','P45','50000','description','4','0.98','4','1.9','2.4');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('51','P51','10000','description','2','0.85','5','1.9','2.4');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('52','P52','20000','description','1','0.51','5','1.9','2.5');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('53','P53','30000','description','2','0.86','5','2.1','2.6');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('54','P54','40000','description','4','0.66','5','2.1','2.7');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('55','P55','50000','description','5','0.56','5','2.2','2.7');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('61','P61','10000','description','4','0.75','6','2.3','2.8');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('62','P62','20000','description','3','0.71','6','2.4','2.8');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('63','P63','30000','description','4','0.88','6','2.4','2.9');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('64','P64','40000','description','1','0.53','6','2.5','2.9');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('65','P65','50000','description','3','0.95','6','2.5','2.9');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('71','P71','10000','description','3','0.62','7','2.5','2.9');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('72','P72','20000','description','3','0.68','7','2.6','3');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('73','P73','30000','description','2','0.76','7','2.6','3');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('74','P74','40000','description','1','0.82','7','2.9','3');
insert into product (product_id,product_name,product_price,product_description,product_rating,product_discount,category_id,product_value1,product_value2) values('75','P75','50000','description','3','0.97','7','2.9','3');
insert into productimg (product_id,productimg_img) values('11','null');
insert into productimg (product_id,productimg_img) values('12','null');
insert into productimg (product_id,productimg_img) values('13','null');
insert into productimg (product_id,productimg_img) values('14','null');
insert into productimg (product_id,productimg_img) values('15','null');
insert into productimg (product_id,productimg_img) values('21','null');
insert into productimg (product_id,productimg_img) values('22','null');
insert into productimg (product_id,productimg_img) values('23','null');
insert into productimg (product_id,productimg_img) values('24','null');
insert into productimg (product_id,productimg_img) values('25','null');
insert into productimg (product_id,productimg_img) values('31','null');
insert into productimg (product_id,productimg_img) values('32','null');
insert into productimg (product_id,productimg_img) values('33','null');
insert into productimg (product_id,productimg_img) values('34','null');
insert into productimg (product_id,productimg_img) values('35','null');
insert into productimg (product_id,productimg_img) values('41','null');
insert into productimg (product_id,productimg_img) values('42','null');
insert into productimg (product_id,productimg_img) values('43','null');
insert into productimg (product_id,productimg_img) values('44','null');
insert into productimg (product_id,productimg_img) values('45','null');
insert into productimg (product_id,productimg_img) values('51','null');
insert into productimg (product_id,productimg_img) values('52','null');
insert into productimg (product_id,productimg_img) values('53','null');
insert into productimg (product_id,productimg_img) values('54','null');
insert into productimg (product_id,productimg_img) values('55','null');
insert into productimg (product_id,productimg_img) values('61','null');
insert into productimg (product_id,productimg_img) values('62','null');
insert into productimg (product_id,productimg_img) values('63','null');
insert into productimg (product_id,productimg_img) values('64','null');
insert into productimg (product_id,productimg_img) values('65','null');
insert into productimg (product_id,productimg_img) values('71','null');
insert into productimg (product_id,productimg_img) values('72','null');
insert into productimg (product_id,productimg_img) values('73','null');
insert into productimg (product_id,productimg_img) values('74','null');
insert into productimg (product_id,productimg_img) values('75','null');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-1-13','78000','4','54','bennett108@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-1-3','87000','4','76','berg110@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-1-6','26000','4','54','berg110@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-1-8','41000','4','53','blithe132@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-12','5000','4','9','bowen138@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-13','73000','4','8','boyd140@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-17','90000','4','51','candance161@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-19','53000','4','73','carr168@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-21','56000','4','47','clare193@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-21','23000','4','41','corey210@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-28','15000','4','75','cynthia217@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-3','35000','4','15','dale220@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-7','99000','4','29','darnell227@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-8','75000','4','72','douglas256@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-2-9','75000','4','93','drew257@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-14','100000','4','56','edward272@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-14','20000','4','54','eli279@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-16','13000','4','80','elroy288@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-18','52000','4','83','elroy288@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-20','68000','4','55','emily295@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-20','17000','4','53','enoch299@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-28','35000','4','98','everley313@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-28','99000','4','50','felix318@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-4','51000','4','84','gail334@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-3-9','15000','4','43','gene339@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-11','13000','3','85','geoffrey342@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-11','63000','3','89','george343@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-12','63000','3','62','gilbert347@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-12','20000','3','20','gustave363@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-13','56000','3','14','harold374@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-15','6000','3','23','heather381@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-16','14000','3','51','hermosa390@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-19','89000','3','93','hilda393@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-22','90000','3','56','howar399@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-24','84000','3','58','ian407@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-5','32000','3','6','jacqueline425@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-5','81000','3','8','jay433@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-4-6','37000','3','29','joanna450@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-5-16','82000','3','54','judy464@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-5-1','63000','3','93','julia465@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-5-25','85000','3','30','kelly478@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2015-5-27','24000','3','88','laura496@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-1-18','89000','3','91','lauren498@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-1-20','29000','3','90','lewis515@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-1-2','51000','3','65','lorraine523@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-1-5','45000','3','30','lorraine523@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-1-9','44000','3','14','molly597@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-15','34000','3','64','murphy608@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-15','39000','3','44','murray610@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-1','22000','3','6','odelia641@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-1','84000','2','98','oliver645@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-1','73000','2','59','otto655@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-22','20000','2','50','owen656@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-24','95000','2','82','patrick665@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-26','10000','2','16','perry672@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-26','46000','2','98','perry672@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-3','99000','2','68','reginald706@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-4','8000','2','12','reuben709@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-5','53000','2','9','samantha739@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-5','65000','2','52','saxon747@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-6','58000','2','2','sebastiane751@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-6','14000','2','27','sigrid761@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-7','27000','2','48','theobald790@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-7','87000','2','91','tim797@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-8','24000','2','67','todd803@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-2-8','78000','2','92','tom804@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-14','87000','2','3','ursula819@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-15','85000','2','34','valentine821@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-15','40000','2','62','vic831@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-16','75000','2','23','webb852@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-17','38000','2','76','webster853@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-23','80000','2','10','gilbert347@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-2','71000','2','24','gustave363@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-3','39000','2','71','harold374@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-3','34000','2','57','heather381@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-5','71000','1','29','hermosa390@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-6','52000','1','26','hilda393@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-3-8','61000','1','31','howar399@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-10','73000','1','60','ian407@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-11','86000','1','93','jacqueline425@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-11','29000','1','67','jay433@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-12','62000','1','13','joanna450@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-13','26000','1','30','judy464@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-16','74000','1','32','julia465@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-17','67000','1','65','kelly478@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-19','72000','1','81','laura496@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-21','28000','1','3','lauren498@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-25','46000','1','22','lewis515@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-26','43000','1','57','lorraine523@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-27','30000','1','24','tom804@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-6','2000','1','42','ursula819@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-6','76000','1','81','valentine821@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-4-9','35000','1','80','vic831@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-5-13','87000','1','47','webb852@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-5-13','46000','1','97','webster853@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-5-14','47000','1','49','gilbert347@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-5-15','19000','1','21','gustave363@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-5-23','60000','1','5','harold374@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-5-7','23000','1','23','heather381@gmail.com');
insert into orderform(orderform_time,orderform_total,orderform_status,hospital_id,mb_email) values('2016-5-8','3000','1','23','hermosa390@gmail.com');
insert into cart(mb_email,product_id,cart_quantity) values('harold374@gmail.com','44','1');
insert into cart(mb_email,product_id,cart_quantity) values('hedy384@gmail.com','21','1');
insert into cart(mb_email,product_id,cart_quantity) values('elroy288@gmail.com','31','1');
insert into cart(mb_email,product_id,cart_quantity) values('norman635@gmail.com','44','1');
insert into cart(mb_email,product_id,cart_quantity) values('felix318@gmail.com','75','1');
insert into cart(mb_email,product_id,cart_quantity) values('bert115@gmail.com','45','1');
insert into cart(mb_email,product_id,cart_quantity) values('tim797@gmail.com','71','1');
insert into cart(mb_email,product_id,cart_quantity) values('laura496@gmail.com','34','1');
insert into cart(mb_email,product_id,cart_quantity) values('cyril218@gmail.com','22','1');
insert into cart(mb_email,product_id,cart_quantity) values('victoria834@gmail.com','52','1');
insert into cart(mb_email,product_id,cart_quantity) values('kerwin484@gmail.com','14','1');
insert into cart(mb_email,product_id,cart_quantity) values('bradley141@gmail.com','42','1');
insert into cart(mb_email,product_id,cart_quantity) values('myrna612@gmail.com','23','1');
insert into cart(mb_email,product_id,cart_quantity) values('howar399@gmail.com','24','1');
insert into cart(mb_email,product_id,cart_quantity) values('gilbert347@gmail.com','51','1');
insert into cart(mb_email,product_id,cart_quantity) values('myrna612@gmail.com','14','1');
insert into cart(mb_email,product_id,cart_quantity) values('dale220@gmail.com','12','1');
insert into cart(mb_email,product_id,cart_quantity) values('naomi615@gmail.com','31','1');
insert into cart(mb_email,product_id,cart_quantity) values('carr168@gmail.com','25','1');
insert into cart(mb_email,product_id,cart_quantity) values('julia465@gmail.com','71','1');
insert into cart(mb_email,product_id,cart_quantity) values('sebastiane751@gmail.com','53','1');
insert into cart(mb_email,product_id,cart_quantity) values('berg110@gmail.com','31','1');
insert into cart(mb_email,product_id,cart_quantity) values('corey210@gmail.com','35','1');
insert into cart(mb_email,product_id,cart_quantity) values('wordsworth866@gmail.com','23','1');
insert into cart(mb_email,product_id,cart_quantity) values('howar399@gmail.com','63','1');
insert into cart(mb_email,product_id,cart_quantity) values('kevin485@gmail.com','51','1');
insert into cart(mb_email,product_id,cart_quantity) values('theobald790@gmail.com','45','1');
insert into cart(mb_email,product_id,cart_quantity) values('kirk489@gmail.com','45','1');
insert into cart(mb_email,product_id,cart_quantity) values('clare193@gmail.com','73','1');
insert into cart(mb_email,product_id,cart_quantity) values('sebastiane751@gmail.com','51','1');
insert into cart(mb_email,product_id,cart_quantity) values('reuben709@gmail.com','24','1');
insert into cart(mb_email,product_id,cart_quantity) values('webb852@gmail.com','62','1');
insert into cart(mb_email,product_id,cart_quantity) values('gene339@gmail.com','25','1');
insert into cart(mb_email,product_id,cart_quantity) values('berg110@gmail.com','24','1');
insert into cart(mb_email,product_id,cart_quantity) values('clare193@gmail.com','55','1');
insert into cart(mb_email,product_id,cart_quantity) values('kevin485@gmail.com','23','1');
insert into cart(mb_email,product_id,cart_quantity) values('corey210@gmail.com','65','1');
insert into cart(mb_email,product_id,cart_quantity) values('elroy288@gmail.com','65','1');
insert into cart(mb_email,product_id,cart_quantity) values('stanley772@gmail.com','64','1');
insert into cart(mb_email,product_id,cart_quantity) values('harold374@gmail.com','22','1');
insert into cart(mb_email,product_id,cart_quantity) values('geoffrey342@gmail.com','24','1');
insert into cart(mb_email,product_id,cart_quantity) values('drew257@gmail.com','15','1');
insert into cart(mb_email,product_id,cart_quantity) values('drew257@gmail.com','64','1');
insert into cart(mb_email,product_id,cart_quantity) values('sebastiane751@gmail.com','12','1');
insert into cart(mb_email,product_id,cart_quantity) values('otto655@gmail.com','21','1');
insert into cart(mb_email,product_id,cart_quantity) values('norman635@gmail.com','72','1');
insert into cart(mb_email,product_id,cart_quantity) values('murray610@gmail.com','65','1');
insert into cart(mb_email,product_id,cart_quantity) values('hilda393@gmail.com','43','1');
insert into cart(mb_email,product_id,cart_quantity) values('gene339@gmail.com','74','1');
insert into cart(mb_email,product_id,cart_quantity) values('perry672@gmail.com','31','1');
insert into cart(mb_email,product_id,cart_quantity) values('harold374@gmail.com','54','1');
insert into cart(mb_email,product_id,cart_quantity) values('kent482@gmail.com','52','1');
insert into cart(mb_email,product_id,cart_quantity) values('bradley141@gmail.com','54','1');
insert into cart(mb_email,product_id,cart_quantity) values('tom804@gmail.com','75','1');
insert into cart(mb_email,product_id,cart_quantity) values('george343@gmail.com','54','1');
insert into cart(mb_email,product_id,cart_quantity) values('naomi615@gmail.com','32','1');
insert into cart(mb_email,product_id,cart_quantity) values('kent482@gmail.com','12','1');
insert into cart(mb_email,product_id,cart_quantity) values('judy464@gmail.com','74','1');
insert into cart(mb_email,product_id,cart_quantity) values('molly597@gmail.com','14','1');
insert into cart(mb_email,product_id,cart_quantity) values('stanley772@gmail.com','73','1');
insert into cart(mb_email,product_id,cart_quantity) values('hermosa390@gmail.com','22','1');
insert into cart(mb_email,product_id,cart_quantity) values('reginald706@gmail.com','55','1');
insert into cart(mb_email,product_id,cart_quantity) values('zebulon883@gmail.com','14','1');
insert into cart(mb_email,product_id,cart_quantity) values('candance161@gmail.com','12','1');
insert into cart(mb_email,product_id,cart_quantity) values('wordsworth866@gmail.com','72','1');
insert into cart(mb_email,product_id,cart_quantity) values('enoch299@gmail.com','74','1');
insert into cart(mb_email,product_id,cart_quantity) values('dale220@gmail.com','41','1');
insert into cart(mb_email,product_id,cart_quantity) values('molly597@gmail.com','53','1');
insert into cart(mb_email,product_id,cart_quantity) values('harold374@gmail.com','23','1');
insert into cart(mb_email,product_id,cart_quantity) values('heather381@gmail.com','45','1');
insert into cart(mb_email,product_id,cart_quantity) values('oliver645@gmail.com','12','1');
insert into cart(mb_email,product_id,cart_quantity) values('murphy608@gmail.com','41','1');
insert into cart(mb_email,product_id,cart_quantity) values('candance161@gmail.com','34','1');
insert into cart(mb_email,product_id,cart_quantity) values('reuben709@gmail.com','14','1');
insert into cart(mb_email,product_id,cart_quantity) values('jacqueline425@gmail.com','42','1');
insert into cart(mb_email,product_id,cart_quantity) values('kelly478@gmail.com','63','1');
insert into cart(mb_email,product_id,cart_quantity) values('emily295@gmail.com','24','1');
insert into cart(mb_email,product_id,cart_quantity) values('samantha739@gmail.com','61','1');
insert into cart(mb_email,product_id,cart_quantity) values('carr168@gmail.com','62','1');
insert into cart(mb_email,product_id,cart_quantity) values('enoch299@gmail.com','24','1');
insert into cart(mb_email,product_id,cart_quantity) values('wordsworth866@gmail.com','42','1');
insert into cart(mb_email,product_id,cart_quantity) values('paddy657@gmail.com','34','1');
insert into cart(mb_email,product_id,cart_quantity) values('bradley141@gmail.com','34','1');
insert into cart(mb_email,product_id,cart_quantity) values('kerwin484@gmail.com','54','1');
insert into cart(mb_email,product_id,cart_quantity) values('kirk489@gmail.com','53','1');
insert into cart(mb_email,product_id,cart_quantity) values('oliver645@gmail.com','63','1');
insert into cart(mb_email,product_id,cart_quantity) values('perry672@gmail.com','61','1');
insert into cart(mb_email,product_id,cart_quantity) values('felix318@gmail.com','52','1');
insert into cart(mb_email,product_id,cart_quantity) values('pamela661@gmail.com','71','1');
insert into cart(mb_email,product_id,cart_quantity) values('mandy544@gmail.com','45','1');
insert into cart(mb_email,product_id,cart_quantity) values('everley313@gmail.com','74','1');
insert into cart(mb_email,product_id,cart_quantity) values('gail334@gmail.com','63','1');
insert into cart(mb_email,product_id,cart_quantity) values('hilda393@gmail.com','34','1');
insert into cart(mb_email,product_id,cart_quantity) values('bennett108@gmail.com','71','1');
insert into cart(mb_email,product_id,cart_quantity) values('todd803@gmail.com','23','1');
insert into cart(mb_email,product_id,cart_quantity) values('murphy608@gmail.com','55','1');
insert into cart(mb_email,product_id,cart_quantity) values('elroy288@gmail.com','71','1');
insert into cart(mb_email,product_id,cart_quantity) values('ian407@gmail.com','42','1');
insert into cart(mb_email,product_id,cart_quantity) values('howar399@gmail.com','74','1');
insert into cart(mb_email,product_id,cart_quantity) values('sigrid761@gmail.com','53','1');
insert into doctor(doctor_id,doctor_name) values('1','�i�T�T');
insert into doctor(doctor_id,doctor_name) values('2','�L�F��');
insert into doctor(doctor_id,doctor_name) values('3','�L�F��');
insert into doctor(doctor_id,doctor_name) values('4','���ؤ�');
insert into doctor(doctor_id,doctor_name) values('5','���q�]');
insert into doctor(doctor_id,doctor_name) values('6','�c���X');
insert into doctor(doctor_id,doctor_name) values('7','�Q���s');
insert into doctor(doctor_id,doctor_name) values('8','�Y���q');
insert into doctor(doctor_id,doctor_name) values('9','²�C�s');
insert into doctor(doctor_id,doctor_name) values('10','ù���u');
insert into doctor(doctor_id,doctor_name) values('11','�«ۤ�');
insert into doctor(doctor_id,doctor_name) values('12','�����Q');
insert into doctor(doctor_id,doctor_name) values('13','���ܩ�');
insert into doctor(doctor_id,doctor_name) values('14','���i��');
insert into doctor(doctor_id,doctor_name) values('15','���a��');
insert into doctor(doctor_id,doctor_name) values('16','�����');
insert into doctor(doctor_id,doctor_name) values('17','�L����');
insert into doctor(doctor_id,doctor_name) values('18','���ؤ�');
insert into doctor(doctor_id,doctor_name) values('19','�L����');
insert into doctor(doctor_id,doctor_name) values('20','�L����');
insert into doctor(doctor_id,doctor_name) values('21','�����v');
insert into doctor(doctor_id,doctor_name) values('22','�����y');
insert into doctor(doctor_id,doctor_name) values('23','������');
insert into doctor(doctor_id,doctor_name) values('24','�G����');
insert into doctor(doctor_id,doctor_name) values('25','���P�w��');
insert into doctor(doctor_id,doctor_name) values('26','�}�q�x');
insert into doctor(doctor_id,doctor_name) values('27','�����p');
insert into doctor(doctor_id,doctor_name) values('28','�}�R��');
insert into doctor(doctor_id,doctor_name) values('29','�¤���');
insert into doctor(doctor_id,doctor_name) values('30','���ɮ�');
insert into doctor(doctor_id,doctor_name) values('31','���s�q');
insert into doctor(doctor_id,doctor_name) values('32','�d�ɰx');
insert into doctor(doctor_id,doctor_name) values('33','���°�');
insert into doctor(doctor_id,doctor_name) values('34','�L����');
insert into doctor(doctor_id,doctor_name) values('35','�����');
insert into doctor(doctor_id,doctor_name) values('36','�G����');
insert into doctor(doctor_id,doctor_name) values('37','������');
insert into doctor(doctor_id,doctor_name) values('38','�d�l��');
insert into doctor(doctor_id,doctor_name) values('39','�L�g�L');
insert into doctor(doctor_id,doctor_name) values('40','���`��');
insert into doctor(doctor_id,doctor_name) values('41','���ڭ�');
insert into doctor(doctor_id,doctor_name) values('42','������');
insert into doctor(doctor_id,doctor_name) values('43','���u�s');
insert into doctor(doctor_id,doctor_name) values('44','�L����');
insert into doctor(doctor_id,doctor_name) values('45','�L�M�E');
insert into doctor(doctor_id,doctor_name) values('46','���R��');
insert into doctor(doctor_id,doctor_name) values('47','�����N');
insert into doctor(doctor_id,doctor_name) values('48','�L�q��');
insert into doctor(doctor_id,doctor_name) values('49','��s��');
insert into doctor(doctor_id,doctor_name) values('50','��K��');
insert into doctor(doctor_id,doctor_name) values('51','��w��');
insert into doctor(doctor_id,doctor_name) values('52','������');
insert into doctor(doctor_id,doctor_name) values('53','������');
insert into doctor(doctor_id,doctor_name) values('54','�L����');
insert into doctor(doctor_id,doctor_name) values('55','������');
insert into doctor(doctor_id,doctor_name) values('56','���Ѳ�');
insert into doctor(doctor_id,doctor_name) values('57','���夯');
insert into doctor(doctor_id,doctor_name) values('58','�¦w��');
insert into doctor(doctor_id,doctor_name) values('59','�B����');
insert into doctor(doctor_id,doctor_name) values('60','���ѳ�');
insert into doctor(doctor_id,doctor_name) values('61','�H����');
insert into doctor(doctor_id,doctor_name) values('62','�C�q�e');
insert into doctor(doctor_id,doctor_name) values('63','���B�}');
insert into doctor(doctor_id,doctor_name) values('64','�����F');
insert into doctor(doctor_id,doctor_name) values('65','�d�A��');
insert into doctor(doctor_id,doctor_name) values('66','�i�a��');
insert into doctor(doctor_id,doctor_name) values('67','���ا�');
insert into doctor(doctor_id,doctor_name) values('68','������');
insert into doctor(doctor_id,doctor_name) values('69','���ïE');
insert into doctor(doctor_id,doctor_name) values('70','�x����');
insert into doctor(doctor_id,doctor_name) values('71','�}�F��');
insert into doctor(doctor_id,doctor_name) values('72','������');
insert into doctor(doctor_id,doctor_name) values('73','�}��');
insert into doctor(doctor_id,doctor_name) values('74','�P����');
insert into doctor(doctor_id,doctor_name) values('75','�^���L');
insert into doctor(doctor_id,doctor_name) values('76','�L�F��');
insert into doctor(doctor_id,doctor_name) values('77','�^���');
insert into doctor(doctor_id,doctor_name) values('78','�^���~');
insert into doctor(doctor_id,doctor_name) values('79','�α��R');
insert into doctor(doctor_id,doctor_name) values('80','��Ķ��');
insert into doctor(doctor_id,doctor_name) values('81','����');
insert into doctor(doctor_id,doctor_name) values('82','�L����');
insert into doctor(doctor_id,doctor_name) values('83','��ѡH');
insert into doctor(doctor_id,doctor_name) values('84','��s�q');
insert into doctor(doctor_id,doctor_name) values('85','�ҩ|�w');
insert into doctor(doctor_id,doctor_name) values('86','�P�ө�');
insert into doctor(doctor_id,doctor_name) values('87','�i�s�a');
insert into doctor(doctor_id,doctor_name) values('88','���a��');
insert into doctor(doctor_id,doctor_name) values('89','�L�֩g');
insert into doctor(doctor_id,doctor_name) values('90','���B�a');
insert into doctor(doctor_id,doctor_name) values('91','���Z��');
insert into doctor(doctor_id,doctor_name) values('92','�����H');
insert into doctor(doctor_id,doctor_name) values('93','���a�v');
insert into doctor(doctor_id,doctor_name) values('94','���J��');
insert into doctor(doctor_id,doctor_name) values('95','���ɷ�');
insert into doctor(doctor_id,doctor_name) values('96','�ԥK��');
insert into doctor(doctor_id,doctor_name) values('97','��T��');
insert into doctor(doctor_id,doctor_name) values('98','�d��G');
insert into doctor(doctor_id,doctor_name) values('99','�i�ɫ�');
insert into doctor(doctor_id,doctor_name) values('100','�L���R');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('33','52','1','63','2016-8-3 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('33','15','1','96','2015-8-11 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('33','44','1','15','2015-6-3 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('34','24','1','76','2016-9-6 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('34','45','1','62','2016-12-8 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('35','35','1','4','2016-2-11 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('37','65','1','23','2016-10-12 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('37','75','1','88','2016-6-17 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('38','22','1','12','2015-5-12 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('40','12','1','95','2015-8-22 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('41','11','1','95','2016-9-9 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('41','53','1','97','2016-12-21 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('42','31','1','65','2016-10-2 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('42','63','1','80','2016-5-26 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('43','55','1','99','2016-2-7 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('43','33','1','86','2016-6-10 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('43','65','1','95','2016-2-2 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('45','42','1','61','2015-10-4 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('45','44','1','9','2016-10-3 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('45','62','1','5','2015-10-10 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('48','73','1','32','2015-3-17 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('52','34','1','84','2015-9-25 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('54','22','1','69','2015-8-9 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('55','52','1','92','2015-3-16 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('55','72','1','29','2016-4-1 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('56','54','1','23','2015-9-2 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('57','21','1','67','2015-3-17 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('57','13','1','41','2016-10-26 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('58','63','1','53','2016-6-2 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('58','24','1','6','2016-5-6 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('62','11','1','53','2016-2-21 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('63','35','1','64','2016-7-23 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('63','52','1','22','2016-8-24 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('64','23','1','72','2015-11-10 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('65','61','1','47','2016-6-3 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('65','33','1','18','2016-4-17 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('66','32','1','99','2016-5-16 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('69','54','1','51','2015-1-27 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('69','44','1','96','2015-2-1 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('70','14','1','64','2016-6-23 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('70','22','1','38','2015-2-12 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('70','63','1','65','2015-10-28 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('72','31','1','84','2015-5-11 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('74','45','1','89','2015-7-19 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('74','13','1','10','2016-1-20 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('75','45','1','6','2016-4-13 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('75','45','1','12','2015-2-12 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('75','74','1','19','2015-7-7 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('77','33','1','34','2016-10-27 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('78','65','1','26','2015-4-22 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('80','62','1','59','2016-11-27 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('80','32','1','40','2015-11-26 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('80','44','1','98','2016-4-9 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('81','33','1','67','2016-10-4 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('81','73','1','42','2015-7-12 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('82','74','1','92','2016-6-19 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('82','24','1','52','2016-3-17 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('86','25','1','63','2015-4-1 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('86','15','1','16','2015-1-4 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('88','14','1','43','2015-3-10 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('88','41','1','56','2016-8-8 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('90','34','1','49','2016-10-2 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('90','33','1','69','2015-10-14 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('92','52','1','67','2015-10-22 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('93','52','1','65','2016-4-20 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('93','63','1','54','2015-8-11 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('97','44','1','54','2016-3-4 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('97','23','1','8','2016-8-16 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('99','55','1','72','2016-6-26 00:00:00');
insert into orderdetail(orderform_id,product_id,cart_quantity,doctor_id,orderdetail_surgerytime) values('99','72','1','39','2016-5-14 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('1','11','23','2016-2-16 00:00:00','2016-5-16 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('2','12','52','2016-2-2 00:00:00','2016-5-2 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('3','13','79','2016-4-12 00:00:00','2016-7-12 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('4','14','85','2016-5-18 00:00:00','2016-8-18 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('5','15','69','2016-4-10 00:00:00','2016-7-10 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('6','21','48','2016-4-5 00:00:00','2016-7-5 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('7','22','97','2016-4-25 00:00:00','2016-7-25 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('8','23','39','2016-5-22 00:00:00','2016-8-22 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('9','24','50','2016-1-11 00:00:00','2016-4-11 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('10','25','20','2016-3-8 00:00:00','2016-6-8 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('11','31','79','2016-5-21 00:00:00','2016-8-21 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('12','32','17','2016-4-10 00:00:00','2016-7-10 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('13','33','26','2016-1-21 00:00:00','2016-4-21 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('14','34','70','2016-3-1 00:00:00','2016-6-1 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('15','35','18','2016-3-15 00:00:00','2016-6-15 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('16','41','8','2016-2-21 00:00:00','2016-5-21 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('17','42','67','2016-4-6 00:00:00','2016-7-6 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('18','43','69','2016-4-10 00:00:00','2016-7-10 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('19','44','57','2016-2-5 00:00:00','2016-5-5 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('20','45','50','2016-4-27 00:00:00','2016-7-27 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('21','51','63','2016-4-22 00:00:00','2016-7-22 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('22','52','19','2016-3-26 00:00:00','2016-6-26 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('23','53','19','2016-3-7 00:00:00','2016-6-7 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('24','54','57','2016-2-4 00:00:00','2016-5-4 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('25','55','69','2016-3-10 00:00:00','2016-6-10 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('26','61','97','2016-4-17 00:00:00','2016-7-17 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('27','62','51','2016-2-6 00:00:00','2016-5-6 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('28','63','88','2016-2-20 00:00:00','2016-5-20 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('29','64','98','2016-1-6 00:00:00','2016-4-6 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('30','65','77','2016-3-12 00:00:00','2016-6-12 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('31','71','4','2016-3-19 00:00:00','2016-6-19 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('32','72','80','2016-2-19 00:00:00','2016-5-19 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('33','73','38','2016-3-8 00:00:00','2016-6-8 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('34','74','66','2016-5-19 00:00:00','2016-8-19 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('35','75','50','2016-4-11 00:00:00','2016-7-11 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('36','11','51','2016-5-21 00:00:00','2016-8-21 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('37','12','66','2016-3-7 00:00:00','2016-6-7 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('38','13','33','2016-4-25 00:00:00','2016-7-25 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('39','14','86','2016-1-15 00:00:00','2016-4-15 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('40','15','34','2016-2-13 00:00:00','2016-5-13 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('41','21','86','2016-3-22 00:00:00','2016-6-22 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('42','22','86','2016-3-5 00:00:00','2016-6-5 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('43','23','56','2016-4-17 00:00:00','2016-7-17 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('44','24','23','2016-1-28 00:00:00','2016-4-28 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('45','25','65','2016-3-15 00:00:00','2016-6-15 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('46','31','51','2016-2-26 00:00:00','2016-5-26 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('47','32','19','2016-4-20 00:00:00','2016-7-20 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('48','33','34','2016-1-5 00:00:00','2016-4-5 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('49','34','44','2016-4-15 00:00:00','2016-7-15 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('50','35','78','2016-3-5 00:00:00','2016-6-5 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('51','41','84','2016-4-4 00:00:00','2016-7-4 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('52','42','90','2016-2-9 00:00:00','2016-5-9 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('53','43','88','2016-3-14 00:00:00','2016-6-14 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('54','44','62','2016-1-14 00:00:00','2016-4-14 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('55','45','29','2016-1-23 00:00:00','2016-4-23 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('56','51','16','2016-3-20 00:00:00','2016-6-20 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('57','52','13','2016-1-24 00:00:00','2016-4-24 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('58','53','93','2016-4-8 00:00:00','2016-7-8 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('59','54','41','2016-3-19 00:00:00','2016-6-19 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('60','55','11','2016-4-15 00:00:00','2016-7-15 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('61','61','67','2016-3-12 00:00:00','2016-6-12 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('62','62','84','2016-2-12 00:00:00','2016-5-12 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('63','63','48','2016-2-28 00:00:00','2016-5-28 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('64','64','10','2016-4-9 00:00:00','2016-7-9 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('65','65','44','2016-4-22 00:00:00','2016-7-22 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('66','71','39','2016-4-25 00:00:00','2016-7-25 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('67','72','37','2016-2-21 00:00:00','2016-5-21 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('68','73','95','2016-2-4 00:00:00','2016-5-4 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('69','74','12','2016-5-12 00:00:00','2016-8-12 00:00:00');
insert into inventory(inventory_id,product_id,inventory_quantity,inventory_manufactureDate,inventory_expiryDate) values('70','75','100','2016-3-11 00:00:00','2016-6-11 00:00:00');


