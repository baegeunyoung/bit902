
insert into tb_seller (id, password, name, cellphone_number, permit_yn) values ('a', 'a', '배근', 0100101, 'n');
insert into tb_seller (id, password, name, cellphone_number, permit_yn) values ('uruga00', 'uruga00', '양원주', 01040299621, 'y');
insert into tb_seller (id, password, name, cellphone_number, permit_yn) values ('b', 'b', '근영', 0100000, 'y');

insert into tb_store (store_no, name, store_type, adress, latitude, longitude, seller_no) values
(8, "GS25", "2", "서울특별시 강남구 역삼1동 793-6", 37.493268, 127.036422, 2);

select * from tb_seller;

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

insert into tb_day_adjust (day_total_numbertb_day_adjust, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
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

insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (164643235, "2017-03-01", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (215334455, "2017-03-02", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (332523535, "2017-03-03", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (232938284, "2017-03-04", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (279284822, "2017-03-05", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (292502837, "2017-03-06", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (242523535, "2017-03-07", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (312643984, "2017-03-08", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (322422535, "2017-03-09", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (302523567, "2017-03-10", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (332523535, "2017-03-11", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (215235235, "2017-03-12", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (202523564, "2017-03-13", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (292523567, "2017-03-14", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (172523567, "2017-03-15", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (342523567, "2017-03-16", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (222523575, "2017-03-17", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (232523565, "2017-03-18", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (272523567, "2017-03-19", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (242523567, "2017-03-20", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (152523565, "2017-03-21", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (242523542, "2017-03-22", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (262523567, "2017-03-23", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (272523543, "2017-03-24", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (212523567, "2017-03-25", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (242523554, "2017-03-26", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (142523567, "2017-03-27", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (232523567, "2017-03-28", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (242523342, "2017-03-29", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (292523567, "2017-03-30", 8);

insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (429837, "2017-02-01", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (328482, "2017-02-02", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (529839, "2017-02-03", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (392819, "2017-02-04", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (183928, "2017-02-05", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (392839, "2017-02-06", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (289382, "2017-02-07", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (492838, "2017-02-08", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (192838, "2017-02-09", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (294827, "2017-02-10", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (287382, "2017-02-11", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (283728, "2017-02-12", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (291827, "2017-02-13", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (287198, "2017-02-14", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (273829, "2017-02-15", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (183728, "2017-02-16", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (398278, "2017-02-17", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (387283, "2017-02-18", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (417283, "2017-02-19", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (128372, "2017-02-20", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (238719, "2017-02-21", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (398927, "2017-02-22", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (128379, "2017-02-23", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (387283, "2017-02-24", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (298237, "2017-02-25", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (283779, "2017-02-26", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (182739, "2017-02-27", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (382783, "2017-02-28", 8);


insert into tb_store (name, store_type, adress, latitude, longitude, content, seller_no) values ("시대약국", 2, "서울특별시 서초구 효령로77길 34", 37.491910, 127.028768, "시대를 책임지는 약국!", 3);

insert into tb_menu (store_no, name, price, seller_no) values (10, "아로나민 골드", 12000, 3);
insert into tb_menu (store_no, name, price, seller_no) values (10, "오로나민C", 200, 3);
insert into tb_menu (store_no, name, price, seller_no) values (10, "식염수", 1500, 3);
insert into tb_menu (store_no, name, price, seller_no) values (10, "타이레놀", 3000, 3);
insert into tb_menu (store_no, name, price, seller_no) values (10, "게보린", 3500, 3);
insert into tb_menu (store_no, name, price, seller_no) values (10, "박카스", 8000, 3);

insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (563000, "2017-03-12", 10);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (342000, "2017-03-11", 10);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (451000, "2017-03-01", 10);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (394800, "2017-03-31", 10);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (743000, "2017-03-08", 10);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (649000, "2017-03-07", 10);

insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(23, 276000, current_date(), 10, "시대약국", 36, "아로나민 골드");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(34, 6800, current_date(), 10, "시대약국", 37, "오로나민C");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(12, 18000, current_date(), 10, "시대약국", 38, "식염수");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(32, 96000, current_date(), 10, "시대약국", 39, "타이레놀");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(12, 42000, current_date(), 10, "시대약국", 40, "게보린");
insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(35, 280000, current_date(), 10, "시대약국", 41, "박카스");
