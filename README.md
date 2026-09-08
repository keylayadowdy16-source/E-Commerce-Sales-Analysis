🛒 E-Commerce Sales Analysis

## 📌 Project Overview

This project analyzes a simulated e-commerce sales database using SQL and MySQL Workbench.

The goal of the project is to practice real-world data analyst skills by answering business questions about:

- Customer behavior
- Order activity
- Product performance
- Revenue
- Product categories
- Customer spending

This project was created as a portfolio practice project to demonstrate SQL querying, data aggregation, joins, grouping, sorting, and business insight generation.

---

## 🛠️ Tools Used

- **MySQL**
- **MySQL Workbench**
- **SQL**
- **GitHub** *(for portfolio presentation)*

---

## 🗂️ Database Structure

The database contains four main tables:

### `customers`
Contains customer information such as:

- `customer_id`
- `first_name`
- `last_name`
- `email`

### `products`
Contains product information such as:

- `product_id`
- `product_name`
- `category`
- `price`

### `orders`
Contains order information such as:

- `order_id`
- `customer_id`
- `order_date`

### `order_items`
Connects orders to products and contains:

- `order_item_id`
- `order_id`
- `product_id`
- `quantity`

---

## ❓ Business Questions

The analysis answers the following questions:

1. How many customers are in the database?
2. How many orders were placed?
3. Which products sold the most units?
4. Which products generated the most revenue?
5. Which product categories generated the most revenue?
6. Which customers spent the most money?
7. Which customers placed the most orders?
8. What is the average order value?

---

# 📊 Key Findings

## 👥 Customer Overview

The database contains **50 customers**.

## 🧾 Order Overview

A total of **56 orders** were placed.

## 📦 Product Performance

Based on units sold, **Headphones** were the top-selling product with **4 units sold**.

Other products with 3 units sold included:

- Wireless Mouse
- Water Bottle
- Monitor
- Notebook

## 💰 Product Revenue

The products generating the most revenue were:

| Product | Revenue |
|---|---:|
| Laptop | $1,799.98 |
| Smartphone | $1,399.98 |
| Monitor | $749.97 |
| Tablet | $499.99 |
| Office Chair | $399.98 |
| Headphones | $319.96 |
| Backpack | $99.98 |
| Wireless Mouse | $89.97 |
| Keyboard | $59.99 |
| Water Bottle | $59.97 |
| Desk Lamp | $39.99 |
| Planner | $29.98 |
| Notebook | $29.97 |

**Key insight:** The **Laptop generated the highest revenue**, even though Headphones sold more units. This shows why both unit sales and revenue are important when evaluating product performance.

## 🏷️ Category Performance

The strongest-performing category was **Electronics**.

| Category | Revenue |
|---|---:|
| Electronics | $4,945.82 |
| Home Office | $464.96 |
| Accessories | $159.95 |
| Stationery | $59.95 |

**Key insight:** Electronics generated significantly more revenue than the other product categories.

## 👤 Customer Spending

The highest-spending customers were:

| Customer | Total Spent |
|---|---:|
| Jasmine Brown | $1,649.96 |
| Christopher Harris | $1,399.98 |
| Sarah Johnson | $1,119.94 |
| Michael Taylor | $499.99 |
| Andrew Clark | $399.98 |

**Key insight:** Jasmine Brown was the highest-value customer in the dataset, spending **$1,649.96**.

## 🔁 Orders Per Customer

The customer with the most orders was:

**Mike Williams — 3 orders**

Several customers placed 2 orders, while many customers placed 1 order.

## 💵 Average Order Value

The average order value was approximately:

**$338.55**

This represents the average amount spent per order across the analyzed orders.

---

# 🔎 SQL Skills Demonstrated

This project helped me practice several important SQL skills used in data analyst roles:

- `SELECT`
- `COUNT()`
- `SUM()`
- `AVG()`
- `JOIN`
- `GROUP BY`
- `ORDER BY`
- Aggregate functions
- Subqueries
- Calculated fields
- Sorting results
- Connecting data across multiple tables

Example calculation used to determine product revenue:

```sql
SUM(order_items.quantity * products.price)
```

This calculates revenue by multiplying the quantity purchased by the product price.

---

# 📈 Portfolio Insights

The analysis demonstrates several business-focused insights:

### 1. High sales volume does not always mean high revenue
Headphones sold the most units, but the Laptop generated the most revenue.

### 2. Electronics drive the majority of revenue
Electronics was the strongest-performing category by a large margin.

### 3. A small number of customers account for significant spending
Jasmine Brown, Christopher Harris, and Sarah Johnson were the highest-spending customers in the dataset.

### 4. Customer order frequency varies
Mike Williams placed the most orders with 3, while many customers placed only one order.

---

# 📁 Project Files

```text
E-Commerce-Sales-Analysis/
│
├── README.md
│
├── SQL/
│   └── ecommerce_analysis.sql
│
└── Screenshots/
    ├── total_customers.png
    ├── total_orders.png
    ├── top_products.png
    ├── product_revenue.png
    ├── customer_spending.png
    └── orders_per_customer.png
```

---

# 🎯 Project Goal

The purpose of this project was to build practical SQL experience by working with a relational database and turning raw sales data into business insights.

This project represents an early step in building my **Data Analytics portfolio** and developing skills for entry-level data analyst roles.

---

## 🚀 Future Improvements

Possible next steps for this project include:

- Create visualizations from the SQL results
- Build a sales dashboard
- Analyze sales trends by date
- Calculate monthly revenue
- Identify repeat customers
- Analyze average customer spending
- Add more realistic sales data
- Connect the SQL results to Power BI or Tableau

---

**Created as a SQL/Data Analytics portfolio project.**
