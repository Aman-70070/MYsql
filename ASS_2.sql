CREATE DATABASE ASS_2
USE ASS_2
SELECT * FROM Jomato

Tasks to be performed:

1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
Chicken Bites’.

CREATE FUNCTION quickchickenbites(o Chicken VARCHAR(255)) RETURNS VARCHAR(255)
AS BEGIN RETURN CONCAT('Quick', o Chicken,'Bites')END; 


2. Use the function to display the restaurant name and cuisine type which has the
maximum number of rating.

SELECT restaurantname as resturant_name, cuisinestype as cuisine_type 
FROM Jomato
WHERE rating=(SELECT MAX(rating) FROM Jomato)


3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
start rating, ‘Good’ if it has above 3.5 and below 4 star rating, ‘Average’ if it is above 3
and below 3.5 and ‘Bad’ if it is below 3 star rating and

SELECT
    CASE
        WHEN rating > 4 THEN 'Excellent'
        WHEN rating > 3.5 AND rating <= 4 THEN 'Good'
        WHEN rating > 3 AND rating <= 3.5 THEN 'Average'
        ELSE 'Bad'
    END AS Rating_Status
FROM Jomato

4. Find the Ceil, floor and absolute values of the rating column and display the current
date and separately display the year, month_name and day.

SELECT 
    CEILING(rating) AS Ceil_Rating,
    FLOOR(rating) AS Floor_Rating,
    ABS(rating) AS Absolute_Rating,
    GETDATE() AS CurrentDate,
    YEAR(GETDATE()) AS Year,
    MONTHNAME(DATENAME()) AS Month_Name,
    DAYOFMONTH(getdate()) AS Day,
	FROM Jomato

5. Display the restaurant type and total average cost using rollup.

SELECT Restaurant_type,AVG(total_cost) AS average_cost
FROM Jomato
GROUP BY Restaurant_type WITH ROLLUP
