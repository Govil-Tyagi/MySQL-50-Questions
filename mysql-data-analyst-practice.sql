CREATE DATABASE sql_cte_practice;
USE sql_cte_practice;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees VALUES
(101, 'Rahul',  'IT',       65000, '2021-03-15'),
(102, 'Aman',   'IT',       55000, '2022-06-10'),
(103, 'Priya',  'IT',       72000, '2020-01-20'),
(104, 'Neha',   'HR',       50000, '2021-08-05'),
(105, 'Ravi',   'HR',       60000, '2019-11-12'),
(106, 'Simran', 'Sales',    48000, '2023-02-18'),
(107, 'Karan',  'Sales',    70000, '2020-09-25'),
(108, 'Vikas',  'Sales',    58000, '2022-04-14'),
(109, 'Anjali', 'Finance',  75000, '2018-07-30'),
(110, 'Rohit',  'Finance',  62000, '2021-12-01'),
(111, 'Pooja',  'Marketing',55000, '2023-01-10'),
(112, 'Arjun',  'Marketing',68000, '2020-05-22');


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1,  'Rahul Sharma', 'Delhi'),
(2,  'Aman Verma',   'Noida'),
(3,  'Priya Singh',  'Delhi'),
(4,  'Neha Gupta',   'Ghaziabad'),
(5,  'Rohit Kumar',   'Lucknow'),
(6,  'Anjali Mehta', 'Noida'),
(7,  'Vikas Yadav',  'Delhi'),
(8,  'Sneha Jain',   'Jaipur'),
(9,  'Karan Singh',  'Ghaziabad'),
(10, 'Pooja Agarwal','Lucknow');



CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101, 'Laptop',     'Electronics', 60000),
(102, 'Mobile',     'Electronics', 25000),
(103, 'Headphones', 'Electronics', 3000),
(104, 'Keyboard',   'Accessories', 1500),
(105, 'Mouse',      'Accessories', 800),
(106, 'Monitor',    'Electronics', 12000),
(107, 'Chair',      'Furniture',   7000),
(108, 'Desk',       'Furniture',   10000),
(109, 'Webcam',     'Electronics', 5000),
(110, 'Backpack',   'Accessories', 2000);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    quantity INT,
    amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(1001, 1,  '2024-01-05', 101, 1, 60000),
(1002, 2,  '2024-01-08', 102, 2, 50000),
(1003, 3,  '2024-01-15', 103, 3, 9000),
(1004, 4,  '2024-01-20', 104, 2, 3000),
(1005, 5,  '2024-02-02', 105, 5, 4000),
(1006, 6,  '2024-02-10', 106, 1, 12000),
(1007, 7,  '2024-02-18', 101, 1, 60000),
(1008, 8,  '2024-02-25', 107, 2, 14000),
(1009, 9,  '2024-03-03', 108, 1, 10000),
(1010, 10, '2024-03-10', 102, 1, 25000),

(1011, 1,  '2024-03-15', 103, 2, 6000),
(1012, 2,  '2024-03-20', 106, 2, 24000),
(1013, 3,  '2024-04-02', 104, 4, 6000),
(1014, 4,  '2024-04-10', 105, 3, 2400),
(1015, 5,  '2024-04-18', 101, 1, 60000),
(1016, 6,  '2024-04-25', 102, 2, 50000),
(1017, 7,  '2024-05-05', 107, 1, 7000),
(1018, 8,  '2024-05-12', 108, 2, 20000),
(1019, 9,  '2024-05-20', 106, 1, 12000),
(1020, 10, '2024-05-28', 103, 4, 12000),

(1021, 1,  '2024-06-05', 102, 1, 25000),
(1022, 2,  '2024-06-12', 101, 1, 60000),
(1023, 3,  '2024-06-20', 106, 2, 24000),
(1024, 4,  '2024-07-01', 108, 1, 10000),
(1025, 5,  '2024-07-08', 102, 2, 50000),
(1026, 6,  '2024-07-15', 103, 3, 9000),
(1027, 7,  '2024-08-02', 101, 1, 60000),
(1028, 8,  '2024-08-10', 105, 5, 4000),
(1029, 9,  '2024-08-18', 107, 2, 14000),
(1030, 10, '2024-09-01', 109, 2, 10000),

(1031, 1,  '2024-09-10', 110, 3, 6000),
(1032, 2,  '2024-09-18', 102, 1, 25000),
(1033, 3,  '2024-10-05', 101, 1, 60000),
(1034, 4,  '2024-10-15', 106, 1, 12000),
(1035, 5,  '2024-10-25', 108, 2, 20000),
(1036, 6,  '2024-11-05', 104, 5, 7500),
(1037, 7,  '2024-11-12', 102, 2, 50000),
(1038, 8,  '2024-11-20', 109, 3, 15000),
(1039, 9,  '2024-12-01', 101, 1, 60000),
(1040, 10, '2024-12-15', 107, 1, 7000);

-- Q1 Find total sales for each customer using CTE.
with total_customer_sales as(
select c.customer_id,c.customer_name,sum(o.amount) as total_sales from Customers c
join orders o
on c.customer_id=o.customer_id
group by c.customer_id
)
select * from total_customer_sales;


-- Q2Find customers whose total sales are greater than 50,000.
with total_customer_sales as(
select c.customer_id,c.customer_name,sum(o.amount) as total_sales from Customers c
join orders o
on c.customer_id=o.customer_id
group by c.customer_id
having total_sales > 50000
)
select * from total_customer_sales;

-- Q3 Find average salary of each department using CTE.
with avg_sal_dept as(
 select department,round(avg(salary),2)
 from employees
 group by department
)
select * from avg_sal_dept;

-- Q4 Find departments where average salary is greater than 60,000.
with avg_sal_dept as(
 select department,round(avg(salary),2)
 from employees
 group by department
 having avg(salary) > 60000
)
select * from avg_sal_dept;

-- Q5 Find total number of orders for each customer.
with total_ord as(
select c.customer_id,count(o.order_id) as total_orders from customers c
join orders o
on c.customer_id=o.customer_id
group by c.customer_id
)
select * from total_ord;

-- Q6 Find customers who placed more than 5 orders.
with placed5orders as(
select c.customer_id,count(o.quantity) as placedord from customers c
join orders o
on c.customer_id=o.customer_id
group by c.customer_id
having placedord > 5
)
select * from placed5orders;

-- Q7 Find total sales for each product.
with totalsalprdct as(
 select p.product_id,sum(o.amount)
 from orders o
 join products p
 on p.product_id = o.product_id
 group by p.product_id 
)
select * from totalsalprdct;

-- Q8 Find products whose total sales are greater than 1 lakh.
WITH totalsalesproduct AS (
    SELECT 
        p.product_id,
        p.product_name,
        SUM(o.amount) AS total_sales
    FROM products p
    JOIN orders o
        ON p.product_id = o.product_id
    GROUP BY p.product_id, p.product_name
    HAVING SUM(o.amount) > 100000
)
select * from totalsalesproduct;

-- Q9 Find average order value for each customer.
WITH avgordercst AS (
    SELECT 
        customer_id,
        ROUND(AVG(amount), 2) AS average_order_value
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM avgordercst;

-- Q10 Find customers whose average order value is greater than 2,000.
WITH avgordercst AS (
    SELECT 
        customer_id,
        ROUND(AVG(amount), 2) AS average_order_value
    FROM orders
    GROUP BY customer_id
    having average_order_value > 2000
)
SELECT *
FROM avgordercst;

-- Q11 Find customers and their total sales.
with total_sales as(
select c.customer_name,sum(o.amount) as total_sales
from customers as c
join orders as o 
on c.customer_id = o.customer_id
group by c.customer_id
)
select * from total_sales;

-- Q12 Find customers whose total sales are greater than the average customer sales.
with total_sales as (
select c.customer_id,c.customer_name,sum(o.amount) as cust_total_sales
from customers c
join orders o
on o.customer_id = c.customer_id
group by c.customer_id,c.customer_name
),
avg_sales as (
select avg(cust_total_sales) as cust_avg_sales
from total_sales
)
select ts.customer_id,ts.customer_name,ts.cust_total_sales
from total_sales ts
cross join avg_sales as av
WHERE ts.cust_total_sales > av.cust_avg_sales;

-- Q13Find employees whose salary is greater than their department's average salary.
WITH dept_avg_salary AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT
    e.employee_id,
    e.employee_name,
    e.department,
    e.salary
FROM employees e
JOIN dept_avg_salary d
    ON e.department = d.department
WHERE e.salary > d.avg_salary;


-- Q14 Find products whose price is greater than the average price of their category.
WITH price_category AS (
    SELECT
        category,
        AVG(price) AS category_avgprice
    FROM products
    GROUP BY category
)

SELECT
    p.product_name,
    p.category,
    p.price
FROM products p
JOIN price_category pc
    ON p.category = pc.category
WHERE p.price > pc.category_avgprice;

-- Q15 Find cities whose total sales are greater than ₹1,00,000.
with total_sales_cities as (
select c.city,sum(o.amount) as total_sales
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.city
having total_sales > 100000
)
select * from total_sales_cities;

-- Q16 Find the highest-paid employee from every department.
with high_paid_emp as (
 select employee_id,employee_name,department,salary,
 max(salary) over(partition by department) as highest_salary
 from employees
)
select * from high_paid_emp
WHERE salary = highest_salary
order by employee_id;

-- Q17 Find the second-highest-paid employee from every department.
with sec_highest as (
select employee_name,department,salary,
row_number() over(partition by department order by salary desc ) as sec_highest_paid_emp
from employees 
)
select employee_name,department,salary from sec_highest
where sec_highest_paid_emp = 2;

-- Q18 Find the top 3 highest-paid employees from every department.
with top3deptsalary as (
select employee_name,department,salary,
dense_rank() over(partition by department order by salary desc) as top3highpaid
from employees
)
select * from top3deptsalary
where top3highpaid <=3;

-- Q19 Find each customer's latest order.
with latest_order as(
select c.customer_name,o.order_id,o.order_date,
row_number() over(partition by c.customer_id order by o.order_date desc) latest_order
from customers c
join orders o
on o.customer_id = c.customer_id
)
select * from latest_order
where latest_order = 1;

-- Q20 Find each customer's first order.
with firstorder as (
select c.customer_name,o.order_id,o.order_date,
row_number() over(partition by c.customer_id order by o.order_date asc) as orderno
from customers c
join orders o
on o.customer_id = c.customer_id

)
select * from firstorder
where orderno = 1;

-- Q21 Find each customer's second order.
with secondorder as (
select c.customer_name,o.order_id,o.order_date,
row_number() over(partition by c.customer_id order by o.order_date asc) as orderno
from customers c
join orders o
on o.customer_id = c.customer_id
)
select * from secondorder
where orderno = 2;

-- Q22 Find the top-selling product in each category.
with  topsellingcategory as(
select p.product_id,p.product_name,p.category,sum(o.amount) as total
from products as p
join orders as o
on p.product_id = o.product_id
group by p.product_id,p.product_name,p.category
),
top as (
select product_id,product_name,category,total,dense_rank() over(partition by category order by total desc) as rnk
from topsellingcategory
)
select * from top 
where rnk = 1;


-- Q23 Find the top 3 products in each category based on sales.
with top3products as (
 select p.product_id,p.product_name,p.category,sum(o.amount) as total
 from products as p
 join orders o
 on p.product_id = o.product_id
 group by p.product_id,p.product_name,p.category
),
top3 as (
select product_id,product_name,category,total,
dense_rank() over(partition by category order by total desc) as rnk
from top3products
)
select * from top3
where rnk <=3;

-- Q24 Calculate monthly sales.
with monthlysales as (
select  month(order_date) as monthnum,monthname(order_date) as months,sum(amount) as total
from orders
group by months,monthnum
),
mosprevsale as (
select months,total,
lag(total) over(order by monthnum) as previoussales,
lead(total) over(order by monthnum) as nextsales
from monthlysales
)
select * from mosprevsale;

-- Q25 Calculate month-over-month sales growth.
with monthovermonth as (
select monthname(order_date) as months,month(order_date) as monthnum,year(order_date)as yearnum,sum(amount) as sales
from orders
group by months,monthnum,yearnum
),
 previossales as (
select 
        months,
        yearnum,
        sales,
lag(sales) over(order by yearnum,monthnum) as previosmonth
from monthovermonth
)
SELECT 
    months,
    sales,
    previosmonth,
    sales - previosmonth AS growth,
    round(((sales - previosmonth)/previosmonth*100),2) as Growthpercentage
FROM previossales;


-- Q26 Find months where sales increased compared with previous month.
with salesincreasedmonths as (
select  year(order_date) as yearnum,month(order_date) as monthnum,monthname(order_date) as months,sum(amount) as totalsales
from orders
group by months,yearnum,monthnum
),
salesprevios as (
select monthnum,months,totalsales,
lag(totalsales,1,0) over(order by  yearnum,monthnum) as previousmonths
from salesincreasedmonths
)
select months from salesprevios
where totalsales > previousmonths;

-- Q27 Find months where sales decreased compared with previous month.
with salesincreasedmonths as (
select  year(order_date) as yearnum,month(order_date) as monthnum,monthname(order_date) as months,sum(amount) as totalsales
from orders
group by months,yearnum,monthnum
),
salesprevios as (
select monthnum,months,totalsales,
lag(totalsales,1,0) over(order by  yearnum,monthnum) as previousmonths
from salesincreasedmonths
)
select months from salesprevios
where previousmonths > totalsales;


-- Q28 For every customer, show:Current Order,Previous Order,Current Amount,Previous Amount
WITH customerss AS (
    SELECT 
        c.customer_id AS customerid,
        o.order_id AS orderid,
        o.order_date AS orderdate,
        o.amount AS amount
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
),

currprevord AS (
    SELECT
        customerid,
        orderid AS current_order,
        LAG(orderid) OVER (
            PARTITION BY customerid
            ORDER BY orderdate
        ) AS previous_order,
        amount AS current_amount,
        LAG(amount) OVER (
            PARTITION BY customerid
            ORDER BY orderdate
        ) AS previous_amount
    FROM customerss
)
SELECT *
FROM currprevord;

-- Q29 Find customers who generated more revenue than the average customer.
WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(o.amount) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
),
overall_average AS (
    SELECT AVG(total_revenue) AS avg_revenue 
    FROM customer_revenue
)
SELECT customer_id, customer_name, total_revenue
FROM customer_revenue
WHERE total_revenue > (SELECT avg_revenue FROM overall_average);

-- Q30 Find employees who earn more than their department's average salary.
with totalsal as (
    SELECT 
        employee_id,
        employee_name,
        department,
        salary
    FROM employees
group by employee_id,employee_name
),
deptavgsal as (
select department,avg(salary) as avgdeptsalary
from employees
group by department
)
SELECT 
    t.employee_id,
    t.employee_name,
    t.department,
    t.salary,
    d.avgdeptsalary
FROM totalsal AS t
JOIN deptavgsal AS d
    ON t.department = d.department
WHERE t.salary > d.avgdeptsalary;

-- Q31 Find the department with the highest average salary.
with avgsalary as (
select department,avg(salary) as avgsalary
from employees
group by department
),
sechighsalary as (
select department,avgsalary,dense_rank() over(order by avgsalary desc) as rnk
from avgsalary
)
select department,avgsalary
from sechighsalary 
where rnk = 1;

-- Q32 Find the second-highest average salary department.
with avgsalary as (
select department,avg(salary) as avgsalary
from employees
group by department
),
sechighsalary as (
select department,avgsalary,dense_rank() over(order by avgsalary desc) as rnk
from avgsalary
)
select department,avgsalary
from sechighsalary 
where rnk = 2;

-- Q33 Find customers who placed orders in at least 3 different months.
WITH cusmonth AS (
    SELECT
        c.customer_id,
        c.customer_name AS customername,
        COUNT(DISTINCT DATE_FORMAT(o.order_date, '%Y-%m')) AS totalmonths
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customername, totalmonths
FROM cusmonth
WHERE totalmonths >= 3;

-- Q34 Find customers whose latest order amount is greater than their average order amount.
WITH latestord AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        amount,
        AVG(amount) OVER (
            PARTITION BY customer_id
        ) AS avg_amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC, order_id DESC
        ) AS rnk
    FROM orders
)
SELECT
    customer_id,
    order_id,
    amount AS latest_amount,
    avg_amount
FROM latestord
WHERE rnk = 1
  AND amount > avg_amount;
  
-- Q35 Find customers whose first order amount was greater than ₹5,000.
WITH ord AS (
    SELECT
        c.customer_id,
        c.customer_name,
        o.order_id,
        o.amount,
        o.order_date,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY o.order_date ASC, o.order_id ASC
        ) AS rnk
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
)
SELECT
    customer_name,
    order_id,
    amount,
    order_date
FROM ord
WHERE rnk = 1
  AND amount > 5000;
  
-- Q36 Find customers whose latest order was placed within the last 30 days.
WITH orderlast AS (
    SELECT
        c.customer_name,
        c.customer_id,
        MAX(o.order_date) AS latest_order
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    customer_id,
    latest_order
FROM orderlast
where latest_order >= current_date - interval 30 day
and latest_order < current_date + interval 1 day;

-- Q37 Find the top 3 customers by revenue in every city.
with topcust as (
select c.customer_name,c.customer_id,sum(o.amount) as amt,c.city
from orders o
join  customers c 
on c.customer_id =o.customer_id
group by c.customer_name,c.customer_id,c.city
),
citywise as (
select customer_name,customer_id,amt,city,
row_number() over(partition by city order by amt desc) as rnk
from topcust
)
select * from citywise 
where rnk <=3
ORDER BY city, rnk;

-- Q38 Find the highest-selling product in every category.
with catproduct as (
select p.category,p.product_name,sum(o.amount) as mostsellprd  
from products p
join orders o 
on o.product_id = p.product_id
group by p.category,p.product_name
),
topproduct as (
select category,product_name,mostsellprd,
row_number() over(partition by category order by mostsellprd desc) as rnk
from catproduct
)
select category,product_name,mostsellprd from topproduct
where rnk = 1;

-- Q39 Find categories whose sales are greater than the average category sales.
with totalsales as (
select p.category,sum(o.amount) as totalsum
from products p
join orders o
on p.product_id = o.product_id
group by p.category
),
avgsales as (
select avg(totalsum) as avgtotalsum  
from totalsales
)
select ts.category, ts.totalsum
from totalsales ts
cross join avgsales av
where ts.totalsum > av.avgtotalsum;

-- Q40 Find products contributing more than 10% of total company sales.
with productsales as (
select p.product_name,p.product_id,sum(o.amount) as totalproductsales
from products p
join orders o
on p.product_id = o.product_id
group by p.product_name,p.product_id
)
,companysales as(
select sum(amount) as totalcompanysales
from orders
)
select ps.product_id,
    ps.product_name,
    ps.totalproductsales,
    cs.totalcompanysales,
    ROUND(
        ps.totalproductsales * 100.0 /
        cs.totalcompanysales,
        2
    ) as contribution_percent
from productsales ps
cross join companysales cs
where ps.totalproductsales > cs.totalcompanysales * 0.10;

-- Q41 Rank customers according to total revenue.
select c.customer_name,sum(o.amount) as totalreveue,
dense_rank() over(order by sum(o.amount) desc) as rank_customer
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_name,c.customer_id;

-- Q42 — Top Customer Per City Find the highest-revenue customer from each city.
with customercity as (
select c.customer_name,c.customer_id,c.city,sum(o.amount) as revenue
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id,c.city,c.customer_name
),
topcity as (
select customer_name,customer_id,city,revenue,dense_rank() over(partition by city order by revenue desc) as top
from customercity
)
select * from  topcity
where top = 1
order by customer_id;

-- Q43 — Repeat Customers Find customers who placed at least two orders.
select c.customer_name,c.customer_id,count(o.order_id) as totalorders
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_name,c.customer_id
having totalorders >=2;

-- Q44 Customer Retention Find customers who placed an order in both January and February.
SELECT customer_id, DATE_FORMAT(order_date, '%M') AS months
FROM orders
WHERE DATE_FORMAT(order_date, '%M') IN ('January', 'February')
GROUP BY customer_id,months
HAVING COUNT(DISTINCT DATE_FORMAT(order_date, '%M')) = 2;


-- Q45 Find customers whose second order happened within 30 days of their first order.
WITH ranked_orders AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS rn
    FROM orders
),
first_second AS (
    SELECT
        customer_id,
        MAX(CASE WHEN rn = 1 THEN order_date END) AS first_order,
        MAX(CASE WHEN rn = 2 THEN order_date END) AS second_order
    FROM ranked_orders
    WHERE rn <= 2
    GROUP BY customer_id
)
SELECT
    customer_id,
    first_order,
    second_order,
    DATEDIFF(second_order,first_order) AS days_difference
FROM first_second
WHERE second_order IS NOT NULL
  AND DATEDIFF(second_order, first_order) <= 30;
  

-- Q46 — Calculate each customer's percentage contribution to total company revenue.
with custrevtotal as(
select customer_id,sum(amount) as totalcustomeramount
from orders
group by customer_id
),
totalcompanyrevenue as (
select customer_id,totalcustomeramount,sum(totalcustomeramount) over() as companyamt
from custrevtotal

)
select customer_id,round(totalcustomeramount/companyamt*100,2) as customer_contribution
from totalcompanyrevenue;

-- Q47 — Running Total Calculate cumulative sales by date. Expected: Date DailySales RunningSales
select order_date as Date,amount as DailySales,sum(amount) over(order by order_date) as RunnningSales
from orders;

-- Q48 Calculate 3-month moving average of sales.
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m-01') AS month,
        SUM(amount) AS sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
)
SELECT
    month,
    sales,
    ROUND(
        AVG(sales) OVER (
            ORDER BY month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
    ) as moving_avg_3_month
from monthly_sales
order by month;

-- Q49 — First vs Latest Order For every customer show: Customer First Order Date,Latest Order Date,First Order Amount,Latest Order Amount 
select customer_id,order_id,first_value(order_date) over(partition by customer_id order by order_date asc) as firstorder,
first_value(order_date) over(partition by customer_id order by order_date desc) as latestorder,
first_value(amount) over(partition by customer_id order by order_date asc) as firstorderamount,
first_value(amount) over(partition by customer_id order by order_date desc) as latestorderamount
from orders
order by customer_id,order_id;

-- Q50 — Customer Segmentation Classify customers:
-- Revenue < 10,000      → Low
-- 10,000–50,000         → Medium
-- > 50,000              → High

with totalrevenue as(
select customer_id,sum(amount) as customer_revenue
from orders
group by customer_id
),
classifycust as (
select customer_id,customer_revenue,case when customer_revenue < 10000 then "Low" when customer_revenue between 10000 and 50000 then "Medium" when customer_revenue > 50000 then "High" end as customerclassify
from totalrevenue
)
select * from classifycust

















































  
























































