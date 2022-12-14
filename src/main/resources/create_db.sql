CREATE SCHEMA `project_ltw` DEFAULT CHARACTER SET utf8 ;
use project_ltw;

-- create role table
create table role(
	id bigint primary key auto_increment,
    name varchar(255),
    code varchar(255),
    created_by varchar(255),
    created_date timestamp,
    modified_by varchar(255),
    modified_date timestamp
);

-- create user table
create table users(
	id bigint primary key auto_increment,
	username varchar(255),
    user_password varchar(255),
    phone_number varchar(255),
    email varchar(255),
    role_id bigint,
    status int,
     created_by varchar(255),
    created_date timestamp,
    modified_by varchar(255),
    modified_date timestamp,
    FOREIGN KEY (role_id) REFERENCES role(id)
);

-- create category table
create table category(
	id bigint primary key auto_increment,
    name varchar(255),
    code varchar(255),
     created_by varchar(255),
    created_date timestamp,
    modified_by varchar(255),
    modified_date timestamp
);
-- create sub_category table
create table sub_category(
	id bigint primary key auto_increment,
    name varchar(255),
    code varchar(255),
    category_id bigint,
      created_by varchar(255),
    created_date timestamp,
    modified_by varchar(255),
    modified_date timestamp,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

-- create address table
create table address(
	id bigint primary key auto_increment,
    province varchar(255),
    district varchar(255),
    village varchar(255),
    detail varchar(255),
    id_user bigint,
	created_by varchar(255),
    created_date timestamp,
    modified_by varchar(255),
    modified_date timestamp,
    FOREIGN KEY (id_user) REFERENCES users(id)
);

-- create table product
create table product(
	id bigint primary key auto_increment,
    name varchar(255),
    price int,
    branch varchar(255),
    material varchar(255),
    sale_percent int,
    quantity int,
    sub_category_id bigint,
    created_by varchar(255),
    created_date timestamp,
    modified_by varchar(255),
    modified_date timestamp,
    FOREIGN KEY (sub_category_id) REFERENCES sub_category(id)
);
-- create table image
create table image(
	id bigint primary key auto_increment,
	link varchar(255),
    product_id bigint,
    created_by varchar(255),
    created_date timestamp,
    modified_by varchar(255),
    modified_date timestamp,
    FOREIGN KEY (product_id) REFERENCES product(id)
);
-- create table orders
create table orders(
	id bigint primary key auto_increment,
	total_price int,
    status varchar(255),
    order_date timestamp,
    recieve_date timestamp,
    user_id bigint,
    detail text,
	created_by varchar(255),
    created_date timestamp,
    modified_by varchar(255),
    modified_date timestamp,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
-- create table item
create table item(
	id bigint primary key auto_increment,
	name varchar(255),
    price_sell int,
    quantity int,
    product_id bigint,
    order_id bigint,
    size varchar(255),
    created_by varchar(255),
    created_date timestamp,
    modified_by varchar(255),
    modified_date timestamp,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);


-- insert role
insert into role(name, code)
values
('admin', 'admin'),
('user', 'user')
;
-- insert category
insert into category(name, code)
values
(
	'??o nam', 'ao-nam'
),
(
	'??o n???', 'ao-nu'
),
(
	'Qu???n nam', 'quan-nam'
),
(
	'Qu???n n???', 'quan-nu'
)
;
-- insert sub category
insert into sub_category(name, code, category_id)
values
-- ??o nam
(
	'S?? mi nam', 'so-mi-nam', 1
),
(
	'??o thun nam', 'so-thun-nam', 1
),
(
	'??o kho??c nam', 'ao-khoac-nam', 1
),
(
	'Polo nam', 'polo-nam', 1
),
-- ??o n???
(
	'S?? mi n???', 'so-mi-nu', 2
),
(
	'??o thun n???', 'so-thun-nu', 2
),
(
	'??o kho??c n???', 'ao-khoac-nu', 2
),
(
	'Polo n???', 'polo-nu', 2
),
-- qu???n nam
(
	'Qu???n jean nam', 'quan-jean-nam', 3
),
(
	'Qu???n kaki nam', 'quan-kaki-nam', 3
),
(
	'Qu???n jogger nam', 'quan-jogger-nam', 3
),
(
	'Qu???n short nam', 'quan-short-nam', 3
),
-- qu???n n???
(
	'Qu???n jean n???', 'quan-jean-nu', 4
),
(
	'Qu???n kaki n???', 'quan-kaki-nu', 4
),
(
	'Qu???n xu??ng n???', 'quan-xuong-nu', 4
),
(
	'Qu???n short n???', 'quan-short-nu', 4
)
;

-- insert product and image(2)
insert into product(name, price, sale_percent, quantity, branch, material, sub_category_id)
values
(
	'??o so?? mi nam form ro????ng ch???t kaki cao c???p, a??o so?? mi nam ha??n quo????c d??? m???c d??? ph???i ?????', -- varchar(100)
    150000, -- int
    5, -- int
    30, -- int
    'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kaki', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
)
;
insert into product(name, price, sale_percent, quantity, branch, material, sub_category_id)
values
(
	'??o s?? mi nam d??i tay tr???ng nam, ??o body c??ng s??? H??n qu???c', -- varchar(100)
    180000, -- int
    10, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailen', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
),
(
	'??o s?? mi nam d??i tay ??en nam, ??o body c??ng s??? H??n qu???c', -- varchar(100)
    180000, -- int
    10, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailen', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
),
(
	'??o s?? mi nam n??? d??i tay Unisex Basic m??u tr???ng v?? ??en s?? mi l???a', -- varchar(100)
    230000, -- int
    7, -- int
    30, -- int
	'GUCCI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'Cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
),
(
	'??o s?? mi nam ng???n tay Aristino ASS238S9', -- varchar(100)
    150000, -- int
    0, -- int
    30, -- int
	'LOUISVUITTON', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kate', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
),
(
	'??o s?? mi nam d??i tay c??ng s??? ki???u h??n qu???c ch???m pi tr???ng ch???t li???u bamboo', -- varchar(100)
    150000, -- int
    5, -- int
    30, -- int
	'MASSIMODUTTI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailua', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
),
(
	'??o s?? mi nam d??i tay c??ng s??? ki???u h??n qu???c ch???m pi xanh ch???t li???u bamboo', -- varchar(100)
    150000, -- int
    5, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailen', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
),
(
	'??o so?? mi nam form ro????ng ch???t kaki cao c???p, a??o so?? mi nam ha??n quo????c d??? m???c d??? ph???i ?????', -- varchar(100)
    300000, -- int
    10, -- int
    30, -- int
	'GUCCI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'Cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
),
(
	'??o So?? mi Drisk ??o?? ??en C???c tay H2D899', -- varchar(100)
    230000, -- int
    10, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'Cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
),
(
	'??o s?? mi ph???n quang V L ??? tay HT12', -- varchar(100)
    250000, -- int
    10, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailen', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    1 -- bigint
),
(
	'??o Thun Nam - ??o Polo Nam 2022 Hot Trend Ch???t M??t At16', -- varchar(100)
    240000, -- int
    5, -- int
    30, -- int
	'GUCCI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o ph??ng ??o thun nam c??? tr??n 4 chi???u cotton tr??n thun l???nh nhi???u m??u xuma', -- varchar(100)
    180000, -- int
    10, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kate', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o thun nam tr??n tay l??? bazic v???i Cotton', -- varchar(100)
    120000, -- int
    20, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'Cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o thun nam POLO thi???t k??? v???i c?? s???u cotton cao c???p ng???n tay', -- varchar(100)
    200000, -- int
    10, -- int
    30, -- int
	'LOUISVUITTON', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o Thun Nam c?? C??? Ph???i Ch???t Fom ?????p VNXK Cao C???p', -- varchar(100)
    190000, -- int
    0, -- int
    30, -- int
	'LOUISVUITTON', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kaki', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o thun tay l??? Fear of god hoa ????o Hogoto shop', -- varchar(100)
    160000, -- int
    5, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailen', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o thun unisex form r???ng phong c??ch ?????p ?????c l???', -- varchar(100)
    170000, -- int
    10, -- int
    30, -- int
	'MASSIMODUTTI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailua', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o thun unisex this is my friday', -- varchar(100)
    120000, -- int
    20, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailua', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o thun nam ng????n tay SLS', -- varchar(100)
    300000, -- int
    5, -- int
    30, -- int
	'LOUISVUITTON', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o Thun Nam N??? VN CLO in h??nh n??i - AT179', -- varchar(100)
    120000, -- int
    20, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailen', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    2 -- bigint
),
(
	'??o Kho??c Nam N???, ??o Ch???ng N???ng Thom', -- varchar(100)
    330000, -- int
    0, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o Kho??c Bomber NEW YORK', -- varchar(100)
    220000, -- int
    10, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o kho??c M???U M???I n??? hoodie', -- varchar(100)
    330000, -- int
    20, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailen', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o kho??c gi?? 1111 H??12', -- varchar(100)
    180000, -- int
    30, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o kho??c d?? cardigan unisex form r???ng', -- varchar(100)
    350000, -- int
    0, -- int
    30, -- int
	'GUCCI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kaki', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o Gi?? ZZIA Si??u Hot Unisex', -- varchar(100)
    250000, -- int
    15, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kate', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o kho??c jean nam m??u x??m ?????m r??ch ch???t b??', -- varchar(100)
    280000, -- int
    10, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'jeans', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o kho??c jean nam ??en tr??n kh??ng r??ch ????n gi???n', -- varchar(100)
    280000, -- int
    10, -- int
    30, -- int
	'MASSIMODUTTI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'jeans', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o kho??c kaki nam m???t l???p d???y, m???m th???i trang cao c???p Model Fashion AKK3006', -- varchar(100)
    185000, -- int
    5, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kaki', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o kho??c phao EARTH POWER 7 ', -- varchar(100)
    885000, -- int
    5, -- int
    30, -- int
	'LOUISVUITTON', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    3 -- bigint
),
(
	'??o polo nam cao c???p h??nh b??ng l??a v???i cotton tho??ng m??t', -- varchar(100)
    200000, -- int
    35, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o Polo Nam V???i C?? S???u Ch???t Cotton H??ng Cao C???p', -- varchar(100)
    350000, -- int
    0, -- int
    30, -- int
	'LOUISVUITTON', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o thun polo Plastic WNS ??o polo c??? tr???', -- varchar(100)
    320000, -- int
    20, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o Polo Nam t??i kh??a PL10 thun basic c???c tay', -- varchar(100)
    280000, -- int
    10, -- int
    30, -- int
	'MASIMODUTTI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kate', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o polo th??? thao nam c??? b??? h??nh in 3D', -- varchar(100)
    250000, -- int
    15, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailen', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o thun Polo tay l??? form r???ng ', -- varchar(100)
    330000, -- int
    20, -- int
    30, -- int
	'GUCCI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailua', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o Ph??ng Polo Nam 2 M??u ??en Tr???ng MANDO Tay L??? Cotton Cao C???p', -- varchar(100)
    370000, -- int
    10, -- int
    30, -- int
	'GUCCI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o polo nam FEAER DENIM ch???t tho??ng kh??', -- varchar(100)
    220000, -- int
    0, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailua', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o Polo Nam BEATRIX 5S', -- varchar(100)
    420000, -- int
    20, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kate', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o polo cao c???p MEN LUXURY', -- varchar(100)
    350000, -- int
    10, -- int
    30, -- int
	'LOUISVUITTON', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailua', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    4 -- bigint
),
(
	'??o S?? Mi tay ng???n Local Brand "TIDY SHIRT"', -- varchar(100)
    280000, -- int
    10, -- int
    30, -- int
	'LOUISVUITTON', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailua', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
),
(
	'??o s?? mi c???c tay c??? ?????c m??u ??en, v???i tho??ng m??t, kh??ng nh??n, form regular, ho??? ti???t ?????m tr???ng', -- varchar(100)
    170000, -- int
    20, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kate', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
),
(
	'S?? Mi Tr???ng N??? C??ng S??? Rymola', -- varchar(100)
    220000, -- int
    30, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
),
(
	'??o s?? mi ch???t L???a m??u ??en Ph???i Tr???ng phong c??ch tr??? trung, hi???n ?????i', -- varchar(100)
    420000, -- int
    0, -- int
    30, -- int
	'GUCCI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'cotton', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
),
(
	'??o Kho??c Cardigan Cotton Lanh M???ng D??ng R???ng C?? M?? Tr??m ?????u', -- varchar(100)
    180000, -- int
    10, -- int
    30, -- int
	'MASSIMODUTTI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailua', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
),
(
	's?? mi sale combo', -- varchar(100)
    330000, -- int
    50, -- int
    30, -- int
	'LOUISVUITTON', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kate', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
),
(
	'??o n?? t?? vai HD12', -- varchar(100)
    270000, -- int
    40, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailua', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
),
(
	'??O S?? MI ????I XANH L?? HOTTREND MS14772', -- varchar(100)
    240000, -- int
    10, -- int
    30, -- int
	'GUCCI', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kaki', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
),
(
	'??o s?? mi th???ng tay b???ng DA6', -- varchar(100)
    340000, -- int
    10, -- int
    30, -- int
	'UNIQLO', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'vailen', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
),
(
	'??o s?? mi n??? ch???t ????i thi???t k??? c??? tr??? phong c??ch nh???t b???n', -- varchar(100)
    280000, -- int
    30, -- int
    30, -- int
	'ZARA', -- varchar(100) (c??c th????ng hi???u: ZARA, UNIQLO, Massimo Dutti, Gucci, Louis Vuitton)
    'kate', -- varchar(100) (c??c ch???t li???u v???i, Cotton, Kaki, Kate, Jeans, V???i len, V???i l???a)
    5 -- bigint
)
;
insert into image(link, product_id)
values
(
	'https://cf.shopee.vn/file/d736957a6acce0bb5c6bd371ece7d2c5', -- varchar(255)
    1 -- bigint
),
(
	'https://cf.shopee.vn/file/b0136aa20156cbe31d56a325745b251a', -- varchar(255)
    1 -- bigint
),
(
	'https://cf.shopee.vn/file/b651c1827d51220de91caf42e6bcbb01', -- varchar(255)
    2 -- bigint
),
(
	'https://cf.shopee.vn/file/412a00b677207d2fd2a0a595853216e4', -- varchar(255)
    2 -- bigint
),
(
	'https://cf.shopee.vn/file/9699d8795b76006253ebdb7a17dc1b4f', -- varchar(255)
    3 -- bigint
),
(
	'https://cf.shopee.vn/file/ff0aefeb20c70dbc3dbb258979487752', -- varchar(255)
    3 -- bigint
),
(
	'https://cf.shopee.vn/file/744e90645d8017d5391d23ad37829fc7', -- varchar(255)
    4 -- bigint
),
(
	'https://cf.shopee.vn/file/ce3a32bdc6dfa8bf8754bcf86b2f4075', -- varchar(255)
    4 -- bigint
),
(
	'https://cf.shopee.vn/file/6320a93f875e80b38c4af11d67f79310_tn', -- varchar(255)
    5 -- bigint
),
(
	'https://cf.shopee.vn/file/d7647140b384d7e482edc25205c943ad', -- varchar(255)
    5 -- bigint
),
(
	'https://cf.shopee.vn/file/40b0a1cf378794f3a7bb6ef79868b312', -- varchar(255)
    6 -- bigint
),
(
	'https://cf.shopee.vn/file/6d060c113aa65a1fcc5bbe8296282427', -- varchar(255)
    6 -- bigint
),
(
	'https://cf.shopee.vn/file/1c0ab531c030fa74a7f80f851b9c6b4c', -- varchar(255)
    7 -- bigint
),
(
	'https://cf.shopee.vn/file/bf63eda2e7f58fe03f7de9a7d5a4da6e', -- varchar(255)
    7 -- bigint
),
(
	'https://cf.shopee.vn/file/da3b3a205b3ce5119cef116a5ad8b0a5', -- varchar(255)
    8 -- bigint
),
(
	'https://cf.shopee.vn/file/d736957a6acce0bb5c6bd371ece7d2c5', -- varchar(255)
    8 -- bigint
),
(
	'https://cf.shopee.vn/file/2063ead3203043cb59f917cf09bdc99b_tn', -- varchar(255)
    9 -- bigint
),
(
	'https://cf.shopee.vn/file/2a43fda15fe27519332eb251272b8d55', -- varchar(255)
    9 -- bigint
),
(
	'https://cf.shopee.vn/file/100fd68ff7dcea9dc4ecb25372be8d4b', -- varchar(255)
    10 -- bigint
),
(
	'https://cf.shopee.vn/file/100fd68ff7dcea9dc4ecb25372be8d4b', -- varchar(255)
    10 -- bigint
),
(
	'https://cf.shopee.vn/file/ed44beb3ba71d546f9df8d1707d84de7', -- varchar(255)
    11 -- bigint
),
(
	'https://cf.shopee.vn/file/18130f1b1337f6cec2e396f8ef41e85f', -- varchar(255)
    11 -- bigint
),
(
	'https://cf.shopee.vn/file/dd802080bf7259df4fcb4b507c1eb487', -- varchar(255)
    12 -- bigint
),
(
	'https://cf.shopee.vn/file/2577e677c391dfceb3186b40dc6d2fc4', -- varchar(255)
    12 -- bigint
),
(
	'https://cf.shopee.vn/file/1c59a830cb8ae29d98f9ff3eb6578e0c_tn', -- varchar(255)
    13 -- bigint
),
(
	'https://cf.shopee.vn/file/fc63e635e45a0daf4975daec303c3bd0', -- varchar(255)
    13 -- bigint
),
(
	'https://cf.shopee.vn/file/7d0984be70e9afaa1476bbfc8b6f02e3_tn', -- varchar(255)
    14 -- bigint
),
(
	'https://cf.shopee.vn/file/2583127cbc5077abc74b30b73d235929', -- varchar(255)
    14 -- bigint
),
(
	'https://cf.shopee.vn/file/1f86c29419621a11764be598854719b6_tn', -- varchar(255)
    15 -- bigint
),
(
	'https://cf.shopee.vn/file/470db4a149a7558ad4cf4e9c2e880c09', -- varchar(255)
    15 -- bigint
),
(
	'https://cf.shopee.vn/file/cae9e325d414d5140fbdf5f1e8dda920', -- varchar(255)
    16 -- bigint
),
(
	'https://cf.shopee.vn/file/87253d9a600c383a820c39b41b626390', -- varchar(255)
    16 -- bigint
),
(
	'https://cf.shopee.vn/file/2a2a7eee3056cd89235e0b7169e515dd', -- varchar(255)
    17 -- bigint
),
(
	'https://cf.shopee.vn/file/eb340b759b765fcd05702d3c20e0c2e2', -- varchar(255)
    17 -- bigint
),
(
	'https://cf.shopee.vn/file/727bacfb404b0414f79af4dd0703f8aa', -- varchar(255)
    18 -- bigint
),
(
	'https://cf.shopee.vn/file/8b02a8db50f1240861cb862d676bde68', -- varchar(255)
    18 -- bigint
),
(
	'https://cf.shopee.vn/file/50b6d32afbad28be486c01fd9d53645e', -- varchar(255)
    19 -- bigint
),
(
	'https://cf.shopee.vn/file/ef968347998f80de233e74d3fcd8e446', -- varchar(255)
    19 -- bigint
),
(
	'https://cf.shopee.vn/file/4e8c98f9a6e2165e377c8c5ef81a1254_tn', -- varchar(255)
    20 -- bigint
),
(
	'https://cf.shopee.vn/file/ac5f79c3bc6d8d88d5d246908c9de36b', -- varchar(255)
    20 -- bigint
),
(
	'https://cf.shopee.vn/file/6d2b1c02b60974cb19ed526bf0e08cb6', -- varchar(255)
    21 -- bigint
),
(
	'https://cf.shopee.vn/file/0ad52e1e855ef8467019b3394fb22f37', -- varchar(255)
    21 -- bigint
),
(
	'https://cf.shopee.vn/file/7b52e519b8956724ea2246532e3b5806', -- varchar(255)
    22 -- bigint
),
(
	'https://cf.shopee.vn/file/20f8f662636ae9281833329757e14c22', -- varchar(255)
    22 -- bigint
),
(
	'https://cf.shopee.vn/file/cecb40c3c1c6f432c12b25b884038582', -- varchar(255)
    23 -- bigint
),
(
	'https://cf.shopee.vn/file/8fb620b8ae5fb1f17428178230f94d1b', -- varchar(255)
    23 -- bigint
),
(
	'https://cf.shopee.vn/file/57d3d5e53c61d4dbdb2a740bee9574da', -- varchar(255)
    24 -- bigint
),
(
	'https://cf.shopee.vn/file/08455b14f0ffe4313f2702551e3c5df3', -- varchar(255)
    24 -- bigint
),
(
	'https://cf.shopee.vn/file/4db978b0819589bc606ec9fd46f72df3', -- varchar(255)
    25 -- bigint
),
(
	'https://cf.shopee.vn/file/336bd1b592264179df6ccbec19a8ec92', -- varchar(255)
    25 -- bigint
),
(
	'https://cf.shopee.vn/file/4b396c7ceb32048384a0f97a085ec1a5', -- varchar(255)
    26 -- bigint
),
(
	'https://cf.shopee.vn/file/e9478173c3bb62e04999db52256e44bb', -- varchar(255)
    26 -- bigint
),
(
	'https://cf.shopee.vn/file/df862c5948259344d599fef67d2151f7', -- varchar(255)
    27 -- bigint
),
(
	'https://cf.shopee.vn/file/2e6085cb5eb9538cd6f34f603e7962c7', -- varchar(255)
    27 -- bigint
),
(
	'https://cf.shopee.vn/file/42edca835f79f5c76e1a779912e0516d', -- varchar(255)
    28 -- bigint
),
(
	'https://cf.shopee.vn/file/c4d2da45ab0f6a1a4bd8ab39d446485e', -- varchar(255)
    28 -- bigint
),
(
	'https://cf.shopee.vn/file/87af92094c3fc66d1d8086913bd77b43', -- varchar(255)
    29 -- bigint
),
(
	'https://cf.shopee.vn/file/c9a82241d14c214a2d059851b544c596', -- varchar(255)
    29 -- bigint
),
(
	'https://cf.shopee.vn/file/af753953380a09ba700cc3aa5606a2c6', -- varchar(255)
    30 -- bigint
),
(
	'https://cf.shopee.vn/file/a639acc1937879f8959062bfa0070f2c', -- varchar(255)
    30 -- bigint
),
(
	'https://cf.shopee.vn/file/90bed56628b85254d9830a476a7cb778', -- varchar(255)
    31 -- bigint
),
(
	'https://cf.shopee.vn/file/f5c2c0845103efabf5b9fabbe809d151', -- varchar(255)
    31 -- bigint
),
(
	'https://cf.shopee.vn/file/da3329031acf2ca1ee4382124f01e704', -- varchar(255)
    32 -- bigint
),
(
	'https://cf.shopee.vn/file/f0c7c318f33741da52fa467236be7725', -- varchar(255)
    32 -- bigint
),
(
	'https://cf.shopee.vn/file/b67b69e4d99f8c7021f91e758772ab32', -- varchar(255)
    33 -- bigint
),
(
	'https://cf.shopee.vn/file/681ddac54ab94173ad2af570ee6358ff', -- varchar(255)
    33 -- bigint
),
(
	'https://cf.shopee.vn/file/b8208e83c1110bb7d5fc5e169188998d', -- varchar(255)
    34 -- bigint
),
(
	'https://cf.shopee.vn/file/0104f380e94f6c5c05f4b30502c4cf61', -- varchar(255)
    34 -- bigint
),
(
	'https://cf.shopee.vn/file/a5d9417be2b910b8eecb3714bdbf762a', -- varchar(255)
    35 -- bigint
),
(
	'https://cf.shopee.vn/file/804e4c70eedf25745083432d5e55f966', -- varchar(255)
    35 -- bigint
),
(
	'https://cf.shopee.vn/file/0a60e5330c420947059a7381422c0091', -- varchar(255)
    36 -- bigint
),
(
	'https://cf.shopee.vn/file/0c11de8e9fe5017dd57f1e6aff7fd6e6', -- varchar(255)
    36 -- bigint
),
(
	'https://cf.shopee.vn/file/c58f2e24c5889ab3ba3333093c8954de', -- varchar(255)
    37 -- bigint
),
(
	'https://cf.shopee.vn/file/fd24686cf071772e667b5929c401aaaf', -- varchar(255)
    37 -- bigint
),
(
	'https://cf.shopee.vn/file/fe9a1fe66075938674d013c64d447b2e', -- varchar(255)
    38 -- bigint
),
(
	'https://cf.shopee.vn/file/d331ee30dcb84b31f2bd0d30f1853225', -- varchar(255)
    38 -- bigint
),
(
	'https://cf.shopee.vn/file/a28bba9a287f6c2734f1e2f899ee4739', -- varchar(255)
    39 -- bigint
),
(
	'https://cf.shopee.vn/file/84f1410e285f9643d9773f9afa492c34', -- varchar(255)
    39 -- bigint
),
(
	'https://cf.shopee.vn/file/c9cd9b63bb236f2c3802f418ccb2b871', -- varchar(255)
    40 -- bigint
),
(
	'https://cf.shopee.vn/file/4e347b4065974cd5fec5d7b6bfbac4a1', -- varchar(255)
    40 -- bigint
),
(
	'https://cf.shopee.vn/file/20e43db0285f46851a86c4b40da0c7d5', -- varchar(255)
    41 -- bigint
),
(
	'https://cf.shopee.vn/file/f50a384cea0af6ce7411f8f41e918c0b', -- varchar(255)
    41 -- bigint
),
(
	'https://cf.shopee.vn/file/9e7a1fe6354a1e30ebe31f6c855c8d7e', -- varchar(255)
    42 -- bigint
),
(
	'https://cf.shopee.vn/file/07575a89c65737b3af4ddcbd0919e842', -- varchar(255)
    42 -- bigint
),
(
	'https://cf.shopee.vn/file/ce7ccebafe55a58316af3b58e4a08d71', -- varchar(255)
    43 -- bigint
),
(
	'https://cf.shopee.vn/file/c06f81e5621bab5310a1115d1e1071ff', -- varchar(255)
    43 -- bigint
),
(
	'https://cf.shopee.vn/file/d5a9737140c65dcc32a2661362b39850', -- varchar(255)
    44 -- bigint
),
(
	'https://cf.shopee.vn/file/195ff679b06553a605f05a07cf20ce78', -- varchar(255)
    44 -- bigint
),
(
	'https://cf.shopee.vn/file/5b9659a4b1464d9a6754a2a8ff22aa69', -- varchar(255)
    45 -- bigint
),
(
	'https://cf.shopee.vn/file/833a94530528216f87d1ca10c8af50b9', -- varchar(255)
    45 -- bigint
),
(
	'https://cf.shopee.vn/file/9662d4e3f8badb33fff3626c71a11819', -- varchar(255)
    46 -- bigint
),
(
	'https://cf.shopee.vn/file/9662d4e3f8badb33fff3626c71a11819', -- varchar(255)
    46 -- bigint
),
(
	'https://cf.shopee.vn/file/d58e0d091c4cc9329778c74a8c2f7b0e', -- varchar(255)
    47 -- bigint
),
(
	'https://cf.shopee.vn/file/9e3ff92f92921b39978b7ab3e18c4245', -- varchar(255)
    47 -- bigint
),
(
	'https://cf.shopee.vn/file/76206711e50341b8b2dd8566ce50136b', -- varchar(255)
    48 -- bigint
),
(
	'https://cf.shopee.vn/file/76f370a7e9d299c02a5a5c2e4562b92a', -- varchar(255)
    48 -- bigint
),
(
	'https://cf.shopee.vn/file/3b915460c0637993c44c4398ac098872', -- varchar(255)
    49 -- bigint
),
(
	'https://cf.shopee.vn/file/cc37dc80a598ee34ad863b7757c733e4', -- varchar(255)
    49 -- bigint
),
(
	'https://cf.shopee.vn/file/0b589341ee2d5287b1c0f632ba93b67b', -- varchar(255)
    50 -- bigint
),
(
	'https://cf.shopee.vn/file/485769e2e0ca129758e800dbe7b48afe', -- varchar(255)
    50 -- bigint
)

;

