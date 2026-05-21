<div align="center">

<!-- BANNER -->
<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=1F3D7A&height=200&section=header&text=Fashion%20Supply%20Chain%20Analytics&fontSize=38&fontColor=ffffff&fontAlignY=38&desc=End-to-End%20%7C%20Python%20%E2%80%A2%20SQL%20%E2%80%A2%20Power%20BI&descAlignY=58&descSize=18"/>

<!-- BADGES -->
![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-EDA-150458?style=for-the-badge&logo=pandas&logoColor=white)
![SQL](https://img.shields.io/badge/MySQL-Advanced%20Queries-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/Status-Completed-2ECC71?style=for-the-badge)
![Records](https://img.shields.io/badge/Dataset-5%2C000%20Records-E74C3C?style=for-the-badge)

<br/>

> ### 🏭 Diagnosing ₹32.24 Crore in Wasted Inventory Costs & Recovering ₹38–50 Crore in Annual Value
> *A complete analytics pipeline built across Python, SQL, and Power BI for 10 Indian fashion brands across 8 warehouses*

</div>

---

## 📌 Table of Contents

| # | Section |
|---|---------|
| 1 | [⚡ Project Snapshot](#-project-snapshot) |
| 2 | [🎯 STAR Framework — Full Story](#-star-framework--full-project-story) |
| 3 | [🔢 KPIs & Metrics Dashboard](#-kpis--metrics-dashboard) |
| 4 | [💡 Key Insights](#-key-insights) |
| 5 | [🗂️ Project Structure](#️-project-structure) |
| 6 | [🔧 Tools & Tech Stack](#-tools--tech-stack) |
| 7 | [📈 Power BI Dashboard](#-power-bi-dashboard) |
| 8 | [🚀 Recommendations & Impact](#-recommendations--projected-business-impact) |


---

## ⚡ Project Snapshot

```
📦 Dataset     →  5,000 records | 10 companies | 8 warehouses | 5 categories | 2 years (2022–2023)
🐍 Python      →  EDA + 9 feature-engineered columns (Revenue, Holding Cost, Stock Status…)
🗃️ SQL         →  14 advanced queries including CTEs + 3 Window Functions
📊 Power BI    →  1 interactive dashboard with slicers, KPI cards, trend lines
💰 Impact      →  ₹38–50 Crore projected annual value recovery identified
```

---

## 🎯 STAR Framework — Full Project Story

<details open>
<summary><strong>📍 S — SITUATION (The Business Problem)</strong></summary>
<br>

The Indian fashion retail industry operates one of the most complex supply chains in the world — thousands of SKUs, season-driven demand spikes, and geographically distributed warehouses across metro cities. Despite large revenues, **most companies have no real-time visibility into whether they're overstocked, understocked, or forecasting accurately.**

This project analysed the supply chain operations of **10 major Indian fashion brands** — Biba, Westside, Manyavar, Raymond, Fabindia, Reliance Trends, W for Woman, Pantaloons, Max Fashion, and Myntra — across **8 warehouses** (Delhi, Mumbai, Bengaluru, Kolkata, Pune, Ahmedabad, Chennai, Hyderabad).

### 🔴 The Core Problems Discovered

| # | Problem | Scale |
|---|---------|-------|
| 1 | **Inventory Imbalance** — Only 21.82% of inventory was in a balanced state | 78.18% of 5,000 records non-optimal |
| 2 | **Wasted Holding Costs** — Overstocked items tied up massive capital | ₹32.24 Crore locked in overstock alone |
| 3 | **Forecast Inaccuracy** — Demand predictions were consistently off | ~13% average misprediction rate |
| 4 | **Stockout Risk at Scale** — Lost sales from unmet demand | 1,893 records flagged as Stockout Risk |
| 5 | **No Consecutive Stockout Detection** — Chronic failures going unnoticed | Back-to-back events across warehouses |
| 6 | **Seasonal Blind Spots** — Revenue concentrated in 2 seasons | Summer + Festive = 51.79% of total revenue |

</details>

---

<details open>
<summary><strong>🎯 T — TASK (What I Set Out to Solve)</strong></summary>
<br>

Built a **complete, production-ready analytics pipeline** from raw CSV to interactive dashboard, designed to answer every critical supply chain question a business stakeholder would ask.

### Objectives

- **[Python EDA]** Clean raw data → engineer 9 analytical features → extract visual insights on demand, inventory, and revenue patterns
- **[SQL Analysis]** Write 14 structured queries — from basic aggregates to advanced window functions — covering revenue, holding costs, forecast accuracy, overstock, stockout risk, and warehouse performance
- **[Power BI]** Build a decision-support dashboard with drill-down by company, category, warehouse, and season
- **[Business Impact]** Translate every insight into a quantified recommendation with projected ₹ value

</details>

---

<details open>
<summary><strong>⚙️ A — ACTION (What I Actually Built)</strong></summary>
<br>

### Phase 1 — Python EDA & Feature Engineering

**Raw data had 10 columns.** I engineered it into **19 analytical columns** by adding:

```python
# Feature Engineering Applied
df['Month']               = df['Date'].dt.month_name()
df['Year']                = df['Date'].dt.year
df['Quarter']             = df['Date'].dt.quarter
df['Season']              = df['Month'].map(season_map)          # Winter/Summer/Monsoon/Festive
df['Demand_Gap']          = df['Actual_Demand'] - df['Forecast_Demand']
df['Forecast_Accuracy_%'] = (1 - abs(df['Demand_Gap']) / df['Forecast_Demand']) * 100
df['Revenue']             = df['Actual_Demand'] * df['Unit_Price']
df['Holding_Cost']        = df['Stock_On_Hand'] * df['Unit_Price'] * 0.20   # 20% carrying cost
df['Stock_Status']        = classify_stock(df)   # Balanced / Overstock / Stockout Risk
```

**EDA Analyses Performed:**
- Distribution analysis of Forecast vs Actual Demand
- Revenue breakdown by Category, Company, Season, Warehouse
- Inventory health heatmaps across warehouses
- Forecast accuracy ranking by company and product
- Monthly demand trend (actual vs forecast over 24 months)
- Holding cost profiling by product and brand
- Outlier detection in demand spikes and stock gaps

---

### Phase 2 — SQL Analysis (14 Queries)

| Query | Technique | Business Question Answered |
|-------|-----------|---------------------------|
| Total Revenue | `SUM()` | What is overall revenue generated? |
| Total Holding Cost | `SUM()` | How much capital is tied up in inventory? |
| Revenue by Category | `GROUP BY` + `ORDER BY` | Which category drives the most revenue? |
| Seasonal Revenue | `GROUP BY Season` | Which season is most profitable? |
| Monthly Demand Trend | `GROUP BY Month` | Where are the demand peaks and troughs? |
| Warehouse Performance | Multi-aggregate `GROUP BY` | Which warehouse is most efficient? |
| Warehouse Stockout Risk | Filtered `COUNT(*)` | Which location is most supply-starved? |
| **Consecutive Stockout Detection** | **`LAG()` Window Function** | Which warehouses have chronic failures? |
| Overstock Products | Filtered `COUNT(*)` | Which SKUs are dead inventory? |
| Top Products by Holding Cost | `SUM()` + `LIMIT` | Which products drain the most capital? |
| Company Holding Cost | `GROUP BY` Company | Which brand is least capital-efficient? |
| Average Forecast Accuracy | `AVG()` | What is the system-wide prediction quality? |
| Company Forecast Accuracy | `AVG()` ranked | Which brand plans best? Worst? |
| **Lowest Accuracy Products** | **`DENSE_RANK()` + CTE** | Which SKUs need ML forecasting urgently? |
| **Top Product per Warehouse** | **`ROW_NUMBER()` + CTE** | What should each warehouse prioritize? |

---

### Phase 3 — Power BI Dashboard

Built an interactive, multi-page Power BI dashboard with:
- **KPI Cards** — Total Revenue, Total Holding Cost, Avg Forecast Accuracy, Balanced %
- **Bar Charts** — Revenue by Category, Holding Cost by Company
- **Line Chart** — 24-month Forecast vs Actual Demand trend
- **Donut/Pie** — Stock Status distribution, Seasonal Revenue split
- **Map Visual** — Warehouse-wise Stockout Risk (geo-plotted)
- **Slicers** — Company Name, Category, Warehouse, Season, Year (fully interactive)

</details>

---

<details open>
<summary><strong>📊 R — RESULT (What the Data Revealed)</strong></summary>
<br>

See the full KPI breakdown in the next section ↓

</details>

---

## 🔢 KPIs & Metrics Dashboard

### 💰 Revenue KPIs

| Metric | Value | Insight |
|--------|-------|---------|
| **Total Revenue (2 Years)** | **₹307.64 Crore** | Across all 10 brands, 8 warehouses |
| Revenue — FY 2022 | ₹152.17 Crore | Base year |
| Revenue — FY 2023 | ₹155.47 Crore | **+2.16% YoY growth** |
| Top Category | **Formal Wear — ₹97.22 Cr** | 31.6% of total revenue |
| Bottom Category | Casual Wear — ₹29.14 Cr | Only 9.5% of revenue |
| Top Company | **Westside — ₹34.60 Cr** | 11.25% revenue share |
| Top Warehouse | **Delhi — ₹40.66 Cr** | 13.2% of total revenue |
| Top Season | **Summer — ₹80.52 Cr** | 26.17% of annual revenue |
| Festive Season | ₹78.82 Cr | 25.62% — 2nd highest |
| Summer + Festive Combined | **₹159.34 Cr** | **51.79% of all revenue** |

---

### 📦 Inventory Health KPIs

| Metric | Value | Status |
|--------|-------|--------|
| **Balanced Inventory** | **21.82% (1,091 records)** | 🔴 Critical — only 1 in 5 |
| **Overstock Rate** | **40.32% (2,016 records)** | 🔴 Highest problem |
| **Stockout Risk Rate** | **37.86% (1,893 records)** | 🔴 Major lost-sales risk |
| Total Holding Cost | **₹58.80 Crore** | 19.1% of total revenue consumed |
| Holding Cost — Overstock | **₹32.24 Crore** | 54.8% of holding cost = waste |
| Holding Cost — Stockout | ₹12.37 Crore | Unoptimized restocking cost |
| Top Overstock Product | **Trouser — 107 events** | Needs purchase cap |
| Top Holding Cost Product | **Trouser — ₹4.73 Crore** | Highest dead-capital product |

---

### 🎯 Forecast Accuracy KPIs

| Metric | Value | Implication |
|--------|-------|-------------|
| **Avg Forecast Accuracy** | **86.87%** | 13.13% demand misprediction |
| Best Company | **Fabindia — 87.72%** | Leader in demand planning |
| Worst Company | **Manyavar — 85.95%** | Needs ML model intervention |
| Worst Product | **Blazer — 85.29%** | Priority for AI forecasting |
| 2nd Worst | Pencil Skirt — 85.49% | High demand variance |
| 3rd Worst | Saree — 85.58% | Ethnic wear volatility |
| Avg Demand Gap | **-0.97 units** | Systemic overforecasting bias |
| Overforecast Orders | 2,539 / 5,000 (50.8%) | Leading cause of overstock |
| Underforecast Orders | 2,418 / 5,000 (48.4%) | Leading cause of stockouts |

---

### 🏭 Warehouse Stockout Risk

| Warehouse | Stockout Risk Events | Risk Level |
|-----------|---------------------|------------|
| **Pune** | **249** | 🔴 Highest |
| **Kolkata** | **249** | 🔴 Highest |
| Bengaluru | 244 | 🟠 High |
| Ahmedabad | 242 | 🟠 High |
| Delhi | 238 | 🟠 High |
| Hyderabad | 226 | 🟡 Moderate |
| Mumbai | 226 | 🟡 Moderate |
| Chennai | 219 | 🟢 Lower |

---

### 🏢 Company Performance Summary

| Company | Revenue | Holding Cost | Forecast Accuracy |
|---------|---------|-------------|-------------------|
| Westside | ₹34.60 Cr | ₹6.20 Cr | 87.07% |
| Manyavar | ₹33.74 Cr | ₹6.32 Cr ⚠️ | 85.95% ⚠️ |
| W for Woman | ₹32.26 Cr | ₹6.16 Cr | 86.78% |
| Raymond | ₹31.16 Cr | ₹5.94 Cr | 87.23% |
| Reliance Trends | ₹31.05 Cr | ₹5.97 Cr | 87.13% |
| Fabindia | ₹27.68 Cr | ₹5.41 Cr ✅ | 87.72% ✅ |
| Myntra | ₹28.21 Cr | ₹5.30 Cr ✅ | 87.45% |

---

## 💡 Key Insights

### 🔍 Insight 1 — Inventory Crisis Is Structural, Not Random
> **78.18% of all inventory records were either Overstocked or at Stockout Risk.** This is not occasional error — it's a systemic failure in demand planning. With only 21.82% balanced, the supply chain is operating in a constant state of imbalance.

### 🔍 Insight 2 — ₹32.24 Crore Trapped in Dead Inventory
> Overstocked items alone carry **₹32.24 Crore in holding costs** — 54.8% of the entire ₹58.80 Crore holding cost budget. This capital is earning nothing and actively degrading margins. The Trouser SKU alone accounts for ₹4.73 Crore.

### 🔍 Insight 3 — Forecasting Bias Is Overestimating Demand
> 50.8% of orders were overforecast vs. 48.4% underforecast. This **slight but consistent overforecasting bias** is the root cause of the overstock epidemic. A 1% bias at this scale = hundreds of crores in misallocated inventory.

### 🔍 Insight 4 — Pune & Kolkata Are Chronic Stockout Zones
> Both warehouses logged **249 stockout risk events** — the highest in the network. The `LAG()` window function query revealed these aren't isolated spikes. They are **consecutive, recurring events**, indicating broken replenishment cycles — not just demand surges.

### 🔍 Insight 5 — Summer & Festive Seasons Drive Half of Revenue
> Summer (₹80.52 Cr) and Festive (₹78.82 Cr) together contribute **51.79% of annual revenue**. Yet inventory pre-positioning is not optimised for these peaks, causing simultaneous stockouts in high-demand SKUs and overstock in off-season categories.

### 🔍 Insight 6 — Manyavar Has the Worst Cost-Accuracy Combo
> Manyavar has the **highest holding cost (₹6.32 Cr)** AND the **lowest forecast accuracy (85.95%)** — the worst combination possible. Every bad forecast creates excess stock, which creates holding cost. They need structural intervention first.

### 🔍 Insight 7 — Fabindia Is the Silent Efficiency Leader
> With the **best forecast accuracy (87.72%)** and among the **lowest holding costs (₹5.41 Cr)**, Fabindia demonstrates that accurate demand planning directly translates to capital efficiency. Their model should be the benchmark.

### 🔍 Insight 8 — Casual Wear Is a Capital Drain
> Casual Wear generates only **₹29.14 Crore (9.5% of revenue)** while carrying comparable per-record holding costs to Formal Wear (₹97.22 Cr). The ROI on Casual Wear inventory is structurally poor and warrants urgent SKU rationalisation.

---

## 🗂️ Project Structure

```
📁 supply-chain-end-to-end/
│
├── 📓 Fashion-Supply-Chain-EDA.ipynb        ← Main Python EDA notebook
│   ├── Data loading & inspection
│   ├── Cleaning & preprocessing
│   ├── Feature engineering (9 new columns)
│   └── Visual analysis (20+ charts)
│
├── 📄 Fashion_Supply_Chain.csv              ← Raw dataset (5,000 records, 10 cols)
├── 📄 cleaned_data.csv                      ← Engineered dataset (19 cols)
│
├── 📁 queries/
│   ├── Total Revenue.sql
│   ├── Total Holding Cost.sql
│   ├── Revenue by category.sql
│   ├── Seasonal Revenue.sql
│   ├── Monthly Demand Trend.sql
│   ├── Warehouse Performance.sql
│   ├── Warehouse-wise Stockout Risk.sql
│   ├── Warehouses with Consecutive Stockout Risk.sql   ← LAG() Window Fn
│   ├── Overstock Products.sql
│   ├── Top Products by Holding Cos.sql
│   ├── Company-wise Holding Cost.sql
│   ├── Average Forecast Accuracy.sql
│   ├── Companies Forecast Accuracy.sql
│   └── Products with Lowest Forecast Accuracy.sql      ← DENSE_RANK() + CTE
│
└── 📊 supply chain dashboard.pbix           ← Power BI interactive dashboard
```

---

## 🔧 Tools & Tech Stack

| Layer | Tool | Purpose |
|-------|------|---------|
| **Data Processing** | Python 3.10, Pandas, NumPy | EDA, feature engineering, data cleaning |
| **Visualisation (EDA)** | Matplotlib, Seaborn | 20+ analytical charts |
| **Database** | MySQL | 14 advanced SQL queries |
| **SQL Techniques** | CTEs, Window Functions (`LAG`, `ROW_NUMBER`, `DENSE_RANK`) | Advanced analytics |
| **BI Dashboard** | Power BI Desktop | Interactive business dashboard |
| **Environment** | Jupyter Notebook | Python analysis environment |

---

## 📈 Power BI Dashboard

The `.pbix` dashboard provides **real-time drill-down** across every dimension of the supply chain:

```
📊 Dashboard Features
├── KPI Cards       → Total Revenue | Total Holding Cost | Avg Forecast Accuracy | Balance %
├── Bar Chart       → Revenue by Category | Holding Cost by Company
├── Line Chart      → 24-Month Forecast vs Actual Demand Trend
├── Donut Chart     → Stock Status Distribution | Seasonal Revenue Split
├── Map Visual      → Warehouse-wise Stockout Risk (geo-plotted)
└── Slicers         → Company | Category | Warehouse | Season | Year
```

> **To open:** Download `supply chain dashboard.pbix` and open with Power BI Desktop (free).

---

## 🚀 Recommendations & Projected Business Impact

> These are data-backed, quantified recommendations derived directly from the analysis.

### 1. 🔄 Implement Dynamic Reorder Points
**Problem:** Pune and Kolkata each had 249 stockout risk events — highest in the network, and consecutive.
**Action:** Set automated reorder triggers when `Stock_On_Hand < 1.5 × avg Actual_Demand` per warehouse-SKU pair.
> **💰 Impact: Reduce stockout events by ~35–40% → Prevent ₹8–10 Crore in lost annual sales**

---

### 2. 📦 Liquidate & Cap Overstock Items
**Problem:** Top 5 overstock products (Trouser 107×, Blazer 98×, Midi Dress 96×, Formal Shirt 92×, Hoodie 88×) are absorbing ₹32.24 Crore in holding costs.
**Action:** Cap purchase orders for chronic overstock SKUs. Run end-of-season clearance promotions.
> **💰 Impact: Recover ₹10–12 Crore of holding costs. Reduce total holding cost by 15–20% in 6 months**

---

### 3. 🤖 Deploy ML-Based Demand Forecasting
**Problem:** Avg forecast accuracy is 86.87%. Blazer (85.29%), Pencil Skirt (85.49%), Saree (85.58%) are worst-performing.
**Action:** Train an XGBoost or LSTM model on historical demand, seasonality, and category signals. Pilot on the bottom 10 products first.
> **💰 Impact: Improve accuracy to 93–95% → Shift 15–18% of inventory to Balanced state → Save ₹5–7 Crore annually**

---

### 4. 🌞 Seasonal Inventory Pre-Positioning
**Problem:** Summer + Festive drive 51.79% of revenue, yet stockout risk is uniformly high year-round — no seasonal loading strategy.
**Action:** Pre-stock priority SKUs (Formal Wear, Ethnic Wear) in Delhi, Ahmedabad, Kolkata 6–8 weeks before season onset.
> **💰 Impact: Capture 5–8% additional peak-season revenue → ₹4–6 Crore per year uplift**

---

### 5. 🏭 Fix Manyavar's Cost-Accuracy Problem
**Problem:** Manyavar: worst forecast accuracy (85.95%) + highest holding cost (₹6.32 Cr) = worst ROI among all brands.
**Action:** Audit procurement cycle, reduce batch order sizes by 15–20%, introduce just-in-time ordering for slow-moving SKUs.
> **💰 Impact: Save ₹1.0–1.5 Crore for Manyavar alone. Replicate across top 3 high-cost brands → ₹4–5 Crore total**

---

### 6. 🚨 Consecutive Stockout Alert System
**Problem:** The `LAG()` SQL query uncovered back-to-back stockout risk events across multiple warehouses — chronic failures, not peaks.
**Action:** Productionise the `LAG()` logic into a daily monitoring job. Auto-escalate any warehouse with 2+ consecutive stockout flags.
> **💰 Impact: Prevent ₹3–5 Crore in annual revenue leakage from chronic undersupply**

---

### 7. 🗃️ Rationalise Casual Wear SKUs
**Problem:** Casual Wear = only ₹29.14 Cr revenue (9.5%) with disproportionate holding cost burden.
**Action:** Retain top 3 Casual Wear products by revenue. Discontinue or reduce ordering for bottom performers.
> **💰 Impact: Free ₹5–6 Crore in Casual Wear holding costs. Reinvest into Formal + Ethnic Wear (55.4% of revenue)**

---

### 8. 📍 Activate Chennai as a Relief Warehouse
**Problem:** Chennai has the lowest stockout risk (219) — underutilised capacity while Pune/Kolkata are overwhelmed.
**Action:** Cross-dock slow-moving Chennai inventory to high-demand Pune/Kolkata. Expand Chennai SKU range for neighbouring demand zones.
> **💰 Impact: ₹3–4 Crore additional annual revenue for Chennai + reduces pressure on overloaded warehouses**

---

<div align="center">

### 🏆 Combined Projected Annual Impact

| Category | Projected Value |
|----------|----------------|
| Revenue Recovery (stockout prevention) | ₹15–21 Crore/year |
| Holding Cost Savings (overstock reduction) | ₹15–18 Crore/year |
| Efficiency Gains (forecasting + SKU rationalisation) | ₹8–11 Crore/year |
| **Total Projected Annual Impact** | **₹38–50 Crore/year** |

</div>

---

## ▶️ How to Run This Project

### Python EDA

```bash
# 1. Clone the repository
git clone https://github.com/rakeshkpradhan15-hub/supply-chain-end-to-end.git
cd supply-chain-end-to-end

# 2. Install dependencies
pip install pandas numpy matplotlib seaborn jupyter

# 3. Launch the notebook
jupyter notebook "Fashion-Supply-Chain-EDA.ipynb"
```

### SQL Queries

```sql
-- 1. Create and load the table
CREATE TABLE inventory_data ( ... );
LOAD DATA INFILE 'cleaned_data.csv' INTO TABLE inventory_data;

-- 2. Run any query from the /queries folder
-- Example: Consecutive Stockout Detection
WITH stockout_analysis AS (
  SELECT `Warehouse Location`, Date, Stock_Status,
         LAG(Stock_Status) OVER (PARTITION BY `Warehouse Location` ORDER BY Date) AS previous_status
  FROM inventory_data
)
SELECT * FROM stockout_analysis
WHERE Stock_Status = 'Stockout Risk' AND previous_status = 'Stockout Risk';
```

### Power BI Dashboard

```
1. Download: supply chain dashboard.pbix
2. Open with: Power BI Desktop (free at powerbi.microsoft.com)
3. Refresh data source path if prompted
4. Explore with slicers: Company | Category | Warehouse | Season | Year
```

---

