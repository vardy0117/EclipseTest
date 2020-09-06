use jspmodel2;

select * from ceo;
select* from review;
select* from store;
select* from menu;
select * from customer;

select * from orderList;
select * from orderMenu;
insert into orderMenu values (3, "무슨 메뉴야","25000","1","25000");
/************************************************************/
/*조인, 가게이름 받아오기 성공*/
select a.orderNo, a.customerNo, a.storeNo, b.name 'menu' , b.quantity'ea', b.price, c.name "storename"
from orderList a, orderMenu b, store c
where a.orderNo = b.orderNo and a.customerNo = 22 and c.storeNo =  (select storeNo from store where storeNo=a.storeNo);

select * from store where storeNo = 130;
/************************************************************/
select * from orderMenu where customer = 22;

select orderNo, customerNo 
from orderList;


/*조인, 가게이름 받아오기 성공 주문번호 받는거 가능하게 바꿈*/
select a.orderNo, a.customerNo, a.storeNo, b.name 'menu' , b.quantity'ea', b.price, c.name "storename"
from orderList a, orderMenu b, store c
where a.orderNo = b.orderNo and a.customerNo = 22 and c.storeNo =  (select storeNo from store where storeNo=a.storeNo) and a.orderNo = 6;


select a.orderNo, a.name 'menu', quantity'ea', price from orderMenu a;

select * from orderList;
select * from orderMenu;

select orderNo,sum(price) from orderMenu group by orderNo 
having orderNo = 3;


select sum(price)
from orderMenu where orderNo=3;

select orderNo from orderMenu group by orderNo
having orderNo = 1;

/*store c group by a.orderNo and a.customerNo and a.storeNo and b.name;*/
/*orderNo에 대한 주문 카운트*/
select orderNo,count(orderNo) from orderMenu group by orderNo; 

show processlist;

select * from orderList;
select * from orderMenu;
select * from store where StoreNo = 134;

select count(orderNo),name,price from orderMenu group by orderNo,name,price having orderNo = 1 and count(orderNo) <= 2;

/***********************************************************/
select distinct(a.orderNo) , b.customerNo
	from orderMenu a, orderList b
		where a.orderNo = 6 and b.customerNo = 22;
/*고객번호, 오더번호 맞으면 출력*/
/*일단 쓸 예정 */
/***********************************************************/
/***********************************************************/
select distinct(a.orderNo), b.customerNo, c.name "storeName", c.storeNo
	from orderMenu a, orderList b, store c
		where a.orderNo = 1 and b.customerNo = 22 and c.storeNo = (select storeNo from store where storeNo=b.storeNo);
/*고객번호, 오더번호 맞으면 출력*/
/***********************************************************/



/*13번 주문, 22번고객 주문이 일치하는지, 스토어 받은 번호가 어느 가게인지, 오더번호 중복 제거 */
select distinct(a.orderNo), a.customerNo, a.storeNo "store", b.name "storeName"
	from orderList a, store b
		where orderNo = 8 and customerNo = 22 and name = 
			(select name from store where storeNo = a.storeNo);
/*일단 쓸 예정 */



/*13번 주문, 22번고객 주문이 일치하는지, 스토어 받은 번호가 어느 가게인지, 오더번호 중복 제거 */
select distinct(a.orderNo), a.customerNo, a.storeNo "store", b.name "storeName"
	from orderList a, store b
		where orderNo = 8 and customerNo = 22 and name = 
			(select name from store where storeNo = a.storeNo);
/*일단 쓸 예정 */


/*13번 주문, 22번고객 주문이 일치하는지, 스토어 받은 번호가 어느 가게인지, 오더번호 중복 제거 */
select distinct(a.orderNo), a.customerNo, a.storeNo, b.name "storeName"
	from orderList a, store b
		where orderNo = 8 and customerNo = 22 and name = 
			(select name from store where storeNo = a.storeNo);
/*연습용 */


select orderNo from orderList where customerNo= 22;
select * from orderList;


select distinct(a.orderNo), a.customerNo, a.storeNo "store", b.name "storeName" from orderList a, store b where orderNo = ? and customerNo = ? and name =  (select name from store where storeNo = a.storeNo);



/************************************************************/
/*조인, 가게이름 받아오기 성공 테스트*/
select a.orderNo, a.customerNo, a.storeNo, b.name, b.price, c.name "storename"
from orderList a, orderMenu b, store c
where a.orderNo = b.orderNo and a.customerNo = 22 and c.storeNo =  (select storeNo from store where storeNo=a.storeNo) and a.orderNo =3;

select * from store where storeNo = 130;
/************************************************************/
select orderNo from orderList where customerNo= 22;




/***********************************************************************/
/*주문내역 가게, orderNo 한줄로 성공*/
select a.orderNo, a.customerNo, a.storeNo, b.name "storeName"
	from orderList a, store b 
		where b.name = (select name from store where storeNo = a.storeNo) and customerNo = 22 order by a.orderNo desc;
/***********************************************************************/
/*
순수하게 주문번호만 가지고 정안되면 쓸거 
select orderNo, customerNo, storeNo from orderList where customerNo = 22; 
*/


select a.orderNo, a.customerNo, a.storeNo, c.name "storename"
from orderList a, orderMenu b, store c
where a.customerNo = 22 and c.storeNo =  (select storeNo from store where storeNo= a.storeNo);

select * from orderList;
select * from orderMenu;

select cname, price from orderMenu where customerNo = 22;
select * from orderList;
/*orderNo, customerNo, storeNo */
-- select a.orderNo, a.customerNo, a.storeNo, b.name, b.price, c.name "storename"
--  from orderList a, orderMenu b, store c
-- where a.orderNo = b.orderNo and a.customerNo = 22 and c.storeNo =  (select storeNo from store where storeNo=a.storeNo) and a.orderNo =3;



select a.orderNo, a.customerNo, a.storeNo, b.name "storeName", a.deliveryCheck from orderList a, store b  where b.name = (select name from store where storeNo = a.storeNo) and customerNo = 22;

select * from orderList;
select * from orderMenu;



select * from customer;

select a.orderNo, a.customerNo, a.storeNo, 
b.name 'menu' , b.quantity 'ea', b.price, 
c.name 'storename', a.roadAddress, a.detailAddress, a.request, a.orderTime  from orderList a,
orderMenu b, store c where a.orderNo = 
b.orderNo and a.customerNo = ? and 
c.storeNo =  (select storeNo from store 
where storeNo=a.storeNo) and a.orderNo = ?;




select a.orderNo, a.customerNo, a.storeNo,
b.name 'menu' , b.quantity 'ea', b.price, 
c.name 'storename', a.roadAddress, a.detailAddress,  
a.request, a.orderTime, a.deliveryCheck, a.orderCheck from orderList a,
orderMenu b, store c where a.orderNo = 
b.orderNo and a.customerNo = 22 and 
c.storeNo =  (select storeNo from store
where storeNo=a.storeNo) and a.orderNo = 3;


select * from ceo;
select * from store;
select * from coupon;
select * from customer;
select * from orderList;
/* 주문삭제시 진행할거

- 고객번호 찾아서 쿠폰 되돌려 놓기 T값 -> F로
- */

select   b.orderNo, a.customerNo, a.couponNo, a.used
	from coupon a, orderList b
		where  b.orderNo = 11 and a.couponNo = b.couponNo; 

select storeNo from store where storeNo = 
(
select used from coupon
	where couponNo=11 and if(used='F', (select storeNo from store where storeNo =100 ) , 
    (select storeNo from store where storeNo = 200)) 
);

select a.used, b.storeNo from coupon a, store b
	where couponNo=11 and if(used='F', (select storeNo from store where storeNo =100 ) , 
    (select storeNo from store where storeNo = 200)) ;


show processlist;


create table test (
testprimary int (100),
teststring varchar(100),
testjointable int (10)
);

create table testjoin(
testprimary int (100),
anthoerdata varchar(100),
testjointable int (10)

);

create table testcoupon(
couponNo int(10),
customerNo int(10), 
username varchar(100), 
used varchar(2)
);

select * from testjoin;
select * from test;
select * from testcoupon;
select * from coupon;
select * from store;

select a.testprimary, b.testname, c.testcouponNo ;

select * from ceo where ceoNo = 100;


INSERT INTO `jspmodel2`.`testjoin` (`testprimary`, `anthoerdata`, `testjointable`) VALUES ('12', '12주문', '1');
INSERT INTO `jspmodel2`.`test` (`testprimary`, `testname`, `testjointable`) VALUES ('12', '1', '2');




select * from store;
select * from menu where storeNo = 130;
select * from store where ceoNo = 118;
select * from menu where storeNo = 153;
select * from menu where menuNo = 1;
select * from menu;

select * from orderList;
select * from orderMenu;
select * from customer;
select * from store;
select * from orderList;
select * from ceo where ceoNo = 115;
select * from ceo;
/*주문번호, 고객번호, ceo번호 맞나 확인하기*/

/*요청한 ceo번호 = 세션에 들어있는 ceo번호 맞는지 확인하는 유효성 자바에서 하기 */
-- delete orderList from orderList 
-- 	where orderNo=15;
--     
--     
select * from coupon;

/***********************/
/*쿠폰 update문*/
UPDATE coupon SET used = IF (used = 'T', 'F', '0') WHERE used = 'F';
/***********************/    
    /*****************************/
    /* 주문했을때 쿠폰을 어느가게에서 썼는지 확인 , 쿼리결과 나오면 해당 주문에 대한 쿠폰이 있는거임*/
select a.orderNo, a.storeNO, a.customerNo, b.couponNo, b.used from orderList a, coupon b 
where a.couponNo = b.couponNo and a.orderNo = 16;
/*주문번호에 해당하는 쿠폰 번호만 받아오기*/
select b.couponNo from orderList a, coupon b 
where a.couponNo = b.couponNo and a.orderNo = 16;

/****************************************************/
/*주문 취소시 쿠폰 원상복귀*/
UPDATE coupon b inner join orderList a
SET b.used = 'F'
WHERE a.couponNo = b.couponNo and a.orderNo = 16;
/****************************************************/

select * from coupon;
/*****************************/
select * from orderList;
select * from customer;
/*ceo랑 storeNo 랑 비교, 세션에서 넘어온store ceo를 인자로 넣기*/
/*주문번호 6번과 가게에 해당하는 ceo번호를 입력하면 6번에 대한 주문과 스토어 번호가 나와야 됨*/
select a.orderNo, a.storeNo, b.name
	from orderList a, store b 
		where a.storeNo = b.storeNo and b.ceoNo = 100 and a.orderNo = 14;
        
        


/************************************************************/

UPDATE coupon SET used = IF (used = 'T', 'F', '0') WHERE used = 'F';

/****************************************/
/*조건삭제 성공*/
delete a from orderList a, store b
	where a.storeNo = b.storeNo and 
    b.ceoNo = 118 and a.orderNo = 11;
/***************************************/
/*주문 취소시 쿠폰 원상복귀 + ceo항목 추가 완료*/
UPDATE coupon b, orderList a
SET b.used = 'F'
WHERE a.couponNo = b.couponNo and a.orderNo = 16
and a.storeNo = 
(select distinct(a.storeNo) from orderList a, store b where a.storeNo = b.storeNo and b.ceoNo = 115);

/*ceo번호로 스토어 값 찾기*/
select storeNo from store where ceoNo = 100;
select distinct(a.storeNo), b.ceoNo from orderList a, store b where a.storeNo = b.storeNo and b.ceoNo = 115;

select * from store where ceoNo = 100 ;
select * from store;
select * from orderList;
select * from store where storeNo = 119;
select * from orderList where orderNo = 5;
select * from ceo where ceoNo = 100;
select * from ceo;
select * from customer where email='m6ydz642@naver.com';
select * from customer where customerNo = 34;
select * from coupon;
select * from review;
select ceoNo from store where storeNo = 125;
-- select a.orderNo
-- 	from orderList a, store b 
-- 		where a.storeNo = b.storeNo and b.ceoNo = 115 and a.orderNo = 17;
 
 select orderNo, storeNo, orderCheck, deliveryCheck from orderList;
 
 select * from orderList;
  UPDATE orderList a, store b 
 SET a.orderCheck = 'F' ; /*전체다 바뀌는거임*/
 
update orderList set orderCheck = 'T' where orderNo = 19; /*주문번호 19번만 바꾸는 거임*/
/*************************************************************/
 /*주문번호, ceo번호 맞으면 주문체크 */
 UPDATE orderList
 SET orderCheck = 'T' 
 WHERE orderNo = 16
 and storeNo = 
(select distinct(a.storeNo) from orderList a, store b where a.storeNo = b.storeNo and b.ceoNo = 116);
----------------------------------------------------------------------------------- 
-- 보류
  UPDATE orderList a, store b 
 SET a.orderCheck = 'T' 
 WHERE a.storeNo = b.storeNo and a.orderNo = 16
 and a.storeNo = 
(select distinct(a.storeNo) from orderList a, store b where a.storeNo = b.storeNo and b.ceoNo = 116);

 select * from orderList;
/*************************************************************/
UPDATE coupon b, orderList a
SET b.used = 'F'
WHERE a.couponNo = b.couponNo and a.orderNo = 16
and a.storeNo = 
(select distinct(a.storeNo) from orderList a, store b where a.storeNo = b.storeNo and b.ceoNo = 115);
/*************************************************************/
/*ceo번호체크*/
select distinct(a.storeNo) from orderList a, store b where a.storeNo = b.storeNo and b.ceoNo = 115;

 
 
select * from store where storeNo = 1;
select * from ceo;
--     SET SQL_SAFE_UPDATES = 0;

show processlist;
select * from customer;

/*조건삭제 + 쿠폰원상복귀중*/
delete a from orderList a, store b
	where a.storeNo = b.storeNo and 
    b.ceoNo = 118 and a.orderNo = 1111;
    
    UPDATE coupon b, orderList a SET b.used = 'F' WHERE a.couponNo = b.couponNo and a.orderNo = 16 and a.storeNo = (select distinct(a.storeNo) from orderList a, store b where a.storeNo = b.storeNo and b.ceoNo = 115);

/*ceo번호체크*/
select distinct(a.storeNo) from orderList a, store b where a.storeNo = b.storeNo and b.ceoNo = 115;

select * from customer;


/****************************************************************************/
/*sql 인젝션*/
SELECT * FROM customer WHERE email='test@123' and password=' ' OR '1' = '1';
/****************************************************************************/