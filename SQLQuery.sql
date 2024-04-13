use Bank_Loan_DB;
SELECT top 5 * FROM bank_loan_data;

SELECT count(id) as total_loan_applications from bank_loan_data;

SELECT count(id) as MTD_loan_applications from bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

/* or dynamic*/
SELECT COUNT(id) AS MTD_loan_applications 
FROM bank_loan_data 
WHERE YEAR(issue_date) = YEAR(GETDATE()) 
AND MONTH(issue_date) = MONTH(GETDATE());

SELECT SUM(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

select SUM(total_payment) as MTD_Total_Amount_Received from bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;


-- Month to date total amount

SELECT 
	YEAR(issue_date) as Year,
	MONTH(issue_date) as Month,
	SUM(total_payment) as Monthly_Total_Amount_Received
FROM 
	bank_loan_data
WHERE
	YEAR(issue_date) = 2021
GROUP BY
	YEAR(issue_date),
	MONTH(issue_date)
ORDER BY
	Month;


-- Month over month total amount

WITH MonthlyTotals AS (
    SELECT 
        YEAR(issue_date) AS Year,
        MONTH(issue_date) AS Month,
        SUM(total_payment) AS Monthly_Total_Amount_Received
    FROM 
        bank_loan_data
    WHERE 
        YEAR(issue_date) = 2021 -- Filter by the desired year
    GROUP BY 
        YEAR(issue_date),
        MONTH(issue_date)
),
MonthOverMonth AS (
    SELECT 
        t1.Year,
        t1.Month,
        t1.Monthly_Total_Amount_Received AS Current_Month_Amount,
        t2.Monthly_Total_Amount_Received AS Previous_Month_Amount,
        t1.Monthly_Total_Amount_Received - t2.Monthly_Total_Amount_Received AS Month_Over_Month_Amount
    FROM 
        MonthlyTotals t1
    LEFT JOIN 
        MonthlyTotals t2 ON t1.Year = t2.Year AND t1.Month = t2.Month + 1
)
SELECT 
    Year,
    Month,
    Current_Month_Amount,
    Previous_Month_Amount,
    Month_Over_Month_Amount
FROM 
    MonthOverMonth
ORDER BY 
    Year,
    Month;

-- Average Interest Rate
SELECT 
	ROUND(AVG(int_rate)*100,2) as average_interest_rate
FROM
	bank_loan_data
WHERE
	YEAR(issue_date) = 2021;

-- Month to Month Average Interest Rate
WITH MonthlyInterestRate AS(
	SELECT
		YEAR(issue_date) as Year,
		MONTH(issue_date) as Month,
		ROUND(AVG(int_rate)*100,2) as monthly_average_interest_rate
	FROM
		bank_loan_data
	WHERE
		YEAR(issue_date) = 2021
	GROUP BY
		YEAR(issue_date),
		MONTH(issue_date)
), 
MonthOverMonthInterestRate AS(
	SELECT
		MIR1.Year,
		MIR1.Month,
		MIR1.monthly_average_interest_rate as Current_Month_Interest_Rate,
		MIR2.monthly_average_interest_rate as Previous_Month_Interest_Rate,
		ROUND((MIR1.monthly_average_interest_rate - MIR2.monthly_average_interest_rate),2) as Month_Over_Month_Interest_Rate
	FROM
		MonthlyInterestRate MIR1
	LEFT JOIN
		MonthlyInterestRate MIR2
	ON
		MIR1.Year = MIR2.Year
		and MIR1.Month = MIR2.Month+1
)
SELECT
	Year, 
	Month, 
	Current_Month_Interest_Rate, 
	Previous_Month_Interest_Rate, 
	Month_Over_Month_Interest_Rate 
FROM 
	MonthOverMonthInterestRate 
ORDER BY
	Year, 
	Month;

-- Average Debt to Income Ratio

SELECT
	ROUND(AVG(dti)*100,4) as average_debt_to_income_ratio
FROM
	bank_loan_data

-- Average DTI group by month
SELECT 
	YEAR(issue_date) as Year,
	MONTH(issue_date) as Month,
	ROUND(AVG(dti)*100,4) as Monthly_average_dti
FROM 
	bank_loan_data
WHERE
	YEAR(issue_date) = 2021
GROUP BY
	YEAR(issue_date),
	MONTH(issue_date)
ORDER BY
	Month;

---------------------------- Good Loan vs Bad Loan KPI's --------------------------------
--- Good Loan Percentage
SELECT
	COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100
	/
	COUNT(id) as Good_Loan_Percentage
FROM
	bank_loan_data

	-- or --
SELECT
	COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END)*100.0
	/
	COUNT(id) as Good_Loan_Percentage
FROM
	bank_loan_data


--- Bad Loan Percentage

SELECT
	COUNT(CASE WHEN loan_status IN ('Charged Off') THEN id END)*100.0
	/
	COUNT(id) as Bad_Loan_Percentage
FROM
	bank_loan_data


SELECT
	count(id) as Good_Loan_Applications
FROM
	bank_loan_data
WHERE
	loan_status IN ('Fully Paid', 'Current');

SELECT
	SUM(loan_amount) as Good_Loan_Funded_Amount
FROM
	bank_loan_data
WHERE
	loan_status IN ('Fully Paid', 'Current');

-- Total Good Loan Funded Amount

SELECT
	CONCAT(CAST(SUM(loan_amount)/1000000 AS DECIMAL(18,2)), ' millions') as "Good_Loan_Funded_Amount (in millions)"
FROM
	bank_loan_data
WHERE
	loan_status IN ('Fully Paid', 'Current');

SELECT
	CONCAT(CAST(SUM(total_payment)/1000000 AS DECIMAL(18,2)), ' millions') as Good_Loan_Amount_Received
FROM
	bank_loan_data
WHERE
	loan_status IN ('Fully Paid', 'Current');

-- Bad Loan

SELECT
	COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100.0
	/
	COUNT(id) as Bad_Loan_Percentage
FROM
	bank_loan_data


SELECT
	count(id) as Bad_Loan_Applications
FROM
	bank_loan_data
WHERE
	loan_status IN ('Charged Off');

SELECT
	CONCAT(CAST(SUM(loan_amount)/1000000 AS DECIMAL(18,2)), ' millions') as Bad_Loan_Total_Funded_Amount
FROM
	bank_loan_data
WHERE
	loan_status IN ('Charged Off');

SELECT
	CONCAT(CAST(SUM(total_payment)/1000000 AS DECIMAL(18,2)), ' millions') as Bad_Loan_Amount_Received
FROM
	bank_loan_data
WHERE
	loan_status IN ('Charged Off');