# Bank_Loan_Project
Finance Domain | Bank Loan Analysis

# KPI
### 1. Total Loan Applications{style="color:red"}

```sql 
select count(id) as total_loan_applications from bank_loan_data;
```
Output:<br>
![Total loan applications](images/image1.png)



### 2. Month to Date Loan Applications{style="color:red"}

```sql
SELECT count(id) as MTD_loan_applications from bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;
```
or
```sql
# to make it dynamic rather than getting static month and date
SELECT COUNT(id) AS MTD_loan_applications 
FROM bank_loan_data 
WHERE YEAR(issue_date) = YEAR(GETDATE()) 
AND MONTH(issue_date) = MONTH(GETDATE());
```
Output:<br>
![Total loan applications](images/image2.png)
