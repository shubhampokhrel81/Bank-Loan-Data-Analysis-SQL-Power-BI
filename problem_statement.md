# Bank Loan Project Report

## Problem Statement

### Dashboard 1: Summary

To effectively monitor and evaluate our bank's lending activities, I have developed a customized Bank Loan Report. This report aims to provide comprehensive insights into key loan-related metrics, enabling data-driven decision-making and strategic planning.

**Key Performance Indicators (KPIs) Requirements:**

- **Total Loan Applications:** Tracking the total number of loan applications received over specified periods and monitoring monthly variations.
- **Total Funded Amount:** Understanding the total amount of funds disbursed as loans and analyzing monthly changes.
- **Total Amount Received:** Keeping tabs on how much money we're getting back from borrowers helps us manage our cash flow. We'll also check how much we're getting each month and see if it changes.
- **Average Interest Rate:** Calculating the average interest rate on all our loans helps us understand how much we're earning. We'll watch if the interest rates change over time.
- **Average Debt-to-Income Ratio (DTI):** Finding out the average DTI of our borrowers gives us an idea of how well they can handle their finances. We'll track this over time to see if it's going up or down.

**Good Loan v Bad Loan KPIs:**

**Good Loan KPIs:**

- **Good Loan Application Percentage:** We'll calculate what percentage of loan applications are 'Good Loans.' These are loans where people are paying on time or have already paid off.
- **Good Loan Applications:** We'll count how many loan applications fall under the 'Good Loan' category, meaning they're being paid back on time or have been paid off.
- **Good Loan Funded Amount:** We'll find out how much money we've given out as 'Good Loans.' These are loans that are being paid back on time or have been paid off.
- **Good Loan Total Received Amount:** We'll track how much money we've received from borrowers for 'Good Loans,' including payments made on time or after the loan has been paid off.

**Bad Loan KPIs:**

- **Bad Loan Application Percentage:** We'll calculate what percentage of loan applications are 'Bad Loans.' These are loans where the borrower hasn't paid and we might lose money.
- **Bad Loan Applications:** We'll count how many loan applications fall under the 'Bad Loan' category, meaning the borrower hasn't paid, and we're at risk of losing money.
- **Bad Loan Funded Amount:** We'll find out how much money we've given out as 'Bad Loans.' These are loans where the borrower hasn't paid, and we might lose money.
- **Bad Loan Total Received Amount:** We'll track how much money we've received from borrowers for 'Bad Loans,' including any payments made, even if they're late or incomplete.

**Loan Status Grid View:**

To get a clear picture of how our loans are doing, we'll make a grid view report based on 'Loan Status.' This will help us see things like how many applications we've had, how much money we've lent, how much we've received back, and more, all sorted by the status of the loan.

### Dashboard 2: Overview

We'll use different kinds of charts to show important loan-related information and trends.

1. **Monthly Trends by Issue Date (Line Chart):**
   - Chart Type: Line Chart
   - Metrics: 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received'
   - X-Axis: Month (based on 'Issue Date')
   - Y-Axis: Metrics' Values
   - Objective: This chart will show us how the number of loan applications, the amount of money lent, and the amount received change over time, helping us spot any trends.

2. **Regional Analysis by State (Filled Map):**
   - Chart Type: Filled Map
   - Metrics: 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received'
   - Geographic Regions: States
   - Objective: This map will help us see which states have more loan activity, giving us insight into regional differences.

3. **Loan Term Analysis (Donut Chart):**
   - Chart Type: Donut Chart
   - Metrics: 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received'
   - Segments: Loan Terms (e.g., 36 months, 60 months)
   - Objective: This chart will show us how loans are distributed across different term lengths, helping us understand our lending patterns.

4. **Employee Length Analysis (Bar Chart):**
   - Chart Type: Bar Chart
   - Metrics: 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received'
   - X-Axis: Employee Length Categories (e.g., 1 year, 5 years, 10+ years)
   - Y-Axis: Metrics' Values
   - Objective: This chart will show us how loan activity varies based on the length of employment, helping us understand its impact on loan applications.

5. **Loan Purpose Breakdown (Bar Chart):**
   - Chart Type: Bar Chart
   - Metrics: 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received'
   - X-Axis: Loan Purpose Categories (e.g., debt consolidation, credit card refinancing)
   - Y-Axis: Metrics' Values
   - Objective: This chart will show us why people are taking out loans, giving us insight into borrower needs.

6. **Home Ownership Analysis (Tree Map):**
   - Chart Type: Tree Map
   - Metrics: 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received'
   - Hierarchy: Home Ownership Categories (e.g., own, rent, mortgage)
   - Objective: This chart will show us how loan activity differs based on home ownership status, helping us understand its impact on borrowing behavior.

### Dashboard 3: Details

We need a detailed dashboard that puts all the important loan data in one place, so people can easily find what they need.

**Objective:**

The Details Dashboard will give users a complete view of our loan portfolio, borrower profiles, and loan performance in a simple and easy-to-access format.
