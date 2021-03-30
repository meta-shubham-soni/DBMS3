select users.userID , users.name , count(users.userID) from 
    (select * from user where admin = 0) users 
    inner join 
    (select * from orders where orderDate >= NOW() - Interval 30 day) ord 
    on users.userID = ord.userID group by users.userID;
    

select users.userID , users.name , sum(ord.orderTotal) from 
    (select * from user where admin = 0) users 
    inner join 
    (select * from orders where orderDate >= NOW() - Interval 30 day) ord 
    on users.userID = ord.userID group by users.userID 
    order by sum(ord.orderTotal) DESC Limit 10 ;
    
select o.productID , count(o.productID) from 
    orders ord right join orderdetails o 
    on ord.orderID = o.orderID
    where ord.orderDate >= NOW() - INTERVAL 60 day 
    group by o.productID
    limit 20;
    
SELECT MONTH(ord.orderDate) as Month ,SUM(orderTotal) FROM 
    orders ord right join orderdetails o 
    on ord.orderID = o.orderID 
    WHERE MONTH(CURDATE())-MONTH(ord.orderDate)<=6 GROUP BY MONTH(ord.orderDate);
    
SET SQL_SAFE_UPDATES=0;    
    
UPDATE products p set p.status=false WHERE p.status=true AND p.productID NOT IN 
    (SELECT o.productID FROM 
    orders ord right join orderdetails o 
    on ord.orderID = o.orderID 
    WHERE DATEDIFF(CURDATE(),ord.orderDate)<=90);
    
SET SQL_SAFE_UPDATES=1;

Select p.name,p.price,p.description from products p where p.productID in
    (Select productId from productCategory where categoryId = 
    (Select categoryID from categories where categoryName = "mobile" ));


Select p.name,p.price,p.description from products p where p.productID in
    (Select ord.productID from orderdetails ord 
    where ord.cancelled = true group by ord.productID
    order by count(ord.productID) DESC) LIMIT 10;



