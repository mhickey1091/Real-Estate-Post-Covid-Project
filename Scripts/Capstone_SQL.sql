-- This is creating a new table from python CSV

CREATE TABLE matches (year integer, state text, homes_sold integer, prev_year_sold integer, sold_yoy_percent integer)


-- This is to find the number of homes sold per state per year.

SELECT year, 
		state, 
		sum(homes_sold) as homes_sold
FROM realpop
GROUP BY 1,2
ORDER BY year;

-----------------------------------


-- This is to get top 5 states with their average percentage growth from after the peak of 2021.

SELECT state,
		AVG(sold_yoy_percent::numeric) AS avg_yoy_percent_change
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL AND year > 2021
GROUP BY state
ORDER BY avg_yoy_percent_change
LIMIT 5;

-- This is to get bottom 5 states with their average percentage growth from after the peak of 2021.

SELECT state,
		AVG(sold_yoy_percent::numeric) AS avg_yoy_percent_change
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL AND year > 2021
GROUP BY state
ORDER BY avg_yoy_percent_change desc
LIMIT 5;

-- This is to get all states with their average percentage growth from after the peak of 2021.

SELECT state,
		year,
		sold_yoy_percent::numeric AS yoy_percent_change
FROM homes_sold
WHERE sold_yoy_percent IS NOT NULL AND year > 2020
ORDER BY state, year





