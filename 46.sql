create table users (
  username varchar(20) ,
  password varchar(20),
  first_name varchar(20),
  last_name varchar(20),
  email varchar(50),
  constraint pk_users primary key(username) 
);
create table User_mobile_numbers(
mobile_number char(20),
username varchar(20),
constraint pk_User_mobile_numbers primary key(mobile_number,username),
constraint fk_users FOREIGN KEY(username) references users 
)

create table User_Addresses(
address varchar(100), 	
username varchar(20),
constraint pk_User_Addresses primary key(address,username),
constraint fk_users_User_Addresses FOREIGN KEY(username) references users
)

create table Customer(
    username  varchar(20),
	points int ,
	constraint pk_Customer primary key(username),
	constraint fk_users_Customer FOREIGN KEY(username) references users	
	)

create table Admins(
username varchar(20),
constraint pk_Admins primary key(username),
constraint fk_users_Admins FOREIGN KEY(username) references users 
)


create table Vendor(
		username varchar(20)
		, activated BIT NOT NULL default 0
		, company_name  varchar(20)
		, bank_acc_no varchar(20)
		,admin_username  varchar(20)
		,constraint pk_Vendor primary key(username)
		,constraint fk_users_Vendor FOREIGN KEY(username) references users 
		,constraint fk_Admins_Vendor FOREIGN KEY(admin_username) references Admins 
	
		
		)

create table Delivery_Person(
		username varchar(20)
		,is_activated bit not null default 0
		,constraint pk_Delivery_Person primary key(username)
		,constraint fk_users_Delivery_Person FOREIGN KEY(username) references users
		)

create table Credit_Card(
		  number varchar(20) 
		, expiry_date date --??
		, cvv_code varchar(4) --??
		,constraint pk_Credit_Card primary key(number)
		)


create table Delivery(
		id int identity,
		type varchar(20),
		time_duration int ,
		fees decimal(5,3),
		 username varchar(20),
	  constraint pk_Delivery primary key(id),
		 constraint fk_Admins_Delivery	FOREIGN KEY(username) references admins 
		
)

create table Giftcard(
code varchar(10)
,expiry_date datetime
,amount int
,username  varchar(20)
,constraint pk_Giftcard primary key(code)
,constraint fk_Admins_Giftcard FOREIGN KEY(username) references admins 

)

create table Orders(
order_no int identity,
order_date datetime,
total_amount decimal(10,2),
cash_amount decimal(10,2),
credit_amount decimal(10,2),
payment_type varchar(20),
order_status varchar(20),
remaining_days int,
time_limit datetime,
Gift_Card_code_used varchar(10),
customer_name varchar(20),
delivery_id int , 
creditCard_number varchar(20),

constraint pk_Orders primary key(order_no),
constraint fk_Customer_Orders FOREIGN KEY(customer_name) references Customer ,
constraint fk_delivery_Orders FOREIGN KEY(delivery_id) references delivery ,
constraint fk_credit_card_Orders FOREIGN KEY(creditcard_number )references credit_card ,
constraint fk_Giftcard_Orders FOREIGN KEY(Gift_Card_code_used) references Giftcard 
)

create table Product(
serial_no int identity
,product_name  varchar(20)
,category varchar(20)
,product_description text
,price decimal(10,2)
,final_price decimal(10,2) 
,color varchar(20)
,available bit default 1
,rate real
,vendor_username varchar(20)
,customer_username varchar(20)
,customer_order_id int 
,constraint pk_Product primary key (serial_no) 
,constraint fk_Vendor_Product FOREIGN KEY(vendor_username) references vendor ,
constraint fk_Orders_Product FOREIGN KEY(customer_order_id) references orders,
constraint fk_Customer_Product FOREIGN KEY(customer_username) references customer ,
)



create table CustomerAddstoCartProduct(
serial_no int 
,customer_name varchar(20)
,constraint pk_CustomerAddstoCartProduct primary key(serial_no,customer_name)
,constraint fk_Product_CustomerAddstoCartProduct FOREIGN KEY(serial_no) references product ,
constraint fk_Customer_CustomerAddstoCartProduct FOREIGN KEY(customer_name) references Customer 
)

create table Todays_Deals(
deal_id  int identity
,deal_amount  int 
,expiry_date datetime
,admin_username varchar(20)
,constraint pk_Todays_Deals primary key(deal_id)
,constraint fk_admins_Todays_Deals FOREIGN KEY(admin_username) references admins 

)

create table Todays_Deals_Product(
deal_id  int 
,serial_no int 
,issue_date  datetime,
constraint pk_Todays_Deals_Product primary key(deal_id, serial_no)
,constraint fk_TodaysDeals_Todays_Deals_Product FOREIGN KEY(deal_id) references todays_deals on delete cascade on update cascade
,constraint fk_Product_Todays_Deals_Product FOREIGN KEY(serial_no) references product on delete cascade on update cascade
)

create table offer(
offer_id int identity
,offer_amount int
,expiry_date datetime check(expiry_date > CURRENT_TIMESTAMP)
,constraint pk_offer primary key(offer_id)
)

--alter table offer drop constraint CK__offer__expiry_da__57DD0BE4 

create table offersOnProduct(offer_id  int,serial_no int ,constraint pk_offersOnProduct primary key(offer_id,serial_no),constraint fk_Product_offersOnProduct FOREIGN KEY(serial_no) references product ,constraint fk_offer_offersOnProduct FOREIGN KEY(offer_id) references offer on update cascade on delete cascade)create table Customer_Question_Product(serial_no int ,customer_name varchar(20),question varchar(50),answer text,constraint pk_Customer_Question_Product primary key(serial_no, customer_name),constraint fk_Product_Customer_Question_Product FOREIGN KEY(serial_no) references product ,constraint fk_Customer_Customer_Question_Product FOREIGN KEY(customer_name) references customer )
create table Wishlist(
username varchar(20)
,name varchar(20)
,constraint pk_Wishlist primary key(name, username)
,constraint fk_Customer_Wishlist FOREIGN KEY(username) references customer 

)

create table Wishlist_Product(
username varchar(20)
,wish_name varchar(20)
,serial_no int
,constraint pk_Wishlist_Product primary key (wish_name,username,serial_no)
,constraint fk_Wishlist_Wishlist_Product FOREIGN KEY(wish_name,username) references wishlist 
,constraint fk_Product_Wishlist_Product FOREIGN KEY(serial_no) references product 
);

create table Admin_Customer_Giftcard(code varchar(10),customer_name varchar(20),admin_username varchar(20),remaining_points int ,constraint pk_Admin_Customer_Giftcard primary key(code,customer_name,admin_username),constraint fk_GiftCard_Admin_Customer_Giftcard FOREIGN KEY(code) references giftcard on delete cascade on update cascade
,constraint fk_Customer_Admin_Customer_Giftcard FOREIGN KEY(customer_name) references customer 
,constraint fk_Admins_Admin_Customer_Giftcard FOREIGN KEY(admin_username) references admins 
)create table Admin_Delivery_Order(delivery_username varchar(20),order_no int,admin_username varchar(20),delivery_window varchar(50),constraint pk_Admin_Delivery_Order primary key (delivery_username,order_no),constraint fk_DeliveryPerson_Admin_Delivery_Order FOREIGN KEY(delivery_username) references delivery_person 
,constraint fk_Oders_Admin_Delivery_Order FOREIGN KEY(order_no) references orders
,constraint fk_Admins_Admin_Delivery_Order FOREIGN KEY(admin_username) references admins 
)create table Customer_CreditCard(customer_name varchar(20),cc_number varchar(20),constraint pk_Customer_CreditCard primary key (customer_name,cc_number),constraint fk_Customer_Customer_CreditCard FOREIGN KEY(customer_name) references customer 
,constraint fk_CreditCard_Customer_CreditCard FOREIGN KEY(cc_number) references credit_card )
 go
 create proc customerRegister 
 @username varchar(20),
 @first_name varchar(20),
 @last_name varchar(20),
 @password varchar(20),
 @email varchar(50)
AS
begin
insert into users(username,password,first_name,last_name,email)
values(@username,@password,@first_name,@last_name,@email)
insert into customer values (@username,0)
end

--exec customerRegister 'ahmed.ashraf' , 'ahmed' , 'ashraf' , 'pass123' , 'ahmed@yahoo.com'



go
create proc vendorRegister
 @username varchar(20),
 @first_name varchar(20),
 @last_name varchar(20),
 @password varchar(20),
 @email varchar(50),
@company_name varchar(20),
@bank_acc_no varchar(20)
As
begin 
insert into users values(@username,@password,@first_name,@last_name,@email)
insert into Vendor (username,company_name,bank_acc_no) 
values (@username,@company_name,@bank_acc_no)
end


--exec vendorRegister 'eslam.mahmod' , 'eslam' ,'mahmod','pass1234', 'hopa@gmail.com' , 'Market','132132513'
--review
go
create proc userLogin
@username varchar(20)
,@password varchar(20)
,@success bit output 
,@type int output
as
begin
select @success=0
select @success = 1 
 where EXISTS(select username,password from users where username=@username AND password=@password)
if @success=1
begin
if EXISTS(select username from Customer where username=@username)
begin
set @type = 0 
end
if EXISTS(select username from Vendor where username=@username)
begin 
set @type = 1 
end
if EXISTS(select username from Admins where username=@username)
begin
set @type = 2 
end
if EXISTS(select username from Delivery where username=@username)
begin
set @type = 3 
end
end
end

/*declare @result1 bit , @result2 int 
exec userLogin 'ahmed.ashraf','pass', @result1 output ,@result2 output
print @result1 
print @result2*/
-------------------------
go
create proc addMobile 
@username varchar(20), 
@mobile_number varchar(20)
as
begin
insert into User_mobile_numbers values (@mobile_number,@username)	
end

--exec addMobile 'ahmed.ashraf' , '0124262652'



go
create proc addAddress
@username varchar(20), 
@address varchar(100)
as
begin
insert into User_Addresses values (@address,@username)
end

--exec addAddress 'ahmed.ashraf' , 'nasr city'

go
create proc showProducts
as
begin
select * from Product where customer_username is null
end

--exec showProducts

go 
alter proc ShowProductsbyPrice
as
begin 
select serial_no , product_name , category ,product_description , color, rate ,price , final_price
from Product where customer_username is null order by price asc
end

--exec ShowProductsbyPrice

go
create proc searchbyname
@text varchar(20)
as
begin
select * from Product  where product_name like '%'+@text+'%'
end


--exec searchbyname 'blue'




go 
create proc AddQuestion
@serial int
,@customer varchar(20)
,@Question varchar(50)
as 
begin
insert into Customer_Question_Product (serial_no,customer_name,question)
values (@serial,@customer,@Question)
end

--exec AddQuestion 1 ,'ahmed.ashraf' , 'size?'

go 
create proc addToCart
@customername varchar(20)
,@serial int
as 
begin
insert into CustomerAddstoCartProduct values (@serial,@customername)
end

--exec addToCart 'ahmed.ashraf' , 3


go
create proc removefromCart
@customername varchar(20)
,@serial int
as 
begin
delete  from CustomerAddstoCartProduct
where @customername = customer_name AND @serial=serial_no
end

--exec removefromCart 'ahmed.ashraf' , 3



go
create proc createWishlist
@customername varchar(20)
,@name varchar(20)
as 
begin
insert into Wishlist values (@customername,@name)
end

--exec createWishlist 'ahmed.ashraf' , 'fashion'

go
create proc AddtoWishlist
@customername varchar(20)
,@wishlistname varchar(20)
,@serial int
as 
begin
insert into Wishlist_Product values (@customername,@wishlistname,@serial)
end

--exec AddtoWishlist 'ahmed.ashraf' , 'fashion' , 1
--exec AddtoWishlist 'ahmed.ashraf' , 'fashion' , 3



go 
create proc removefromWishlist
@customername varchar(20)
,@wishlistname varchar(20)
,@serial int
as 
begin
delete from Wishlist_Product where 
@customername = username AND @wishlistname =wish_name AND @serial=serial_no
end

--exec removefromWishlist 'ahmed.ashraf' , 'fashion' , 3

go 
create proc showWishlistProduct
@customername varchar(20)
,@name varchar(20)
as
begin
select p.*
from Wishlist_Product w inner join product p
on w.serial_no = p.serial_no
end

--exec showWishlistProduct 'ahmed.ashraf' , 'fashion'

go
create proc viewMyCart
@customer varchar(20)
as
begin
select p.* from CustomerAddstoCartProduct c inner join Product p
on p.serial_no=c.serial_no 
where c.customer_name = @customer
end

--exec viewMyCart 'ahmed.ashraf' 

go 
create proc calculatepriceOrder
@customername varchar(20),
@sum decimal(10,2) output
as 
begin
select @sum = sum(p.final_price) from 
CustomerAddstoCartProduct c inner join Product p
on c.serial_no = p.serial_no 
where c.customer_name = @customername
end

/*declare @result decimal(10,2)
exec calculatepriceOrder 'ahmed.ashraf' , @result out
print @result*/


go 
create proc productsinorder 
@customername varchar(20)
,@orderID int
as 
begin 
update Product set customer_username = @customername,  available = 0 ,
									customer_order_id = @orderID
from Product p inner join CustomerAddstoCartProduct c
on p.serial_no = c.serial_no
where c.customer_name = @customername

/*update Product set customer_order_id = @orderID
where customer_username = @customername */

--wtf nour
/*delete from  CustomerAddstoCartProduct
from Product p inner join CustomerAddstoCartProduct c
on  p.serial_no = c.serial_no 
where c.customer_name iS not null*/

delete from CustomerAddstoCartProduct 
where customer_name <> @customername and
serial_no in (select serial_no from CustomerAddstoCartProduct 
							where customer_name = @customername )


select * from Product 
where Product.customer_username = @customername AND @orderID = Product.customer_order_id
end

exec productsinorder 'ahmed.ashraf' , 1

go
create proc emptyCart
@customername varchar(20)
as 
begin 
delete  from CustomerAddstoCartProduct 
where @customername = CustomerAddstoCartProduct.customer_name
end

--exec emptyCart 'ahmed.ashraf'
 
go 
create proc makeOrder 
@customername varchar(20)
as 
begin 
declare @sum decimal(10,2)
exec calculatepriceOrder @customername , @sum output
insert into Orders(customer_name,total_amount,order_date)
values (@customername,@sum,CURRENT_TIMESTAMP)
declare @ID int
select @ID = MAX(order_no) from Orders
exec productsinorder @customername , @ID
exec  emptyCart @customername 
end

exec makeOrder 'ahmed.ashraf'
-----------------------------------------------------------
/*declare @ID int
select @ID = count(*) from Orders
print @ID*/
--DBCC CHECKIDENT ('orders' , RESEED, 2);


go
create proc cancelOrder
@orderid int
as
begin
if exists (select * from Orders where  order_no = @orderid  and	order_status in ('not processed' , 'in process') ) 
begin

if Exists(select * from Orders where 
 (total_amount = credit_amount or total_amount = cash_amount) and order_no=@orderid
 )
 begin 
 update Orders set total_amount = 0 where order_no = @orderid
 end
 else 
 begin
if Exists(select * from Orders o inner join Giftcard g 
on o.Gift_Card_code_used = g.code 
where (o.total_amount>o.cash_amount or o.credit_amount<o.total_amount ) and g.expiry_date < CURRENT_TIMESTAMP
)
begin
update Orders set total_amount = 0 where order_no = @orderid
end
else
begin

declare @tam int
declare @cash int
declare @credit int
select @tam = total_amount from Orders  where order_no = @orderid
select @cash = cash_amount from Orders where order_no=@orderid
select @credit = credit_amount from Orders where order_no=@orderid
update Admin_Customer_Giftcard set remaining_points =@tam -(@cash+@credit)
where exists (select * from Admin_Customer_Giftcard a inner join Orders o
on a.customer_name = o.customer_name where o.order_no = @orderid
) 
update Customer set points = @tam -(@cash+@credit)
where exists (select * from Admin_Customer_Giftcard a inner join Orders o
on a.customer_name = o.customer_name where o.order_no = @orderid
) 
end
end

end
update Product set customer_username=null , customer_order_id=null ,available=1
where customer_order_id= @orderid
delete from Orders where order_no = @orderid 
end


/*delete from Orders
where Orders.order_no = (select o.order_no
from Orders o 
where o.order_no =@orderid and o.order_status in ('not processed' , 'in process') 
)*/

go
create proc vieworder
@customer varchar(20)
as
select * from Orders where customer_name= @customer



go
create proc returnProduct
@serialno int, 
@orderid int
as 
begin
 if Exists(select * from Orders where 
 total_amount = credit_amount or total_amount = cash_amount
 )
 begin 
 update Orders set total_amount = 0 where order_no = @orderid
 end
 else 
 begin
if Exists(select * from Orders o inner join Giftcard g 
on o.Gift_Card_code_used = g.code 
where (o.total_amount>o.cash_amount or o.credit_amount<o.total_amount ) and g.expiry_date < CURRENT_TIMESTAMP
)
begin
update Orders set total_amount = 0 where order_no = @orderid
end
else
begin
if exists ( select * from Orders o inner join Product p on p.customer_order_id = o.order_no
where (o.total_amount - o.cash_amount > p.final_price ) and (( o.total_amount - o.credit_amount) > p.final_price  ) )  
begin
declare @rp int
select @rp = final_price from Product  where serial_no = @serialno
update Admin_Customer_Giftcard set remaining_points =@rp
where exists (select * from Admin_Customer_Giftcard a inner join Orders o
on a.customer_name = o.customer_name where o.order_no = @orderid
) 
update Customer set points =@rp
where exists (select * from Admin_Customer_Giftcard a inner join Orders o
on a.customer_name = o.customer_name where o.order_no = @orderid)
end 
else
begin
declare @tam int
declare @cash int
declare @credit int
select @tam = total_amount from Orders  where order_no = @orderid
select @cash = cash_amount from Orders where order_no=@orderid
select @credit = credit_amount from Orders where order_no=@orderid
update Admin_Customer_Giftcard set remaining_points =@tam -(@cash+@credit)
where exists (select * from Admin_Customer_Giftcard a inner join Orders o
on a.customer_name = o.customer_name where o.order_no = @orderid
) 
update Customer set points = @tam -(@cash+@credit)
where exists (select * from Admin_Customer_Giftcard a inner join Orders o
on a.customer_name = o.customer_name where o.order_no = @orderid
) 
end
end
update Product set customer_username = null , customer_order_id = null where serial_no = @serialno
end
end


--exec ShowproductsIbought 'ahmed.ashraf'

go
create proc rate 
@serialno int,
@rate int ,
@customername varchar(20)
as 
begin
update Product set rate = @rate			
	where serial_no=@serialno and @customername=customer_username
end

exec rate 1 , 2.5 , 'ahmed.ashraf'




go --how
create proc SpecifyAmount 
@customername varchar(20),
@orderID int,
@cash decimal(10,2),
@credit decimal(10,2)
as
declare @points int

if @cash is null 
begin  
update Orders  set Orders.payment_type = 'Credit',cash_amount=@cash,credit_amount=@credit 
where Orders.order_no=@orderID		
select @points = (total_amount-credit_amount) from Orders 
where order_no=@orderID

end
else 

begin 

update Orders  set Orders.payment_type = 'Cash' ,cash_amount=@cash,credit_amount=@credit
where Orders.order_no=@orderID		
select @points = (total_amount-cash_amount) from Orders 
where order_no=@orderID
end
update Customer set points=(points-@points) where username=@customername
update Admin_Customer_Giftcard set remaining_points = (remaining_points-@points)
where customer_name=@customername

exec SpecifyAmount 'ammar.yasser' , 5 ,  null , 40

go
create proc AddCreditCard
@creditcardnumber varchar(20),
@expirydate date ,
@cvv varchar(4),
@customername varchar(20)
as
insert into Credit_Card (cvv_code,expiry_date,number) 
values (@cvv,@expirydate,@creditcardnumber)

insert into Customer_CreditCard (customer_name,cc_number)
values (@customername,@creditcardnumber)

exec AddCreditCard '4444-5555-6666' , '10/19/2028' , '2222' , 'ahmed.ashraf'

go
create proc ChooseCreditCard
@creditcard varchar(20),
@orderid int
as
begin 
--insert into Credit_Card (number) values (@creditcard)
update Orders set creditCard_number = @creditcard where order_no = @orderid
end

exec ChooseCreditCard '4444-5555-6666' ,3

go
create proc vewDeliveryTypesas begin select * from Delivery end



gocreate proc specifydeliverytype@orderID int, @deliveryID intasbegin update Orders set delivery_id = @deliveryID where order_no=@orderIDupdate Orders set remaining_days = d.time_durationfrom Orders o inner join Delivery d on o.delivery_id=d.id end--exec specifydeliverytype 1 , 1gocreate proc trackRemainingDays@orderid int,@customername varchar(20),@days int outputasbegindeclare @timeDuration int , @orderDate datetimeselect  @orderDate = o.order_date , @timeDuration= d.time_duration from Orders o inner join Delivery d on o.delivery_id=d.idwhere o.order_no =  @orderidset @days = CONVERT(int ,( @timeDuration +  @orderDate - CURRENT_TIMESTAMP))update Orders set remaining_days = @days where Orders.order_no = @orderid and Orders.customer_name=@customernameend/*declare @da int exec trackRemainingDays 3 , 'ahmed.ashraf' ,@da outprint @da*/go create proc recommmend @customername varchar(20)asbeginwith temp as(select top 3 category as category, count(*) as frequency  from Product p inner join CustomerAddstoCartProduct c on p.serial_no = c.serial_nowhere c.customer_name = @customername group by category order by count(*) desc)select top 3 p.serial_no , count(*) as frequencyfrom Wishlist_Product w inner join Product pon w.serial_no = p.serial_noinner join temp on p.category = temp.categorygroup by p.serial_no order by count (*) desc ;with temp2 as(select top 3  c2.customer_name as customer_name , count(*) as frequency from CustomerAddstoCartProduct c1 inner join  CustomerAddstoCartProduct c2 on c1.serial_no = c2.serial_nowhere c1.customer_name <> c2.customer_name and c1.customer_name = @customernamegroup by c2.customer_name order by count(*) desc)select top 3 w.serial_no ,count(*) frequencyfrom Wishlist_Product w  inner join Product pon p.serial_no= w.serial_noinner join temp2on w.username = temp2.customer_namegroup by w.serial_no order by count(*)endgo create proc postProduct@vendorUsername varchar(20), 
@product_name varchar(20) ,@category varchar(20), @product_description text ,@price decimal(10,2), @color varchar(20)as begininsert into product (vendor_username,product_name,product_description,category,price,final_price,color)values(@vendorUsername,@product_name,@category,@product_description,@price,@price,@color)end

--exec postProduct 'eslam.mahmod' , 'pencil' , 'stationary' , 'HB0.7' , 10 , 'red'

go create proc vendorviewProducts@vendorname varchar(20)as beginselect * from Product where vendor_username=@vendornameend--exec vendorviewProducts 'eslam.mahmod'go create proc EditProduct@vendorname varchar(20), 
@serialnumber int, 
@product_name varchar(20) ,
@category varchar(20),
@product_description text ,@price decimal(10,2),@color varchar(20)asbeginupdate Product set vendor_username =@vendorname ,product_name =@product_name,category=@category,product_description=@product_description,final_price =@price,color =@colorwhere serial_no=@serialnumberendgo create proc deleteProduct@vendorname varchar(20), @serialnumber intasbegindelete from Product where vendor_username=@vendorname and serial_no=@serialnumberend--exec deleteProduct 'eslam.mahmod' , 7go create proc viewQuestions@vendorname varchar(20)asbeginselect p.serial_no,q.customer_name,q.question,q.answerfrom Product p inner join Customer_Question_Product qon p.serial_no = q.serial_nowhere p.vendor_username = @vendornameend--exec viewQuestions 'hadeel.adel'go create proc answerQuestions@vendorname varchar(20), @serialno int, @customername varchar(20),@answer textasbeginif exists ( select * from Product where vendor_username = @vendorname and serial_no = @serialno )update Customer_Question_Product set answer = @answer where customer_name =@customername and @serialno =serial_noend--exec answerQuestions 'hadeel.adel',1,'ahmed.ashraf','40'go -----------------------------------------------------------?????create proc addOffer@offeramount int, @expiry_date datetimeas begininsert into offer (offer_amount,expiry_date)values(@offeramount,@expiry_date)endexec addOffer 50,'2019/11/25'go create proc checkOfferonProduct@serial int,@activeoffer bit outputas begin if exists (select * from offersOnProduct where serial_no = @serial)set @activeoffer = 1else set @activeoffer=0end /*declare @re bitexec checkOfferonProduct  1, @re outputprint @re*/go
create proc viewDeals
as
begin
select * from Todays_Deals
endgo 
create proc viewOffers
as
begin
select *
from offer
endgocreate proc checkandremoveExpiredoffer@offerid intasbeginupdate Product set final_price = price where serial_no in (select serial_no from offersOnProduct where offer_id = @offerid)delete  from offerwhere offer_id=  @offerid and expiry_date < CURRENT_TIMESTAMPendexec checkandremoveExpiredoffer 9gocreate proc applyOffer @vendorname varchar(20), @offerid int, @serial intas beginif not exists(select * from offersOnProduct where  serial_no = @serial)begininsert into offersOnProduct (offer_id, serial_no) values(@offerid,@serial)declare @amount int , @ex datetime ,@ve varchar(20)select @amount = offer_amount , @ex=expiry_date from offer where offer_id = @offeridselect @ve=vendor_username from Product where serial_no = @serialupdate Product set final_price = price - @amount where @ex > CURRENT_TIMESTAMP and @vendorname = @ve and serial_no = @serialendelseprint ('The product has an active offer')exec checkandremoveExpiredoffer @offeridend

exec applyOffer 'hadeel.adel' , 9 ,12

gocreate proc activateVendors@admin_username varchar(20),@vendor_username varchar(20)asupdate Vendor set activated = 1 , admin_username =@admin_usernamewhere username =@vendor_username exec activateVendors 'hana.aly' , 'eslam.mahmod'gocreate proc inviteDeliveryPerson@delivery_username varchar(20),@delivery_email varchar(50)asinsert into users (username,email) values (@delivery_username,@delivery_email)insert into Delivery_Person (username) values (@delivery_username)--exec inviteDeliveryPerson 'mohamed.tamertt' , 'moha@gmail.com'gocreate proc reviewOrdersasselect * from Orders gocreate proc updateOrderStatusInProcess@order_no int asupdate Orders set order_status = 'In process' where order_no = @order_no--exec updateOrderStatusInProcess 2gocreate proc addDelivery@delivery_type varchar(20),@time_duration int,@fees decimal(5,3),@admin_username varchar(20)asinsert into Delivery (type,time_duration,fees,username) values (@delivery_type,@time_duration,@fees,@admin_username)--exec  addDelivery 'fast',2,15,'hana.aly'gocreate proc assignOrdertoDelivery@delivery_username varchar(20),@order_no int,@admin_username varchar(20)asinsert into Admin_Delivery_Order (delivery_username,order_no,admin_username)values (@delivery_username,@order_no,@admin_username)--exec assignOrdertoDelivery 'mohamed.tamer' , 2 , 'hana.aly'gocreate proc createTodaysDeal@deal_amount int,@admin_username varchar(20),@expiry_date datetimeasbegininsert into Todays_Deals (deal_amount,admin_username,expiry_date)values (@deal_amount,@admin_username,@expiry_date)end exec createTodaysDeal 25 , 'hana.aly' , '2019/11/1'gocreate proc checkTodaysDealOnProduct@serial_no int ,@activeDeal bit outputas beginif exists (select * from Todays_Deals_Product Twhere T.serial_no =@serial_no)beginset @activeDeal ='1'end else set @activeDeal ='0'enddeclare @re bit exec checkTodaysDealOnProduct 4, @re outprint @regocreate proc addTodaysDealOnProduct@deal_id int,@serial_no intasbegindeclare @var bitexec checkTodaysDealOnProduct @serial_no , @var outputif(@var ='0')begininsert into Todays_Deals_Product  (deal_id, serial_no)values(@deal_id, @serial_no)declare @deal int select @deal = deal_amount from Todays_Deals where deal_id = @deal_idupdate Product set final_price = price - @deal where serial_no = @serial_noend--else print('The Product has A Deal Today')end--exec addTodaysDealOnProduct 2,1gocreate proc removeExpiredDeal@deal_id intasupdate Product set final_price = price  where serial_no in (select serial_no from Todays_Deals_Product where deal_id=@deal_id)delete from Todays_Deals where deal_id =@deal_id and expiry_date < CURRENT_TIMESTAMP--exec removeExpiredDeal 2gocreate proc createGiftCard @code varchar(10), @expiry_date datetime, @amount int, @admin_username varchar(20)as insert into Giftcard (code,expiry_date,amount,username)values(@code,@expiry_date,@amount,@admin_username)--exec createGiftCard 'ff' , '2019/11/1' , 20 , 'hana.aly'gocreate proc removeExpiredGiftCard@code varchar(10)asbegindeclare @gift int select @gift = Giftcard.amount from Giftcard where Giftcard.code = @codeupdate Customer set points = points - @giftdelete from Giftcard where code=@code and expiry_date< CURRENT_TIMESTAMPend--exec removeExpiredGiftCard 'f16'go create proc checkGiftCardOnCustomer@code varchar(10),@activeGiftCard BIT outputas if exists (select * from Admin_Customer_Giftcard where code =@code)beginset @activeGiftCard ='1'end else set @activeGiftCard ='0'/*declare @re bit exec checkGiftCardOnCustomer 'f16', @re outprint @re*/gocreate proc giveGiftCardtoCustomer@code varchar(10),@customer_name varchar(20),@admin_username varchar(20)asbeginif not exists (select * from Admin_Customer_Giftcard where customer_name = @customer_name)begininsert into Admin_Customer_Giftcard (code,customer_name,admin_username)values(@code,@customer_name,@admin_username)end

declare @gift int select @gift = Giftcard.amount from Giftcard where Giftcard.code = @codeupdate Customer set points = points + @gift

end
--exec giveGiftCardtoCustomer 'f16' , 'ahmed.ashraf' , 'hana.aly'


gocreate proc acceptAdminInvitation@delivery_username varchar(20)asupdate Delivery_Person set is_activated = 1 where username	=@delivery_usernamegocreate proc deliveryPersonUpdateInfo@username varchar(20),
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50)asupdate users set first_name =@first_name , last_name =@last_name , password =@password , email=@emailwhere users.username = @usernamegocreate proc viewmyorders@deliveryperson varchar(20)asselect o.* from Orders o inner join Admin_Delivery_Order a on o.order_no = a.order_nowhere a.delivery_username = @deliverypersongocreate proc specifyDeliveryWindow@delivery_username varchar(20),@order_no int,@delivery_window varchar(50)asupdate Admin_Delivery_Order set delivery_window =@delivery_windowwhere order_no = @order_no and delivery_username = @delivery_usernamegocreate proc updateOrderStatusOutforDelivery@order_no int asupdate Orders set order_status = 'out for delivery' where order_no = @order_nogocreate proc updateOrderStatusDelivered@order_no int asupdate Orders set order_status = 'delivered' where order_no = @order_no-- USERS INSERTION
INSERT INTO Users(username,first_name,last_name,password,email)
VALUES('hana.aly' ,'hana' ,'aly' ,'pass1' ,'hana.aly@guc.edu.eg')

INSERT INTO Users(username,first_name,last_name,password,email)
VALUES('ammar.yasser' ,'ammar' ,'yasser' ,'pass4' ,'ammar.yasser@guc.edu.eg')

INSERT INTO Users(username,first_name,last_name,password,email)
VALUES('nada.sharaf' ,'nada' ,'sharaf' ,'pass7' ,'nada.sharaf@guc.edu.eg')

INSERT INTO Users(username,first_name,last_name,password,email)
VALUES('hadeel.adel' ,'hadeel' ,'adel' ,'pass13' ,'hadeel.adel@guc.edu.eg')

INSERT INTO Users(username,first_name,last_name,password,email)
VALUES('mohamed.tamer' ,'mohamed' ,'tamer' ,'pass16' ,'mohamed.tamer@guc.edu.eg')

-- ADMINS INSERTIONS
INSERT INTO Admins
VALUES('hana.aly')

INSERT INTO Admins
VALUES('nada.sharaf')

-- CUSTOMERS INSERTION
INSERT INTO Customer(username, points)
VALUES('ammar.yasser',15)


-- customeraddstocartproduct insertion
INSERT INTO customeraddstocartproduct(serial_no,customer_name)
VALUES(1, 'ammar.yasser')

-- VENDOR INSERTION
INSERT INTO Vendor(username,activated,company_name,bank_acc_no,admin_username)
VALUES('hadeel.adel' , 1, 'Dello' , '47449349234' , 'hana.aly')

-- DELIVERY PERSONS
INSERT INTO Delivery_Person(username,is_activated)
VALUES('mohamed.tamer' , 1)

-- USER ADDRESSES INSERTION
INSERT INTO User_Addresses(address,username)
VALUES('New Cairo' , 'hana.aly')

INSERT INTO User_Addresses(address,username)
VALUES('Heliopolis' , 'hana.aly')

-- USER MOBILE INSERTION
INSERT INTO User_mobile_numbers(mobile_number,username)
VALUES('01111111111','hana.aly')

INSERT INTO User_mobile_numbers(mobile_number,username)
VALUES('1211555411','hana.aly')

-- CREDIT CARD INSERTION
INSERT INTO Credit_Card(number,expiry_date,cvv_code)
VALUES('4444-5555-6666-8888' , '2028-10-19' , '232')

-- DELIVERY INAERTION
INSERT INTO Delivery(type , time_duration , fees)
VALUES('pick-up' , 7 ,10 )

INSERT INTO Delivery(type , time_duration , fees)
VALUES('regular' ,14 ,30)

INSERT INTO Delivery(type , time_duration , fees)
VALUES('speedy' ,1 , 50)

-- PRODUCT INSERTION
SET IDENTITY_INSERT Product ON;

INSERT INTO Product(serial_no , product_name , category , product_description , price , final_price , color , available , rate , vendor_username)
VALUES(9,'Bag' ,'Fashion' ,'backbag' , 100 , 100 , 'yellow' , 1,0 , 'hadeel.adel')

INSERT INTO Product(serial_no , product_name , category , product_description , price , final_price , color , available , rate , vendor_username)
VALUES(10,'Blue pen' ,'stationary' ,'useful pen' , 10 , 10 , 'Blue' , 1,0 , 'hadeel.adel')

INSERT INTO Product(serial_no , product_name , category , product_description , price , final_price , color , available , rate , vendor_username)
VALUES(11,'Blue pen' ,'stationary' ,'useful pen' , 10 , 10 , 'Blue' , 0,0 , 'hadeel.adel')
SET IDENTITY_INSERT Product off;

-- DEALS INSERTION
SET IDENTITY_INSERT Todays_Deals ON;

INSERT INTO Todays_Deals (deal_id , deal_amount , expiry_date , admin_username)
VALUES(1, 30 , '2019-11-30' , 'hana.aly')

INSERT INTO Todays_Deals (deal_id , deal_amount , expiry_date , admin_username)
VALUES(2, 40 , '2019-11-18' , 'hana.aly')

INSERT INTO Todays_Deals (deal_id , deal_amount , expiry_date , admin_username)
VALUES(3, 50 , '2019-12-12' , 'hana.aly')

INSERT INTO Todays_Deals (deal_id , deal_amount , expiry_date , admin_username)
VALUES(4, 10 ,'2019-11-12', 'hana.aly')

SET IDENTITY_INSERT Todays_Deals OFF;

-- OFFERS INSERTION
--SET IDENTITY_INSERT offer ON;
INSERT INTO offer (offer_id , offer_amount , expiry_date)
VALUES(1 , 50 ,'2019-11-30')
--SET IDENTITY_INSERT offer OFF;


-- WISHLIST INSERTION
INSERT INTO Wishlist(username , name)
VALUES('ammar.yasser' , 'fashion')


-- WHISHLIST PRODUCT
-- there is a problem : no serial_no in column product with value 2 
INSERT INTO Wishlist_Product(username,wish_name,serial_no)
VALUES('ammar.yasser' , 'fashion' , 2)

-- WILL BE INSERTED AFTER EXEC THE PROCEDURE ADD TO WISHLIST IN THE TEST CASES
--INSERT INTO Wishlist_Product(username,wish_name,serial_no)
--VALUES('ammar.yasser' , 'fashion' , 2)


-- GIFT CARD INSERTION
INSERT INTO Giftcard(code , expiry_date , amount)
VALUES('G101' ,'2019-11-18', 100)

INSERT INTO Customer_CreditCard(customer_name,cc_number)
VALUES('ammar.yasser' , '4444-5555-6666-8888')


