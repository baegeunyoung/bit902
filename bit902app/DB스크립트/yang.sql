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





select * from bit902.tb_menu;

select * from tb_day_adjust;

select * from bit902.tb_seller;

select * from tb_store;

select *
  from tb_adjust a
 where a.store_no = (select s.store_no
					   from tb_store s
					  where seller_no = 2
	   );
        
select store_no
  from tb_store
where seller_no = 8;

select * from store_no;

select * from tb_store;

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

select * from tb_day_adjust;

select * from tb_store;

insert into tb_day_adjust (day_total_number, day_total_sales, day_adjust_date, store_no, store_name, menu_no, menu_name) values
(82, 127600, "2017-04-01", 8, "GS25", 6, "달콤한 대통과자");




insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (24214325, "2017-04-12", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (352535, "2017-04-11", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (24214325, "2017-04-10", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (38732887, "2017-04-09", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (38787658, "2017-04-08", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (389887, "2017-04-07", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (36783687, "2017-04-06", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (8736587, "2017-04-05", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (87638, "2017-04-04", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (87368, "2017-04-03", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (389886, "2017-04-02", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (87368623, "2017-04-01", 8);


insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (5235235, "2017-03-12", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (332523535, "2017-03-11", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (16464325, "2017-03-01", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (346436, "2017-03-31", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (5754758, "2017-03-08", 8);
insert into tb_month_adjust (month_total_sales, month_adjust_date, store_no) values (34644664, "2017-03-07", 8);


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


select * from tb_menu;

select * from tb_store;