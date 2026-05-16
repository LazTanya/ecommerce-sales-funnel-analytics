## E-Commerce Revenue Leakage & User Intent Analysis

### 🎯 Project Objective
This project analyzes a multi-channel e-commerce funnel to identify "friction points" in the user journey, audit channel-specific ROI, and provide data-driven recommendations for budget reallocation and UI/UX optimization.

---

### 📊 Key Performance Indicators (KPIs)
*Note: These metrics reflect the standardized 30-day reporting period used for the executive summary.*

- **Total Revenue — $76,037.93**  
  Total gross revenue from the last 30 days.

- **Overall CR — 17.0%**  
  The percentage of all visitors who completed a purchase.

- **AOV — $107.40**  
  Average Order Value per transaction.

- **RPV — $17.82**  
  Revenue Per Visitor (Total Revenue / Total Visitors).

- **Avg Journey TTC — 24.55 Min**  
  Total time from first page view to final purchase.

---

### 🛠 Tech Stack
- **Database & Analysis:** Google BigQuery (SQL)  
- **Data Modeling:** CTEs for Multi-Stage Funnel Tracking  
- **Visualization:** Tableau (Interactive Funnel & Attribution Dashboard)  
- **Key Metrics:** CR (Conversion Rate), AOV (Average Order Value), RPV (Revenue Per Visitor), and TTC (Time-to-Conversion)

---

### 🔍 Strategic Deep-Dive: The Multi-Stage Funnel
Using SQL to segment the 5-stage funnel, I identified exactly where revenue leakage is occurring:

- **Top of Funnel (Discovery):**  
  We see a 31.0% View-to-Cart rate. This indicates that 69% of users bounce without engaging with a product.

- **Middle of Funnel (Intent):**  
  Once an item is added, 71.0% of users successfully initiate the checkout process.

- **Bottom of Funnel (Conversion):**  
  The transition from Payment to Purchase is an elite 92.0%.

**Strategic Insight:**  
The bottom of the funnel is high-performing. The "technical" checkout and payment flow is frictionless.

**Recommendation:**  
Maintain current UI/UX in checkout to avoid disrupting this high-efficiency stage; pivot all optimization efforts to the "Discovery" stage.

---

### 📈 Multi-Channel Attribution & Efficiency Audit
Analysis reveals a massive disparity between volume and user intent across different traffic sources:

- **Email — 445 Views | 34.0% | Efficiency Champion**  
- **Organic — 1,750 Views | 17.0% | High Volume / High Intent**  
- **Social — 1,253 Views | 7.0% | High Volume / Low Intent**  

- **The Efficiency Champion (Email):** Delivering a staggering 34% conversion rate, this is the most profitable channel.  
- **The "Window Shopper" Risk (Social):** Social is the #2 driver of traffic but has the lowest efficiency. Social users show only a 14% Add-to-Cart rate (vs. 63% for Email), indicating a "Browsing" rather than "Buying" mindset.

---

### 🚀 Strategic Executive Summary: Growth Roadmap

1. **Marketing Strategy: The "Capture & Nurture" Pivot**
   * **The Challenge:** Social Media traffic is high volume but converts 5x slower than Email.  
   * **Strategic Action:** Stop using Social ads for direct "Buy Now" objectives. Shift budget toward Lead Generation/Email Capture ads. By moving Social visitors into the Email funnel, we transition them from a 7% conversion environment to a 34% environment, significantly increasing ROI.

2. **UI/UX Optimization: Reducing the "Discovery Gap"**
   * **The Challenge:** The 69% drop-off between Page View and Add-to-Cart is the primary "leaking bucket."  
   * **Strategic Action:** Implement Personalized Product Recommendations and "Social Proof" (e.g., "Trending Now" or "Limited Stock") on landing pages. Reducing the 11.19-minute "Time-to-Cart" window is critical to reducing decision fatigue.

3. **Financial Governance: CAC & AOV Guardrails**
   * **The Challenge:** High-volume Social traffic is only profitable if acquisition costs remain low.  
   * **Strategic Action:** Based on a $107.40 AOV, I recommend a strict Customer Acquisition Cost (CAC) ceiling of $40. Spend exceeding this threshold on low-converting channels will result in a negative contribution margin.

4. **Customer Psychology: Journey Velocity Analysis**
   * **The Challenge:** The 24.55-minute journey suggests a high-consideration cycle.  
   * **Strategic Action:** To combat abandonment, implement Exit-Intent Overlays and Automated Abandoned Cart Emails within the first 30 minutes of inactivity to capitalize on peak intent.

---

### ⚙️ Technical Implementation: Data Engineering for BI
Instead of visualizing 9,000+ raw event records, I developed an optimized SQL query that aggregates performance by Day and Traffic Source.

- **Efficiency:** I reduced the dataset to daily aggregates (approx. 150 rows), ensuring a responsive Tableau experience.  
- **Precision:** To avoid the "Average of Averages" error, I aggregated raw counts and used Calculated Fields in Tableau for dynamic filtering.  

The dashboard tracks Daily Unique Users; a user visiting on three separate days is counted once per day. This trade-off between monthly 'Unique' precision and daily 'Trend' granularity is standard practice in professional BI to maintain dashboard speed and filtering flexibility.

---

### 🧾 Repository Structure

```bash
├── sql_queries
│   ├── query.sql      # Core queries for executive summary
│   └── query_dashboard.sql    # Optimized daily aggregation logic
├── data
│   └── processed_daily_aggregates.csv # Cleaned dataset used for visualization
├── dashboard
    └── dashboard.png  # High-res preview of the tool
