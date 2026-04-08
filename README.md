# 🚗 Uber Data Analysis 

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

# 🧹 3. Data Preparation & Transformations

## Step 1: Data Cleaning
- Removed null and duplicate records  
- Standardized column names (removed spaces, used `_`)  
- Converted date/time columns to proper format  



## Step 2: Feature Engineering

### Extract Date Components (SQL)

SELECT 
YEAR(Booking_Date) AS Year,
MONTH(Booking_Date) AS Month,
DAYNAME(Booking_Date) AS Day
FROM uber;

### Extract Hour (Python)
df['Hour'] = pd.to_datetime(df['Booking_Time']).dt.hour



## Step 3: Create Day / Night Flag
df['Day_Night'] = df['Hour'].apply(lambda x: 'Day' if 6 <= x < 18 else 'Night')


## Step 4: Data Validation
Checked revenue consistency
Removed outliers
Standardized booking status values


---
# 📐4. DAX Measures (Power BI)
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

# 📊 5. Key KPI Measures
- 📊 Total Bookings
- 💰 Total Revenue
- 📉 Average Ride Value
- ❌ Cancellation Rate
- 📏 Total Distance


---
# 📍 6. Location-Based Measures
### Pickup Count
Pickup Count = COUNT('Uber'[Pickup_Location])
### Revenue by Location
Location Revenue = SUM('Uber'[Booking_Value])


---
# 🌗 7. Day / Night Flag
- Day: 6 AM – 6 PM
- Night: 6 PM – 6 AM

## Used for:

- Demand analysis
- Driver allocation
- Revenue comparison

---
# 📊 8. Dashboard Pages & Visualizations
## 1️⃣ Overview Page

### KPIs:

- Total Bookings
- Revenue
- Avg Ride Value
- Cancellation Rate

### Charts:

- Booking trend (Line chart)
- Booking status (Donut chart)
## 2️⃣ Location Analysis

### Charts:

- Top pickup locations (Bar chart)
- Revenue by location

### Insights:

- High-demand areas
- Revenue concentration
## 3️⃣ Time Analysis

### Charts:

- Bookings by hour
- Day vs Night comparison
## 4️⃣ Cancellation Analysis

### Charts:

- Cancellation by location
- Cancellation trends

---
# 🔍 9. Drill-Down & Interactivity
### Drill-Down Features:
- Date → Month → Day
- Location → Area
### Filters (Slicers):
- Date
- Location
- Booking Status
### Interactivity:
-Cross-filtering between visuals
-Dynamic filtering across pages


---
# ⚡ 10. Performance Optimization
- Removed unnecessary columns
- Optimized DAX measures
- Reduced number of visuals per page
- Used aggregated data

---
# 🚀 11. How to Reproduce / Deliverables
### Steps:
- Load dataset into SQL / Python
- Perform data cleaning & transformation
- Create Power BI dashboard
- Add KPIs and visuals
- Apply filters and interactivity
### 📦 Deliverables
- ✅ SQL Queries
- ✅ Python Notebook
- ✅ Power BI Dashboard
- ✅ Insights Report


---
# 📈 12. Business Insights & Recommendations
- 📊 Key Insights
- 🚀 Peak bookings during evening hours
- 📍 Revenue concentrated in top locations
- ❌ High cancellations in specific zones
- 🌙 Night demand differs significantly

---
# ⭐ 13. Conclusion

This project demonstrates end-to-end data analysis, from raw data to actionable insights, using SQL, Python, and Power BI.

---
# 14. Dashboard Images


### Overview 


<img src="https://github.com/GauriPise/Uber-Data-Analysis/blob/main/Screenshot%202026-04-05%20231342.png" width="1000"> <br>

---
### Vehicle Analysis


<img src="https://github.com/GauriPise/Uber-Data-Analysis/blob/main/Screenshot%202026-04-05%20231406.png" width="1000"> <br>

---
### Booking and Location Analysis


<img src="https://github.com/GauriPise/Uber-Data-Analysis/blob/main/Screenshot%202026-04-05%20231440.png" width="1000"> <br>

---
### Customer and Payment Analysis


<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot%202026-04-05%20231534.png" width="1000"> <br>

## Python Images

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 230713.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 230741.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 230843.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 230859.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 230913.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 231012.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 231038.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 231052.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 231106.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 231118.png" width="1000"> <br>

---

## SQL Images

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 231155.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 231209.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 231227.png" width="1000"> <br>

<img src="https://github.com/GauriPise/Uber/blob/main/Screenshot 2026-04-05 231240.png" width="1000"> <br>
