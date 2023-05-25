-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE DATABASE home_work2;
USE home_work2;
CREATE TABLE sales
(
id_sales INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
bucket INT NOT NULL
);

INSERT 	sales (order_date, bucket) VALUES
("2019-01-01", 101),
("2019-01-02", 300),
("2019-02-03", 250),
("2019-03-04", 95),
("2019-04-05", 320);

-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT *FROM sales;
ALTER TABLE  sales ADD COLUMN class VARCHAR(45) NOT NULL AFTER bucket;
SET SQL_SAFE_UPDATES = 0;
UPDATE sales SET class=
CASE TRUE
 WHEN sales.bucket < 100 THEN "маленький заказ"
 WHEN sales.bucket >=99 AND sales.bucket <=299 THEN "средний заказ"
 ELSE "большой заказ"
 END;

-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE TABLE orders
(
id_order INT PRIMARY KEY AUTO_INCREMENT,
worker VARCHAR(10) NOT NULL,
amount INT NOT NULL,
orderstatus VARCHAR(45)
);

INSERT 	orders (worker, amount, orderstatus) VALUES
("worker1", 100, "открыт"),
("worker2", 200, "открыт"),
("worker3", 300, "исполнен"),
("worker4", 400, "исполнен"),
("worker2", 250, "отменен"),
("worker4", 500, "отменен");

SELECT *FROM orders;

SELECT id_order, orderstatus,
CASE orderstatus
    WHEN "открыт" THEN 'заказ собирается работником склада'
    WHEN "исполнен" THEN 'заказ собиран работником склада и ожидает доставки клиенту'
    ELSE 'заказ отменен и не был собран работником склада'
END AS order_full_status
FROM orders;

