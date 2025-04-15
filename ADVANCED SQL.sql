CREATE TABLE top_rated_films(
  title VARCHAR NOT NULL,
  release_year SMALLINT
);

CREATE TABLE most_popular_films(
  title VARCHAR NOT NULL,
  release_year SMALLINT
);

INSERT INTO top_rated_films(title, release_year)
VALUES
   ('The Shawshank Redemption', 1994),
   ('The Godfather', 1972),
   ('The Dark Knight', 2008),
   ('12 Angry Men', 1957);

INSERT INTO most_popular_films(title, release_year)
VALUES
  ('An American Pickle', 2020),
  ('The Godfather', 1972),
  ('The Dark Knight', 2008),
  ('Greyhound', 2020);

SELECT * FROM top_rated_films;
SELECT * FROM most_popular_films;

--UNION
SELECT *
FROM top_rated_films
  UNION 
SELECT * 
FROM most_popular_films;

--UNION ALL
SELECT *
FROM top_rated_films
  UNION ALL
SELECT * 
FROM most_popular_films;

--EXCEPT
SELECT *
FROM top_rated_films
  EXCEPT 
SELECT * 
FROM most_popular_films;

--INTERSECT
SELECT *
FROM top_rated_films
  INTERSECT 
SELECT * 
FROM most_popular_films;


/*
WITH cte_name (column1, column2, ...) AS (
    -- CTE query
    SELECT ...
)
-- Main query using the CTE
SELECT ...
FROM cte_name;

In this syntax:

- WITH clause: Introduce the common table expression (CTE). It is followed by the name of the CTE and a list of column names in parentheses. The column list is optional and is only necessary if you want to explicitly define the columns for the CTE.
- CTE name: Specify the name of the CTE. The CTE name exists within the scope of the query. Ensure that the CTE name is unique within the query.
- Column List (optional): Specify the list of column names within the parentheses after the CTE name. If not specified, the columns implicitly inherit the column names from SELECT statement inside the CTE.
- AS keyword: The AS keyword indicates the beginning of the CTE definition.
- CTE query: This is a query that defines the CTE, which may include JOINs, WHERE, GROUP BY clauses, and other valid SQL constructs.
- Main query: After defining the CTE, you can reference it in the main query by its name. In the main query, you can use the CTE as if it were a regular table, simplifying the structure of complex queries.
*/

CREATE TABLE film (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    release_year INT,
    rental_rate NUMERIC,
    length INT
);

CREATE TABLE film_category (
    film_id INT,
    category VARCHAR(50),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

CREATE TABLE film_revenue (
    film_id INT,
    revenue NUMERIC,
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

INSERT INTO film (title, release_year, rental_rate, length) VALUES
('The Matrix', 1999, 4.99, 136),
('Inception', 2010, 3.99, 148),
('Titanic', 1997, 2.99, 195),
('The Godfather', 1972, 3.49, 175),
('Interstellar', 2014, 4.49, 169),
('The Notebook', 2004, 2.99, 123);

INSERT INTO film_category (film_id, category) VALUES
(1, 'Sci-Fi'),
(2, 'Sci-Fi'),
(3, 'Romance'),
(4, 'Crime'),
(5, 'Sci-Fi'),
(6, 'Romance');

INSERT INTO film_revenue (film_id, revenue) VALUES
(1, 200000.00),
(2, 180000.00),
(3, 250000.00),
(4, 150000.00),
(5, 220000.00),
(6, 120000.00);

SELECT * FROM film;

SELECT film_category;

--USING JOIN
SELECT fc.category, SUM(fr.revenue) AS Total_revenue
FROM film_category AS fc
LEFT JOIN film_revenue as fr
ON fc.film_id = fr.film_id
GROUP BY fc.category;

-- USING CTE
WITH cte_example AS (
SELECT *
FROM film_category AS fc
LEFT JOIN film_revenue as fr
ON fc.film_id = fr.film_id
)
SELECT category, SUM(revenue)
FROM cte_example
GROUP BY category;


--CLASSTASK
WITH cte_long (avg_len) AS(
SELECT AVG(length)
FROM film
)
 SELECT *
 FROM film, cte_long
 WHERE length > avg_len;

 CREATE TABLE desserts(
	date_sold date,
	product text,
	amount_sold int
 );
 
 INSERT INTO desserts
 VALUES('2022-06-01', 'Cake', 6),
 		('2022-06-01', 'Pie', 18),
 		('2022-06-02', 'Pie', 3),
 		('2022-06-02', 'Cake', 2),
 		('2022-06-03', 'Pie', 14),
 		('2022-06-03', 'Cake', 15),
 		('2022-06-04', 'Pie', 15),
 		('2022-06-04', 'Cake', 6),
 		('2022-06-05', 'Cake', 16),
 		('2022-06-05', 'Pie', NULL);

SELECT * FROM desserts;

SELECT *,
	CASE WHEN product = 'Cake' THEN COALESCE(amount_sold, 0)
	ELSE 0
	END cake_price,
	CASE WHEN product = 'Pie' THEN COALESCE(amount_sold, 0)
	ELSE 0
	END pie_price
FROM desserts;

CREATE VIEW cake_per_view AS(
SELECT *,
	CASE WHEN product = 'Cake' THEN COALESCE(amount_sold, 0)
	ELSE 0
	END cake_price,
	CASE WHEN product = 'Pie' THEN COALESCE(amount_sold, 0)
	ELSE 0
	END pie_price
FROM desserts
);

SELECT date_sold, SUM(cake_price) AS cake, SUM(pie_price) AS pie
FROM cake_per_view
GROUP BY date_sold;


SELECT 
   date_sold,
   abs(cake-pie) as difference,
   CASE WHEN cake > pie THEN 'Cake' ELSE 'Pie'
	 end AS sold_more
FROM (
  SELECT date_sold, SUM(cake_price) as cake,
  sum(pie_price) as pie
  FROM cake_per_view
  GROUP BY date_sold
)
ORDER BY date_sold;


		