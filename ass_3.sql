CREATE DATABASE ASS_3
USE ASS_3
SELECT * FROM Jomato

Tasks to be performed:

1. Create a stored procedure to display the restaurant name, type and cuisine where the
table booking is not zero.

CREATE PROCEDURE sp_get_restaurants_with_booking()
AS BEGIN 
SELECT restaurant_name,restaurant_type, cuisine_type
from jomato
where table_booking>0;
end;

2. Create a transaction and update the cuisine type �Cafe� to �Cafeteria�. Check the result
and rollback it.

BEGIN TRANSACTION 
UPDATE Jomato
SET cuisine_type = 'Cafeteria'
WHERE cuisine_type = 'Cafe'

SELECT * FROM Jomato

ROLLBACK TRANSACTION; 


3. Generate a row number column and find the top 5 areas with the highest rating of
restaurants.

WITH RankedRestaurants 
AS (SELECT area, rating,ROW_NUMBER() OVER (PARTITION BY area ORDER BY rating DESC) AS rank
 FROM Jomato)
SELECT area, rating
FROM RankedRestaurants
WHERE rank <= 5;

4. Use the while loop to display the 1 to 50.

DECLARE @i INT=1;
WHILE @i<=50
BEGIN SELECT @i;
SET @i=@i+1;    
END;

5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
restaurants.

CREATE VIEW TopRatingView AS
SELECT TOP 5 * 
FROM Jomato
ORDER BY Rating DESC;

6. Create a trigger that give an message whenever a new record is inserted.CREATE TRIGGER trg_restaurants_insert on jomatoafter insertas begin select 'a new restaurant has been inserted'end;