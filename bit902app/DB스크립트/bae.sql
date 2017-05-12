-------------------------------------------------------
--사용자 테이블
-------------------------------------------------------
create table tb_buyer(
buyer_no int(6) unsigned not null auto_increment,
id varchar(20) not null,
password varchar(20) not null,
name varchar (15) not null,
cellphone_number varchar(11),
primary key(buyer_no)
);

-------------------------------------------------------
--판매자 테이블
-------------------------------------------------------
create table tb_seller(
seller_no int(6) unsigned not null auto_increment,
id varchar(20) not null,
password varchar(20) not null,
name varchar(15) not null,
cellphone_number varchar(11),
permit_yn varchar(1),
primary key(seller_no)
);

select * from tb_seller;

delete 
from tb_seller
where name='st1' or name='st2'
-------------------------------------------------------
--상점테이블
-------------------------------------------------------
create table tb_store (
store_no int(6) unsigned not null auto_increment,
name varchar(30) not null,
store_type int(3) not null,
adress varchar(255),
latitude double unsigned,
longitude double unsigned,
content varchar(300),
seller_no int(6) unsigned,
primary key(store_no),
foreign key(seller_no) references tb_seller(seller_no)
);

select * from tb_store
show create table tb_store;

alter table tb_store drop column latitude;
alter table tb_store drop column longitude;
alter table tb_store drop column store_type;
alter table tb_store add column store_type int(3) after name; 
alter table tb_store add column latitude double after adress; 
alter table tb_store add column longitude double after latitude;
alter table tb_store add column content varchar(300) after longitude; 
-------------------------------------------------------
--메뉴
-------------------------------------------------------
create table tb_menu (
menu_no int(6) unsigned not null auto_increment,
store_no int(6) unsigned,
seller_no int(6) unsigned,
name varchar(100) not null,
content varchar(300),
price int(10) unsigned not null,
size varchar(20),
primary key(menu_no),
foreign key(store_no) references tb_store(store_no),
foreign key(seller_no) references tb_seller(seller_no)
);

show create table tb_menu;

alter table tb_menu drop foreign key tb_menu_ibfk_2;

alter table tb_menu add column content varchar(300) after name; 
alter table tb_menu add column seller_no int(6) after store_no; 
alter table tb_menu add column store_no int(6) after size; 
alter table tb_menu add foreign key (seller_no) references tb_seller(seller_no);
alter table tb_menu add foreign key (store_no) references tb_store(store_no);


alter table tb_menu drop foreign key tb_menu_ibfk_1;
alter table tb_menu drop column store_no;

SET foreign_key_checks = 0;
alter table tb_menu add foreign key(seller_no) references tb_seller(selller_no);
SET foreign_key_checks = 1;

select * from tb_menu 

select * from tb_store_file

select m.name, 
    		   m.store_no,
    		   m.seller_no,
    		   m.content,
    		   m.price,
    		   m.size,
    		   m.menu_no,
    		   st.name as stName
    	  from tb_menu m
    inner join tb_store st
    		on m.store_no = st.store_no
    inner join tb_seller se
    		on st.seller_no = se.seller_no
    where m.seller_no = 80;




-------------------------------------------------------
--상점,메뉴 파일테이블
-------------------------------------------------------							 
create table tb_store_file(
	store_file_no int(6) unsigned not null auto_increment,
	ori_name varchar(50) not null,
	system_name varchar(50) not null,
	file_path varchar(50) not null,
	file_size varchar(50) not null,
	store_no int(6) unsigned,
	menu_no int(6) unsigned,
	seller_no int(6) unsigned,
	primary key (store_file_no),
	foreign key (store_no) references tb_store(store_no),
	foreign key (menu_no) references tb_menu(menu_no),
	foreign key (seller_no) references tb_seller(seller_no)
);	

select * from tb_store_file;

update tb_store_file set seller_no=80
where store_no=23;

show create table tb_store_file;
drop table tb_store_file;
alter table tb_store_file modify menu_no null;
alter table tb_store_file add column seller_no int(6) after store_no; 
alter table tb_store_file add foreign key (seller_no) references tb_seller(seller_no);
-------------------------------------------------------
--비콘테이블
-------------------------------------------------------			
create table tb_beacon(
beacon_no int(6) unsigned not null auto_increment,
beacon_serial_no varchar(8) not null,
table_no int(6) unsigned,
store_no int(6) unsigned,
primary key(beacon_no),
foreign key(store_no) references tb_store(store_no)
);


-------------------------------------------------------
--주문리스트테이블(판매자)
-------------------------------------------------------	
create table tb_order(
order_no int(6) unsigned not null auto_increment,
seller_no int(6) unsigned not null,
beacon_no int(6) unsigned,
order_date timestamp default current_timestamp not null,
order_content varchar(200),
device_token varchar(200),
order_state varchar(1) default '0',
primary key(order_no),
foreign key(seller_no) references tb_seller(seller_no),
foreign key(beacon_no) references tb_beacon(beacon_no),
foreign key(menu_no) references tb_menu(menu_no)
);

alter table tb_order add column user_name varchar(20) after order_content; 
select * from tb_order;
alter table tb_order add column table_no int(6) after seller_no; 
-------------------------------------------------------
--통계(판매자)
-------------------------------------------------------
create table tb_adjust(
adjust_no  int(6) unsigned not null auto_increment,
total_number int(12) unsigned not null,
total_sales int(12) unsigned not null,
adjust_date date not null,
store_no int(6) unsigned not null,
store_name varchar(30) not null,
menu_no int(6) unsigned not null,
menu_name varchar(100) not null,
primary key(adjust_no),
foreign key(store_no) references tb_store(store_no),
foreign key(menu_no) references tb_menu(menu_no)
);

-------------------------------------------------------
--판매자 스탬프 테이블
-------------------------------------------------------
create table tb_seller_stamp(
seller_stamp_no int(11) unsigned not null auto_increment,
max_stamp_size int(3) unsigned not null,
stamp_saving_option varchar(1) not null,
store_no int(6) unsigned not null,
primary key(seller_stamp_no),
foreign key(store_no) references tb_store(store_no)
);
delete from tb_event
where event_no = 69;

-------------------------------------------------------
--사용자 스탬프 테이블
-------------------------------------------------------
create table tb_buyer_stamp(
buyer_stamp_no int(11) unsigned not null auto_increment,
stamp_count int(3) unsigned not null,
buyer_no int(6) unsigned not null,
seller_stamp_no int(11) unsigned not null,
primary key(buyer_stamp_no),
foreign key(buyer_no) references tb_buyer(buyer_no),
foreign key(seller_stamp_no) references tb_seller_stamp(seller_stamp_no)
);

-------------------------------------------------------
--이벤트 테이블
-------------------------------------------------------
create table tb_event(
event_no int(6) unsigned not null auto_increment,
event_content varchar(150) not null, 
seller_no int(6) unsigned not null,
primary key(event_no),
foreign key(seller_no) references tb_seller(seller_no)
);

drop table tb_event

delete
from tb_event;

select * from tb_event;
show create table tb_event;
tb_event_ibfk_2
alter table tb_event drop foreign key tb_event_ibfk_1;
alter table tb_event drop column store_no;
alter table tb_event add column seller_no int(6) after event_no; 

SET foreign_key_checks = 0;
alter table tb_event add foreign key(seller_no) references tb_seller(seller_no);
SET foreign_key_checks = 1;
---------------------------------------------------------------------------------
--drop
---------------------------------------------------------------------------------
drop table tb_event;
drop table tb_buyer_stamp;
drop table tb_seller_stamp;
drop table tb_adjust;
drop table tb_adjust_month;
drop table tb_order;
drop table tb_beacon;
drop table tb_store_file;
drop table tb_menu;
drop table tb_store;
drop table tb_buyer;
drop table tb_seller;

select * from tb_buyer;
delete from tb_buyer
where name="쟝아";

select * from tb_order;

update tb_order set order_state = 0 where order_no = 155;