SELECT top 5 * FROM bank_loan_data;

SELECT count(id) as total_loan_applications from bank_loan_data;

SELECT count(id) as MTD_loan_applications from bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

SELECT COUNT(id) AS MTD_loan_applications 
FROM bank_loan_data 
WHERE YEAR(issue_date) = YEAR(GETDATE()) 
AND MONTH(issue_date) = MONTH(GETDATE());
