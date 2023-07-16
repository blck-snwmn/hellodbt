CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO customers (id, name, email)
VALUES (1, 'Alice', 'alice@example.com'),
       (2, 'Bob', 'bob@example.com'),
       (3, 'Charlie', 'charlie@example.com'),
       (4, 'David', 'david@example.com'),
       (5, 'Eve', 'eve@example.com'),
       (6, 'Frank', 'frank@example.com'),
       (7, 'Grace', 'grace@example.com'),
       (8, 'Heidi', 'heidi@example.com'),
       (9, 'Ivan', 'ivan@example.com'),
       (10, 'Judy', 'judy@example.com');

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    product VARCHAR(100),
    quantity INT,
    order_date DATE
);

INSERT INTO orders (id, customer_id, product, quantity, order_date)
VALUES (1, 1, 'Apple', 10, '2023-01-01'),
       (2, 2, 'Banana', 20, '2023-02-01'),
       (3, 3, 'Cherry', 30, '2023-03-01'),
       (4, 1, 'Apple', 40, '2023-04-01'),
       (5, 2, 'Banana', 50, '2023-05-01'),
       (6, 3, 'Cherry', 60, '2023-06-01'),
       (7, 4, 'Durian', 70, '2023-07-01'),
       (8, 5, 'Elderberry', 80, '2023-08-01'),
       (9, 6, 'Fig', 90, '2023-09-01'),
       (10, 7, 'Grape', 100, '2023-10-01'),
       (11, 8, 'Honeydew', 110, '2023-11-01'),
       (12, 9, 'Ice Cream Bean', 120, '2023-12-01'),
       (13, 10, 'Jackfruit', 130, '2024-01-01');

CREATE TYPE order_status AS ENUM ('order_accepted', 'paid', 'ordered', 'shipped', 'delivered');

CREATE TABLE order_histories (
    history_id SERIAL PRIMARY KEY,
    order_id INT,
    customer_id INT,
    product_name VARCHAR(100),
    order_date DATE,
    status order_status,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

INSERT INTO order_histories (order_id, customer_id, product_name, order_date, status)
VALUES
(1, 1, 'Product 1', '2022-01-01', 'order_accepted'),
(1, 1, 'Product 1', '2022-01-01', 'paid'),
(1, 1, 'Product 1', '2022-01-01', 'ordered'),
(1, 1, 'Product 1', '2022-01-02', 'shipped'),
(1, 1, 'Product 1', '2022-01-03', 'delivered'),
(2, 2, 'Product 2', '2022-02-01', 'order_accepted'),
(2, 2, 'Product 2', '2022-02-01', 'paid'),
(2, 2, 'Product 2', '2022-02-01', 'ordered'),
(2, 2, 'Product 2', '2022-02-02', 'shipped'),
(2, 2, 'Product 2', '2022-02-03', 'delivered'),
(3, 1, 'Product 3', '2022-03-01', 'order_accepted'),
(3, 1, 'Product 3', '2022-03-01', 'paid'),
(3, 1, 'Product 3', '2022-03-01', 'ordered'),
(3, 1, 'Product 3', '2022-03-02', 'shipped'),
(4, 2, 'Product 1', '2022-04-01', 'order_accepted'),
(4, 2, 'Product 1', '2022-04-01', 'paid'),
(4, 2, 'Product 1', '2022-04-01', 'ordered'),
(4, 2, 'Product 1', '2022-04-02', 'shipped'),
(5, 1, 'Product 2', '2022-05-01', 'order_accepted');
