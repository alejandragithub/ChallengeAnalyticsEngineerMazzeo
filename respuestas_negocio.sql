SELECT c.customer_id, c.first_name, c.last_name, c.birth_date, COUNT(o.order_id) AS sales_count_in_january
FROM [Orders] o
JOIN [Customer] c ON c.customer_id = o.customer_id
WHERE DAY(c.birth_date) = DAY(GETDATE()) AND MONTH(c.birth_date) = MONTH(GETDATE())
GROUP BY c.customer_id, c.first_name, c.last_name, c.birth_date
HAVING COUNT(o.order_id) > 1500 AND YEAR(MAX(o.purchase_date)) = 2020 AND MONTH(MAX(o.purchase_date)) = 1;


SELECT YEAR(o.purchase_date) AS year, MONTH(o.purchase_date) AS month, 
       c.first_name, c.last_name,
       COUNT(o.order_id) AS sales_count, 
       SUM(oi.quantity) AS total_sold,
       SUM(oi.unit_price * oi.quantity) AS total_transaction_amount
FROM [Orders] o
JOIN OrderItem oi ON o.order_id = oi.order_id
JOIN Item i ON oi.item_id = i.item_id
JOIN Category cat ON i.category_id = cat.category_id
JOIN Customer c ON o.customer_id = c.customer_id
WHERE cat.name = 'Cell Phones' AND YEAR(o.purchase_date) = 2020
GROUP BY YEAR(o.purchase_date), MONTH(o.purchase_date), c.first_name, c.last_name
ORDER BY YEAR(o.purchase_date), MONTH(o.purchase_date), total_transaction_amount DESC
OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;


CREATE PROCEDURE UpdateItemHistory
AS
BEGIN
    INSERT INTO ItemHistorial (item_id, registration_date, price, state)
    SELECT i.item_id, GETDATE(), i.price, i.state
    FROM Item i;
END;
