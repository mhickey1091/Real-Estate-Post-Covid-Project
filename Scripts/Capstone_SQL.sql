-- This is creating a new table from python CSV

CREATE TABLE matches (year integer, state text, homes_sold integer, prev_year_sold integer, sold_yoy_percent integer)


-- This is to find the number of homes sold per state per year.

SELECT year, 
		state, 
		sum(homes_sold) as homes_sold,
FROM realpop
GROUP BY 1,2
ORDER BY year;


-- This is how I am finding the top 5 states by year over year sales and bottom 5 as well. 

WITH year_ranks AS (SELECT *,
	RANK() OVER(PARTITION BY year ORDER BY sold_yoy_percent DESC)
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL)
--
SELECT *
FROM year_ranks
WHERE rank BETWEEN 1 AND 5;

--------------------------------------------

WITH year_ranks AS (SELECT *,
	RANK() OVER(PARTITION BY year ORDER BY sold_yoy_percent)
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL)
--
SELECT *
FROM year_ranks
WHERE rank BETWEEN 1 AND 5;


--------------------------------------------

-- This is to get top 5 over 2022-2024

WITH overall_rank AS (WITH year_ranks AS (SELECT *,
	RANK() OVER(PARTITION BY year ORDER BY sold_yoy_percent DESC)
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL AND year BETWEEN 2022 AND 2024)
--
SELECT *
FROM year_ranks)
--
SELECT state, round(avg(rank),2) as avg_rank
FROM overall_rank
GROUP BY 1
ORDER BY avg_rank
LIMIT 5

-- This is to get bottom 5 over 2022-2024

WITH overall_rank AS (WITH year_ranks AS (SELECT *,
	RANK() OVER(PARTITION BY year ORDER BY sold_yoy_percent DESC)
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL AND year BETWEEN 2022 AND 2024)
--
SELECT *
FROM year_ranks)
--
SELECT state, round(avg(rank),2) as avg_rank
FROM overall_rank
GROUP BY 1
ORDER BY avg_rank desc
Limit 5

--------------------------------------------

-- This is to get the top 5 with their average percentage growth from 2020-2024

SELECT state, ROUND(AVG(sold_yoy_percent::integer),2) as avg
FROM homes_sold
WHERE state IN (WITH overall_rank AS (WITH year_ranks AS (SELECT *,
	RANK() OVER(PARTITION BY year ORDER BY sold_yoy_percent DESC)
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL AND year BETWEEN 2020 AND 2024)
--
SELECT *
FROM year_ranks)
--
SELECT state
FROM overall_rank
GROUP BY 1
ORDER BY avg(rank)
LIMIT 5) AND year BETWEEN 2020 AND 2024
GROUP BY state
ORDER BY avg desc;


-- This is to get bottom 5 with their average percentage growth from 2022-2024

SELECT state, ROUND(AVG(sold_yoy_percent::integer),2) as avg
FROM homes_sold
WHERE state IN (WITH overall_rank AS (WITH year_ranks AS (SELECT *,
	RANK() OVER(PARTITION BY year ORDER BY sold_yoy_percent DESC)
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL AND year BETWEEN 2020 AND 2024)
--
SELECT *
FROM year_ranks)
--
SELECT state
FROM overall_rank
GROUP BY 1
ORDER BY avg(rank) desc
Limit 5) AND year BETWEEN 2020 AND 2024
GROUP BY state
ORDER BY avg;

-----------------------------------

-- SANITY CHECK TOP

SELECT *
FROM homes_sold
WHERE state IN (WITH overall_rank AS (WITH year_ranks AS (SELECT *,
	RANK() OVER(PARTITION BY year ORDER BY sold_yoy_percent DESC)
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL AND year BETWEEN 2020 AND 2024)
--
SELECT *
FROM year_ranks)
--
SELECT state
FROM overall_rank
GROUP BY 1
ORDER BY avg(rank)
LIMIT 5) AND year BETWEEN 2020 AND 2024
ORDER BY state;

-- SANITY CHECK BOTTOM

SELECT *
FROM homes_sold
WHERE state IN (WITH overall_rank AS (WITH year_ranks AS (SELECT *,
	RANK() OVER(PARTITION BY year ORDER BY sold_yoy_percent DESC)
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL AND year BETWEEN 2020 AND 2024)
--
SELECT *
FROM year_ranks)
--
SELECT state
FROM overall_rank
GROUP BY 1
ORDER BY avg(rank) desc
Limit 5) AND year BETWEEN 2020 AND 2024
ORDER BY state;
