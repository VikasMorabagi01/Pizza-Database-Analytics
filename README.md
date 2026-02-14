<h1 align="center">🍕 Pizza Sales SQL Analysis</h1>
<p align="center">
End-to-End Business Data Analysis using SQL
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL-Analytics-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Level-Portfolio_Project-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/Focus-Business_Insights-orange?style=for-the-badge">
</p>

---

## 📖 Project Overview
This project performs an end-to-end analysis of a pizza restaurant's sales dataset using **SQL**.  
The goal is to transform raw transactional data into meaningful business insights that help understand customer behavior, sales performance, and revenue patterns.

The project demonstrates real-world **Data Analyst workflow**:
- Data exploration
- KPI calculation
- Trend analysis
- Product performance evaluation
- Revenue contribution analysis

---

## 🗃️ Database Schema
| Table | Description |
|------|-----------|
| `orders` | Stores order date & time |
| `order_details` | Quantity of pizzas in each order |
| `pizzas` | Pizza size and price |
| `pizza_types` | Pizza name and category |

---

## 🧠 Skills Demonstrated
✔ SQL Joins  
✔ Aggregations & Grouping  
✔ Window Functions  
✔ KPI Analysis  
✔ Revenue Analytics  
✔ Time Series Analysis  
✔ Business Insight Generation  

---

## 📊 Business Questions Answered

### 🔹 Basic Analysis
- Total number of orders
- Total revenue generated
- Highest priced pizza
- Most common pizza size
- Top 5 most ordered pizzas

### 🔹 Intermediate Analysis
- Quantity sold per category
- Orders distribution by hour
- Category performance analysis
- Average pizzas sold per day
- Top 3 pizzas by revenue

### 🔹 Advanced Analysis
- Revenue contribution percentage
- Cumulative revenue growth
- Top 3 pizzas per category using window functions

---

## 📈 Key Insights
- Peak sales occur during lunch and dinner hours
- Large pizzas generate the highest revenue share
- A small number of pizzas contribute most of the revenue (Pareto Principle)
- Classic category dominates order volume

---

## ▶️ How to Run the Project
1. Create database in MySQL / PostgreSQL
2. Import dataset CSV files into tables:
   - `orders`
   - `order_details`
   - `pizzas`
   - `pizza_types`
3. Execute:

```sql
pizza_analysis.sql
