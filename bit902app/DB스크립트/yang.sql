-----------------------------------------------------------------------------------------------------------------------------

insert into tb_seller (id, password, name, cellphone_number, permit_yn) values ("aa", "aa", "배근영", "01001010101", "y");
insert into tb_seller (id, password, name, cellphone_number, permit_yn) values ("bb", "bb", "배바지", "01235010101", "y");

select * from tb_seller;

-----------------------------------------------------------------------------------------------------------------------------

insert into tb_store (name, store_type, adress, latitude, longitude, seller_no) values
("GS25", "2", "서울특별시 강남구 역삼1동 793-6", 37.493268, 127.036422, 2);

select * from tb_store;

-----------------------------------------------------------------------------------------------------------------------------

insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(14, 60200, sysdate(), 8, "GS25", 1, "과꽃씨");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(35, 150500, sysdate(), 8, "GS25", 2, "초코파이");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(87, 365400, sysdate(), 8, "GS25", 3, "몽쉘");

insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(83, 99600, sysdate(), 8, "GS25", 4, "컵라면");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(84, 100800, sysdate(), 8, "GS25", 5, "왕뚜껑");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(82, 147600, sysdate(), 8, "GS25", 6, "달콤한 대통과자");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(25, 15000, sysdate(), 8, "GS25", 7, "스낵면");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(82, 155800, sysdate(), 8, "GS25", 8, "핫바");

insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(144, 604200, current_date() - 1, 8, "GS25", 1, "과꽃씨");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(3425, 1502500, current_date() - 1, 8, "GS25", 2, "초코파이");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(87, 365400, current_date() - 1, 8, "GS25", 3, "몽쉘");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(33, 94600, current_date() - 1, 8, "GS25", 4, "컵라면");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(83, 1800, current_date() - 1, 8, "GS25", 5, "왕뚜껑");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(22, 17600, current_date() - 1, 8, "GS25", 6, "달콤한 대통과자");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(24, 12000, current_date() - 1, 8, "GS25", 7, "스낵면");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(42, 15800, current_date() - 1, 8, "GS25", 8, "핫바");

insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(33, 18400, current_date() - 2, 8, "GS25", 5, "왕뚜껑");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(82, 127600, current_date() - 2, 8, "GS25", 6, "달콤한 대통과자");

select * from tb_adjust;

select * from tb_adjust where year(adjust_date) = "2017" && month(adjust_date) = "03";

select * from tb_adjust where date(adjust_date) = date(now());

select * from tb_adjust where month(adjust_date) = month(now());
-----------------------------------------------------------------------------------------------------------------------------

insert into tb_menu (store_no, name, price, seller_no) values
(8, "과꽃씨", 2300, 2);
insert into tb_menu (store_no, name, price, seller_no) values
(8, "초코파이", 4300, 2);
insert into tb_menu (store_no, name, price, seller_no) values
(8, "몽쉘", 4200, 2);
insert into tb_menu (store_no, name, price, seller_no) values
(8, "컵라면", 1300, 2);
insert into tb_menu (store_no, name, price, seller_no) values
(8, "왕뚜껑", 1200, 2);
insert into tb_menu (store_no, name, price, seller_no) values
(8, "달콤한 대통과자", 1800, 2);
insert into tb_menu (store_no, name, price, seller_no) values
(8, "스낵면", 600, 2);
insert into tb_menu (store_no, name, price, seller_no) values
(8, "핫바", 1900, 2);

select * from tb_menu;

-----------------------------------------------------------------------------------------------------------------------------

select * from tb_store_file;

update tb_store set content = "아주 좋은 편의점 GS25입니다." where store_no = 8;

-----------------------------------------------------------------------------------------------------------------------------

insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (24214325, "2017-04-12", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (352535, "2017-04-11", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (24214325, "2017-04-10", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (38732887, "2017-04-09", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (38787658, "2017-04-08", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (389887, "2017-04-07", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (36783687, "2017-04-06", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (8736587, "2017-04-05", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (87638, "2017-04-04", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (87368, "2017-04-03", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (389886, "2017-04-02", 2);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (87368623, "2017-04-01", 2);