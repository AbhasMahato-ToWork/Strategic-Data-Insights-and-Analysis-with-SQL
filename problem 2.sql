/*2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/

SELECT Y.B as unique_product_2021, X.A as unique_product_2020, 
				round((((Y.B)-(X.A))*100)/(X.A),2) as percentage_chg
 FROM
((SELECT COUNT(distinct product_code) as A FROM gdb0041.fact_sales_monthly
WHERE fiscal_year = 2020) X,
(SELECT COUNT(distinct product_code) as B FROM gdb0041.fact_sales_monthly
WHERE fiscal_year = 2021) Y)