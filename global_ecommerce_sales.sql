select * from global_ecommerce_sales;

-- 1. total profit as per product category
select Product_Category,sum(Profit) as profit_prod_category from global_ecommerce_sales
group by Product_Category
order by Product_Category desc;

-- 2. total sales as per region
select Region,sum(Total_Sales) as Total_Sales_Region
from global_ecommerce_sales
group by Region
order by Total_Sales_Region desc;

-- 3. sales as per product category 
select Product_Category, SUM(Total_Sales) as total_sales_category
from global_ecommerce_sales
group by Product_Category
order by total_sales_category desc;

-- 4. counting customers based on customer segment
select Customer_Segment,count(distinct Customer_Name) as number_of_customer
from global_ecommerce_sales
group by Customer_Segment
order by number_of_customer desc;

-- 5. profitable customer segment
select Customer_Segment,sum(Profit) as customer_profit
from global_ecommerce_sales
group by Customer_Segment;

-- 6. monthly sales trend
select date_format(Order_Date, '%Y-%m') as month_year, sum(Total_Sales) as total_sales
from global_ecommerce_sales
group by month_year
order by month_year;


-- 7. quantity of products sold
select Region, sum(Shipping_Cost) as total_shipping
from global_ecommerce_sales
group by Region
order by total_shipping desc;

-- 9. customer segment ordering the type of product category
select Customer_Segment,Product_Category, count(Product_Category) as products_brought, sum(Total_Sales) as sales
from global_ecommerce_sales
group by Customer_Segment,Product_Category
order by sales desc;

-- 10. Top 10 customers
select Customer_Name, sum(Total_Sales) as total_spent
from global_ecommerce_sales
group by Customer_Name
order by total_spent desc
limit 10;

-- 11. Best performing region by profit
select Region, sum(Profit) as profit
from global_ecommerce_sales
group by Region
order by profit desc;