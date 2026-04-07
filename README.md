# 🚗 Uber Data Analysis Project

---

## 📑 Table of Contents

1. Project Overview  
2. Dataset Description  
3. File Structure & Images  
4. Data Preparation & Transformations  
5. DAX Measures  
6. Key KPI Measures  
7. Location-Based Measures  
8. Day / Night Flag  
9. Dashboard Pages & Visualizations  
10. Navigation, Bookmarks & Page Navigator  
11. Drill-Down & Interactivity  
12. Performance Optimization  
13. How to Reproduce / Deliverables  
14. Business Insights & Recommendations  

---

# 📌 1. Project Overview

This project focuses on analyzing Uber ride data to extract meaningful insights related to:

- 📊 Booking trends  
- 💰 Revenue performance  
- ❌ Cancellation patterns  
- 📍 Location-based demand  

### 🎯 Objective:
To help improve **operational efficiency, driver allocation, and revenue optimization** using data-driven insights.

---

# 📊 2. Dataset Description

The dataset contains ride-level transactional data with the following features:

| Column Name        | Description |
|-------------------|------------|
| Booking_ID        | Unique ride identifier |
| Booking_Date      | Date of ride booking |
| Booking_Time      | Time of booking |
| Pickup_Location   | Starting location |
| Drop_Location     | Ending location |
| Booking_Status    | Completed / Cancelled |
| Ride_Distance     | Distance of trip |
| Booking_Value     | Revenue per ride |
| Payment_Type      | Cash / Online |
| Driver_ID         | Unique driver identifier |

---


---

# 🧹 3. Data Preparation & Transformations

## Step 1: Data Cleaning
- Removed null and duplicate records  
- Standardized column names (removed spaces, used `_`)  
- Converted date/time columns to proper format  

---

## Step 2: Feature Engineering

### Extract Date Components (SQL)

SELECT 
YEAR(Booking_Date) AS Year,
MONTH(Booking_Date) AS Month,
DAYNAME(Booking_Date) AS Day
FROM uber;

### Extract Hour (Python)
df['Hour'] = pd.to_datetime(df['Booking_Time']).dt.hour

---

## Step 3: Create Day / Night Flag
df['Day_Night'] = df['Hour'].apply(lambda x: 'Day' if 6 <= x < 18 else 'Night')

---
## Step 4: Data Validation
Checked revenue consistency
Removed outliers
Standardized booking status values

---
## Step 5. DAX Measures (Power BI)
### Total Bookings
Total Bookings = COUNT('Uber'[Booking_ID])
### Total Revenue
Total Revenue = SUM('Uber'[Booking_Value])
### Cancellation Rate
Cancellation Rate = 
DIVIDE(
    COUNTROWS(FILTER('Uber','Uber'[Booking_Status]="Cancelled")),
    COUNT('Uber'[Booking_ID])
)
### Average Ride Value
Avg Ride Value = AVERAGE('Uber'[Booking_Value])

---

## 📊 6. Key KPI Measures
📊 Total Bookings
💰 Total Revenue
📉 Average Ride Value
❌ Cancellation Rate
📏 Total Distance

---
## 📍 7. Location-Based Measures
### Pickup Count
Pickup Count = COUNT('Uber'[Pickup_Location])
### Revenue by Location
Location Revenue = SUM('Uber'[Booking_Value])

---
## 🌗 8. Day / Night Flag
Day: 6 AM – 6 PM
Night: 6 PM – 6 AM

## Used for:

Demand analysis
Driver allocation
Revenue comparison
