create database supermarket_sales ;
use supermarket_sales ;

select *
from supermarket_sales ;

-- We may want to sort the product categories based on the total sales amounts.

select product_line as product_category,round(sum(total),2) as total_sales
from supermarket_sales
group by product_line
order by sum(total) desc ;

/* Food and beverages in the product category has maximum sales
We first select the columns and apply the aggregation.
The next step is to group the aggregated column by the product categories.
Finally, we sort the results in descending order based on the total sales amounts.*/


-- Count the number of purchases that belong to each cross category (customer type and gender).

select customer_type,gender,count(*) as total_purchase
from supermarket_sales
group by customer_type , gender;

/* Customer type member who is female has maximum purchase and male has mimimum.
The distribution is quite balanced with regards to the customer type and gender columns.*/


-- Calculate the average quantities of purchases with a total amount higher than 500 and for entire table

-- total > 500
select avg(quantity) as avg_quantity
from supermarket_sales
where total>500 ;

-- total for whole
select quantity,avg(quantity) as avg_quantity
from supermarket_sales;

/*The seven quantities have an average quantity of purchase at 5.5100 .
The condition is applied in the first query above. 
The second query returns the average quantity for the entire table.*/

-- Return all of the sales made between 2019–01–05 and 2019–11–11.

select *
from supermarket_sales
where date between "2019-01-05" and "2019-11-11";

/*The sales made between January to November of 2019 is maximum for normal customer type who 
is female and buys from home and lifestyle.
The ouput is between the dates mentioned */

-- Top 5 dates with the highest total sales amount.

select date, round(sum(total),2) as total_sales
from supermarket_sales
group by date
order by sum(total) desc
limit 5;

/* The top 5 dates are found on which sales is maximum-
'03-09-2019', 
'02-07-2019', 
'3/14/2019', 
'2/15/2019', 
'03-02-2019'

The querry returns the five dates on which total sales was more than rest of the days*/

-- Find the date of the sales with the maximum total amount. 

select date ,max(total) as max_amt
from supermarket_sales;

/* the date is 01-05-2019 and maximum amount is 1042.65 */

/*The dataset contains 3 branches of a supermarket chain.The customers are divided into two categories.
Find the average total sales amount for each cross category of these two columns.*/

select branch, customer_type, round(avg(total),2) as avg_total_sales
from supermarket_sales
group by branch, customer_type
order by avg(total) desc;

/* The average total sales of branch C is maximum at 337.66 */

-- Sort the product lines based on the total number of items sold in each category.

select product_line,count(quantity)  as total_items_sold
from supermarket_sales
group by product_line
order by count(quantity) desc;

/* Fashion accessories has maximum number of items sold */

/* Return the difference between the unit prices of the most expensive and the cheapest items
 in the health and beauty product line.*/
 
select product_line,round(max(unit_price) - min(unit_price),2) as diff_unit_price
from supermarket_sales
where product_line = "Health and beauty";
 
 /* The difference is 89.88 */
 
 -- Calculate the same difference for each product line
 
select product_line, round(max(unit_price) - min(unit_price),2) as diff
from supermarket_sales
group by product_line;

/* Health and beauty has a large difference */

