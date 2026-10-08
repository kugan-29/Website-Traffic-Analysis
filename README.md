# Website Traffic Analysis Dashboard

## 📖 Overview 
An end-to-end data analytics project: raw CSV → **MySQL** (cleaning & analysis) → **Power BI** (data model, DAX, interactive dashboard).

## 🔗 View the Dashboard
- [Download Power BI file (.pbix)](Website_traffic_analysisi.pbix) (open in Power BI Desktop)
- [View dashboard (PDF)](website_traffic.pdf)
- [SQL queries](Website_traffic_analysis.sql)
 
## 😉 View the Work
![Dashboard](Website_traffic_analysis.png)

---
## 🛠️ Tools Used
<p>
  <img src="https://img.shields.io/badge/Power%20BI-F2C811?style=flat-square&logo=powerbi&logoColor=black"/>
  <img src="https://img.shields.io/badge/SQL-4479A1?style=flat-square&logo=mysql&logoColor=white"/>
  <img src="https://img.shields.io/badge/DAX-FF6F00?style=flat-square"/>
</p>

- **MySQL** – data loading, data quality checks, aggregation queries, view for reporting
  
- **Power BI Desktop** – Power Query, data modeling, DAX, dashboard design
  
- **DAX** – KPI measures, time intelligence
  

---
## 🤗 Objective
Understand how website traffic converts into business value, and find out:

- Which traffic sources and campaigns drive the most sessions and revenue
- Which channels bring **high-quality** traffic (high conversion, low bounce)
- Where there is room to improve

---

## 📊 Dataset

| Item | Details |
|---|---|
| Rows | 12,000 |
| Period | 1 Jan 2025 – 31 Dec 2025 (365 days) |
| Granularity | Date + hour level |
| Key columns | Date, Country, City, Traffic Source, Campaign, Device, Landing Page, Users, Sessions, Bounce Rate, Conversions, Revenue |

---

## Workflow

```
CSV  →  MySQL table  →  Data quality checks  →  SQL analysis
     →  SQL view (v_traffic_clean)  →  Power BI (Import)
     →  Date table + relationship  →  DAX measures  →  Dashboard
```

### 1. 💪 Data quality checks (SQL)

- 12,000 rows loaded, totals reconciled with the source file
- 0 NULL values in key columns
- 0 duplicate rows
- Date range valid (365 distinct days)
- Logic checks passed (`new_users ≤ users ≤ sessions`)

### 2. 🐬 SQL analysis

Key queries (all in [`sql/`](sql/)):

- Overall totals (sessions, conversions, revenue)
- Performance by traffic source
- Top 5 campaigns by revenue
- Monthly sessions and revenue trend

## 📈 Dashboard Features

- 6 KPI cards: Sessions, Conversions, Revenue, Conversion Rate, Bounce Rate, Revenue per Session
- Monthly sessions trend (line chart)
- Sessions by traffic source (donut)
- Top 10 campaigns by revenue (bar chart)
- Revenue per session by traffic source
- Slicers: Device, Country, Day Type
- Custom night-sky theme

---

## 🔑 Key KPIs

| KPI | Value |
|---|---|
| Total Sessions | 819,973 |
| Total Conversions | 40,029 |
| Total Revenue | ~2.26M |
| Conversion Rate | 4.88% |
| Bounce Rate | 44.67% |
| Revenue per Session | 2.76 |

---

## ✨ Key Insights

1. **Organic Search is the biggest channel**: 34% of sessions and about 32% of revenue (716K). Three of the top four campaigns are SEO.
2. **Email is the highest-quality traffic**: only 8% of sessions, but the best conversion rate (7.67%), lowest bounce rate (32%) and highest revenue per session (4.36).
3. **Social Media underperforms**: 16% of sessions, but the highest bounce rate (57%) and the lowest revenue per session (2.34).

### 💡 Recommendations

- Scale Email campaigns, since they bring the best value per session.
- Keep investing in SEO, the largest revenue source.
- Review Social Media targeting and landing pages to reduce bounce.
---

## Author

**Kugan J**
Data Analyst | SQL · Power BI · Excel · Python
[LinkedIn](https://linkedin.com/in/kugan-j) · [Portfolio](https://kugan-29.github.io/portfolio)
