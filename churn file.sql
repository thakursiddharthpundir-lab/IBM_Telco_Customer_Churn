drop table customers;

CREATE TABLE customers(
customerID VARCHAR(50),
gender VARCHAR(20),
SeniorCitizen INT,
Partner VARCHAR(10),
Dependents VARCHAR(10),
tenure INT,
PhoneService VARCHAR(10),
MultipleLines VARCHAR(30),
InternetService VARCHAR(30),
OnlineSecurity VARCHAR(30),
OnlineBackup VARCHAR(30),
DeviceProtection VARCHAR(30),
TechSupport VARCHAR(30),
StreamingTV VARCHAR(30),
StreamingMovies VARCHAR(30),
Contract VARCHAR(30),
PaperlessBilling VARCHAR(10),
PaymentMethod VARCHAR(100),
MonthlyCharges FLOAT,
TotalCharges VARCHAR(50),
Churn VARCHAR(10)
);

select count(*) from customers;


select * from customers

--total churn
select churn,count(*) from customers 
group by churn

--contract has higest churn

select contract , count(*) from customers
group by contract

--avg tenure
select avg(tenure) from customers
where churn='Yes'

--revnue lost 
select sum(monthlycharges) from customers 
where churn='Yes'

--payment method
select paymentmethod,count(*) from customers
where churn='Yes'
group by paymentmethod

--tenure below 12 months
select customerid from customers
where tenure < 12

--low tenure + churn
select * from customers
where tenure <12
and churn='Yes'

--tech support
select techsupport ,count(*) from customers
where churn='Yes'
group by techsupport

--online security impact
select onlinesecurity ,count(*) from customers
where churn='Yes'
group by onlinesecurity

--device protection
select deviceprotection,count(*) from customers
where churn='Yes'
group by deviceprotection

--churn percentage
SELECT ROUND(100.0*SUM(CASE WHEN churn='Yes'THEN 1 ELSE 0 END)/COUNT(*),2) AS churn_rate from customers


--top risky segment
select contract,sum(monthlycharges) from customers
where churn='Yes'
group by contract

--high value churn customers
select customerid,totalcharges from customers
where churn='Yes'
order by cast(totalcharges as float) desc

--retained customers
SELECT *
FROM customers
WHERE Churn='No';