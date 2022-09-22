USE sakila;

-- In this lab, you will be using the Sakila database of movie rentals.

-- In order to optimize our inventory, we would like to know which films will be rented next month and we are asked to create a model to predict it.

-- Instructions
-- 1. Create a query or queries to extract the information you think may be relevant for building the prediction model. 
-- It should include some film features and some rental features. Use the data from 2005.
-- 2. Create a query to get the list of films and a boolean indicating if it was rented last month (August 2005). This would be our target variable.
-- 3. Read the data into a Pandas dataframe.
-- 4. Analyze extracted features and transform them. You may need to encode some categorical variables, or scale numerical variables.
-- 5. Create a logistic regression model to predict this variable from the cleaned data.
-- 6. Evaluate the results.

SELECT * FROM sakila.film;
SELECT * FROM sakila.inventory;
SELECT * FROM sakila.rental;
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.payment;

SELECT * FROM sakila.film f
JOIN sakila.inventory i USING (film_id)
JOIN sakila.rental fa USING (inventory_id)
JOIN sakila.film_category fc USING (film_id)
JOIN sakila.category c USING (category_id)
JOIN sakila.payment p USING (rental_id);

WHERE i.inventory_id = (SELECT i.inventory_id
					FROM(SELECT COUNT(inventory_id)
							FROM sakila.inventory);
                            GROUP BY actor_id
                            ORDER BY COUNT(film_id) DESC
                            LIMIT 1) sub1););

SELECT count(inventory_id) FROM sakila.rental;