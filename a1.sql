SELECT p.productID, p.name,count(p.productID) FROM products p left join productCategory c on
c.productID = p.productID group by c.productID having count(p.productID) > 1;

SELECT count(productID) as total FROM Products WHERE price BETWEEN 0 AND 100;
SELECT count(productID) as total FROM Products WHERE price BETWEEN 100 AND 500;
SELECT count(productID) as total FROM Products WHERE price>500;

SELECT c.categoryName , count(c.categoryID) 
    from categories c left join productCategory pro on
    pro.categoryId = c.categoryID group by c.categoryID;