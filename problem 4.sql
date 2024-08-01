/*4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

WITH cte1 as(SELECT p.segment, count(distinct p.product_code) as product_count_2020 
FROM dim_product p, fact_sales_monthly f
WHERE p.product_code = f.product_code
Group by p.segment, f.fiscal_year
Having f.fiscal_year =2020),

cte2 as(SELECT p.segment, count(distinct p.product_code) as product_count_2021 
	FROM dim_product p, fact_sales_monthly f
	WHERE p.product_code = f.product_code
	Group by p.segment, f.fiscal_year
	Having f.fiscal_year =2021)
SELECT a.segment,b.product_count_2021 ,a.product_count_2020 ,(b.product_count_2021-a.product_count_2020) as difference   from cte1 as a,cte2 as b
WHERE a.segment = b.segment