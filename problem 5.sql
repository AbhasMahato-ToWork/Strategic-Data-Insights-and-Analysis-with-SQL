/*5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost*/

SELECT f.product_code ,p.product, f.manufacturing_cost
FROM dim_product p JOIN fact_manufacturing_cost f
ON p.product_code= f.product_code
WHERE manufacturing_cost IN (
	(select max(manufacturing_cost) from fact_manufacturing_cost)
    UNION
    (select min(manufacturing_cost) from fact_manufacturing_cost)) 
ORDER BY manufacturing_cost DESC;