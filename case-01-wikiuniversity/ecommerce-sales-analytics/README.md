# Ecommerce Sales Analytics (SQL Project)

## Overview
This project focuses on analyzing e-commerce transactional data using **PostgreSQL**.  
The database is designed to simulate a real-world sales environment, including customers, products, payments, and shipping data.

The goal of this project is to extract meaningful business insights from relational data using SQL queries.

---

## Database Schema

The database consists of the following main tables:

- **data_customer** → Customer information  
- **data_penjualan** → Sales transactions  
- **data_pembayaran** → Payment details  
- **data_pengiriman** → Shipping information  
- **data_produk_mobil** → Car products  
- **data_laptop** → Laptop products  
- **data_produk_iphone** → iPhone products  

### Relationships Modeled:
- Customers ↔ Transactions  
- Transactions ↔ Products  
- Transactions ↔ Payments  
- Transactions ↔ Shipping details  

---

## Project Objectives

- Analyze total revenue and sales performance  
- Identify top-performing products  
- Analyze customer purchasing behavior  
- Evaluate payment method distribution  
- Analyze shipping cost and delivery status  
- Monitor stock availability  

---

## Tools & Technologies

- PostgreSQL  
- SQL (JOIN, GROUP BY, Aggregate Functions, Subqueries)  
- Relational Database Design  

---

## Key Analysis Examples

Some analytical queries included in this project:

- Total revenue calculation  
- Sales by product category  
- Top customers by transaction volume  
- Payment method usage analysis  
- Shipping cost analysis  
- Stock monitoring  

---

## How to Use

1. Import the SQL schema into PostgreSQL  
2. Insert sample data (if applicable)  
3. Run the analytical queries provided in the `/queries` file  
4. Modify queries to explore additional insights  

---

## Skills Demonstrated

- Relational database design  
- Data modeling  
- SQL data analysis  
- Business insight extraction from transactional data  

---

## Author

**SQL Data Analysis Project**  
Built as part of data analyst portfolio development.
