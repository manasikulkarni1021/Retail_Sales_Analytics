# Retail Sales Analytics | Python, MySQL & Power BI

## Project Overview

Retail Sales Analytics is an end-to-end data analytics portfolio project that demonstrates how Python, MySQL, and Power BI can be used to generate, analyze, and visualize retail sales data.

The project uses a synthetic retail dataset containing customer, product, and order information for the year 2025.

## Tools & Technologies

- **Python:** Pandas, NumPy, and pathlib
- **MySQL:** Data storage, SQL queries, joins, aggregations, and validation
- **Power BI:** Data modeling, DAX measures, interactive dashboards, and visualization
- **MySQL Workbench:** Database management and SQL analysis

## Dataset Information

| Dataset | Records | Description |
|---|---:|---|
| Customers | 100 | Customer details and cities |
| Products | 20 | Product details, categories, and prices |
| Orders | 500 | Sales transactions recorded during 2025 |

## Project Workflow

1. Generated synthetic retail datasets using Python.
2. Exported the datasets into CSV files.
3. Imported the CSV files into MySQL.
4. Analyzed sales performance using SQL queries.
5. Validated sales totals and relationships.
6. Connected MySQL tables to Power BI.
7. Created relationships between customers, products, and orders.
8. Built an interactive sales analytics dashboard.

## Key Performance Indicators

- **Total Revenue:** ₹3,490,836.83
- **Total Orders:** 500
- **Total Units Sold:** 1,507

## Key Business Insights

- Electronics generated the highest category revenue at ₹1,405,378.52.
- August 2025 recorded the highest monthly revenue at ₹372,631.24.
- May 2025 recorded the lowest monthly revenue at ₹227,969.62.
- Product 13 generated the highest product revenue at ₹329,689.36.
- Nagpur contributed the highest city revenue at ₹873,066.85.
- Fashion generated the lowest category revenue at ₹206,478.77.

## Dashboard Features

The Power BI dashboard includes:

- Total Revenue, Total Orders, and Units Sold KPI cards
- Monthly Revenue Trend
- Revenue by Product Category
- Top Products by Revenue
- Top Customers by Revenue
- Revenue by City
- Interactive filters for Order Date, City, and Product Category

## Project Structure

```text
Retail_Sales_Analytics/
├── data/
│   ├── customers.csv
│   ├── products.csv
│   └── orders.csv
├── python/
│   └── generate_data.py
├── sql/
│   └── retail_sales_analysis.sql
├── powerbi/
│   └── Retail_Sales_Analytics.pbix
└── README.md
```

## Business Recommendations

- Investigate opportunities to improve Fashion category performance.
- Review high-performing products to support inventory and sales planning.
- Analyze the factors contributing to strong August sales.
- Investigate missing city information to improve location-based reporting.

## Conclusion

This project demonstrates practical skills in Python data generation, relational databases, SQL analysis, data validation, Power BI modeling, and dashboard development.

**Note:** All data is synthetic and used for learning and portfolio demonstration purposes.