--drop table if exists
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS members;

--Create new table sales
CREATE TABLE sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INTEGER
);

INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', 1),
  ('A', '2021-01-01', 2),
  ('A', '2021-01-07', 2),
  ('A', '2021-01-10', 3),
  ('A', '2021-01-11', 3),
  ('A', '2021-01-11', 3),
  ('B', '2021-01-01', 2),
  ('B', '2021-01-02', 2),
  ('B', '2021-01-04', 1),
  ('B', '2021-01-11', 1),
  ('B', '2021-01-16', 3),
  ('B', '2021-02-01', 3),
  ('C', '2021-01-01', 3),
  ('C', '2021-01-01', 3),
  ('C', '2021-01-07', 3);
  
 --SELECT * FROM sales
 
 CREATE TABLE menu (
  product_id INTEGER,
  product_name VARCHAR(5),
  price INTEGER
);

INSERT INTO menu
  (product_id, product_name, price)
VALUES
  (1, 'sushi', 10),
  (2, 'curry', 15),
  (3, 'ramen', 12);

--SELECT * FROM menu

CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);

INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');

--SELECT * FROM members

--Each of the following case study questions can be answered using a single SQL statement:

--What is the total amount each customer spent at the restaurant?

SELECT customer_id, CONCAT('$', SUM(price)) AS total_spent
FROM sales
LEFT JOIN menu
ON sales.product_id=menu.product_id
GROUP BY customer_id
ORDER BY customer_id;

Customer A spent $76, customer B spent $74, and customer C spent $36

--How many days has each customer visited the restaurant?


--What was the first item from the menu purchased by each customer?


--What is the most purchased item on the menu and how many times was it purchased by all customers?


--Which item was the most popular for each customer?


--Which item was purchased first by the customer after they became a member?


--Which item was purchased just before the customer became a member?


--What is the total items and amount spent for each member before they became a member?


--If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?


--In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

  