
-------------------------------------------------------
--사용자 테이블
-------------------------------------------------------
create table tb_buyer(
buyer_no int(6) unsigned not null auto_increment,
id varchar(20) not null,
password varchar(20),
name varchar (15),
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

-------------------------------------------------------
--메뉴
-------------------------------------------------------
create table tb_menu (
menu_no int(6) unsigned not null auto_increment,
store_no int(6) unsigned,
name varchar(100) not null,
price int(10) unsigned not null,
size varchar(30),
seller_no int(6) unsigned,
primary key(menu_no),
foreign key(store_no) references tb_store(store_no),
foreign key(seller_no) references tb_seller(seller_no)
);

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

-------------------------------------------------------
--비콘테이블
-------------------------------------------------------			
create table tb_beacon(
beacon_no int(6) unsigned not null auto_increment,
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
store_no int(6) unsigned not null,
beacon_no int(6) unsigned,
order_date timestamp default current_timestamp not null,
order_content varchar(200),
device_token varchar(200),
menu_no int(6) unsigned not null,
order_state varchar(1) default '0',
primary key(order_no),
foreign key(store_no) references tb_store(store_no),
foreign key(beacon_no) references tb_beacon(beacon_no),
foreign key(menu_no) references tb_menu(menu_no)
);

-------------------------------------------------------
--주문메뉴리스트테이블(판매자)
-------------------------------------------------------	
create table tb_order_menu(
order_menu_no int(6) unsigned not null auto_increment,
quantity int(3) unsigned not null,
order_no int(6) unsigned not null auto_increment,
menu_no int(6) unsigned not null,
primary key(order_menu_no),
foreign key(order_no) references tb_order(order_no),
foreign key(menu_no) references tb_menu(menu_no)
);

-------------------------------------------------------
--일일 통계(판매자)
-------------------------------------------------------
create table tb_day_adjust(
day_adjust_no int(6) unsigned not null auto_increment,
day_total_number int(12) unsigned not null,
day_total_sales int(12) unsigned not null,
day_adjust_date date not null,
store_no int(6) unsigned not null,
store_name varchar(30),
menu_no int(6) unsigned not null,
menu_name varchar(100) not null,
primary key(day_adjust_no),
foreign key(store_no) references tb_store(store_no),
foreign key(menu_no) references tb_menu(menu_no)
);

-------------------------------------------------------
--월별 통계(판매자) 
-------------------------------------------------------
create table tb_month_adjust(
month_adjust_no int(6) unsigned not null auto_increment,
month_total_sales int(12) unsigned not null,
month_adjust_date date not null,
store_no int(6) unsigned not null,
primary key(month_adjust_no),
foreign key(store_no) references tb_store(store_no)
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
event_content varchar(30) not null, 
seller_no int(6) unsigned not null,
primary key(event_no),
foreign key(seller_no) references tb_seller(seller_no)
);

---------------------------------------------------------------------------------
--drop
---------------------------------------------------------------------------------
drop table tb_event;
drop table tb_buyer_stamp;
drop table tb_seller_stamp;
drop table tb_adjust;
drop table tb_order_menu;
drop table tb_beacon;
drop table tb_store_file;
drop table tb_order;
drop table tb_menu;
drop table tb_store;
drop table tb_buyer;
drop table tb_seller;
