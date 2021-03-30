use eCommerce;

Create view order1 as
    Select o.orderID , o.userID , o.orderTotal , o.orderDate ,ord.shipped ,ord.productID 
    from orderdetails ord left join orders o on ord.orderID = o.orderID;


create view order2 as
    Select temp.orderID,products.name,products.price,temp.userID,temp.orderDate,temp.shipped 
    from products 
    right join 
    order1 temp
    on products.productID = temp.productID;

Create view OrdersInfo as
Select 
    temp2.orderID,temp2.name,temp2.price,
    u.name as username,u.email,temp2.orderDate,
    case
        when temp2.shipped = 1 then 'shipped'
        else 'processed'
    end as order_status
    from user u right join 
    order2  temp2
    on u.userID = temp2.userID; 


select 
    *
from
    OrdersInfo oi
where
    oi.order_status = 'shipped';


select 
    oi.name, count(oi.name) as count
from
    OrdersInfo oi
group by oi.name
order by count desc
limit 4;
