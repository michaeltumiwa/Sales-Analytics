# Sales Analytics & Automation Project (PowerBI, SQL)

---

## Project Overview
This project aims to build a real-time sales analytics and automation solution using Power BI, based on data from AdventureWorksDW2022. The goal is to provide interactive dashboards, automated alerts, and streamlined reporting to enhance decision-making for sales managers. By integrating Power BI with Power Automate and SQL-based data validation, this project ensures that stakeholders can track key sales trends, monitor inventory, and respond proactively to fluctuations in performance.

### Key Deliverables

- Sales Performance Dashboard for revenue tracking.
- Product Inventory Dashboard for stock monitoring.
- Customer Insights Dashboard to analyze key clients.
- Automated Alerts System for identifying critical sales trends.

---

## Identifying the Right Dataset
### Data Source: AdventureWorksDW Database

This project utilizes AdventureWorksDW2022, a Microsoft sample database designed for business intelligence and data analytics. It provides a structured dataset for analyzing sales performance, customer trends, and inventory management.

---

## Understanding the Business Challenge
### Business Objective
Sales teams need real-time analytics to track performance trends, identify top-selling products, and monitor key customers. Static reports do not provide immediate insights, making it difficult to respond to market changes quickly.

### Business Request
> "We need a **real-time sales analytics solution** to monitor performance trends, top-selling products, and key customers. Additionally, we require **automated alerts** for significant sales fluctuations to take immediate action."

### Solution
Build a Power BI system that integrates automation, predictive insights, and user-friendly dashboards to enable proactive decision-making.

---

## Building the Data Pipeline
### Data Extraction & Preparation
To ensure accurate and reliable reporting, sales data was extracted and cleaned from AdventureWorksDW.

**Fact Tables:**
- `SalesPerformance`
- `ProductInventory`
- `DailySalesTrendsAndAlerts`

**Dimension Tables:**
- `CustomerInsights`
- `DimProduct`
- `DimDate`

### Key Data Processing Steps
- Standardized and cleaned data for consistency.
- Created a `DimDate` table for proper time-based filtering.
- Removed duplicates and ensured valid data relationships.

---

## Crafting Interactive Dashboards
### Power BI Dashboards: Providing Actionable Insights
Each dashboard was designed to provide clear, interactive, and real-time analytics.

### Sales Performance Dashboard
**Key Insights:** Sales trends, revenue breakdowns, and top-performing products.

**Visual Components:**
- **Sales Trend Line Chart** – Tracks sales fluctuations over time.
- **Top Customers Table** – Highlights key revenue-driving clients.
- **Total Sales KPI Card** – Provides an instant snapshot of total revenue.

**DAX Measure:**
```DAX
Total Sales = SUM(SalesPerformance[SalesAmount])
```

### Product Inventory Dashboard
**Key Insights:** Real-time inventory levels and low-stock alerts.

**Visual Components:**
- **Bar Chart: Stock Levels per Product**
- **Low Inventory Warning KPI**
- **Slicers for Product Category & Supplier**

**DAX Measure:**
```DAX
Low Stock Alert = IF(SUM(ProductInventory[TotalStock]) < 10, "Low Stock", "Sufficient Stock")
```

### Customer Insights Dashboard
**Key Insights:** Customer segmentation and top-spending clients.

**Visual Components:**
- **Pie Chart: Customer Segmentation**
- **Top 10 Customers by Spending Table**
- **Filters for Region & Income Level**

**DAX Measure:**
```DAX
Total Revenue Per Customer = SUM(CustomerInsights[TotalSpent])
```

### Automated Alerts Dashboard
**Key Insights:** Notifications for unexpected sales drops.

**Visual Components:**
- **Sales Drop Alert Card** – Provides instant notifications.
- **Sales Trends Table** – Monitors performance over time.
- **Power Automate Integration** – Sends alerts to decision-makers.

**DAX Measure:**
```DAX
Sales Drop Alert = IF(DailySalesTrendsAndAlerts[SalesAlert] = "Sales Drop", "Immediate Action Needed", "Sales Stable")
```

---

## Automating Data Refresh & Notifications
### Power Automate Integration
To reduce manual reporting efforts, the following automations were implemented:
- **Scheduled dataset refreshes every 12 hours** via Power BI Service.
- **Automated email alerts** for sudden sales declines.
- **Seamless integration with OneDrive/SharePoint** for live data updates.

---

## Final Impact & Future Enhancements
- **Real-time decision-making** enabled through dynamic dashboards.
- **Automated alerts** reducing response time for sales issues.
- **Data validation pipeline** ensuring accurate reporting.
- **Enhanced forecasting** using historical data trends.

