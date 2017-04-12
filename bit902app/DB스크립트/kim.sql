select *
from tb_seller

insert into tb_seller(id, password, name, cellphone_number, permit_yn)
values('a', 'a', 'a', '01012345678', 'y')

insert into tb_seller(id, password, name, cellphone_number, permit_yn)
values('b', 'b', 'b', '01087654321', 'y')

insert into tb_seller(id, password, name, cellphone_number, permit_yn)
values('c', 'c', 'c', '12345678901', 'n')

delete
from tb_seller
where seller_no='58'

