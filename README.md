# From Surge to Slowdown: A Five-Year Lookback at America's Housing Market by State

## Power BI Dashboard
Link: https://app.powerbi.com/view?r=eyJrIjoiYzcyMzg0MDYtNGQ2NC00NWU5LWFiZDUtMWVhZDYzMTI1NmVjIiwidCI6IjEwMWRhNTg3LTE4NDMtNGY1Mi04YjhhLTE3YjA2OWM2NmQzMyIsImMiOjJ9



## Table of Contents
* [Power BI Dashboard](#PowerBI-dashboard)
* [Motivation](#motivation)
* [Questions](#questions)
* [Normalizing the Data](#normaling-the-data)
* [Challenges](#challenges)
* [Technologies Used](#technologies-used)
* [Sources](#sources)
* [Conclusion](#conclusion)

## Motivation:
With a strong interest in residential real estate, I've always paid close attention to market conditions in my local area—whether it's price trends, shifts in demand, or changes in inventory. For this project, it was exciting to zoom out and analyze the data on a national scale, especially given how dramatic the last five years have been. From pandemic-driven price surges to sharp cooldowns in certain states, the data tells a fascinating story. This project allowed me to combine my curiosity about real estate with data analysis and explore how markets across the country reacted during one of the most volatile housing periods in recent history.

## Questions:
1) Which states had the most and least home sales per 100,000 people?
2) Which States Saw the Sharpest Decline in Home Sales After the 2021 Peak?
3) Which markets were the most stable, and which showed the most volatility?
4) Which markets had sales with the shortest Time on Market?

## Normalizing the Data
The two main datasets I worked with covered different time spans, so one of the first steps was filtering and normalizing the real estate sales data to focus only on the most recent five years (2020-2024). To make meaningful state-to-state comparisons, I brought in U.S. Census population estimates and calculated per capita sales metrics. This helped account for population differences and allowed for a more accurate analysis of real estate activity across states.

## Challenges
One of the key challenges in this project was working with datasets that spanned different years and formats. Merging these required significant cleaning and transformation to ensure consistency and accuracy across time periods. Some data fields were missing or labeled inconsistently, which had to be standardized before meaningful analysis could take place. Additionally, using DAX in Power BI was essential for creating custom calculations-such as per capita metrics and year-over-year comparisons-to bring the cleaned data to life visually and analytically.

## Technologies Used
1) Python / Pandas / Jupyter Notebooks - For deeper analysis, calculations, and data transformations
2) Power BI - for creating interactive dashboard
3) SQL (PostgreSQL) - To query, filter, and aggregate datasets efficiently
4) Git - for version control

## Data Sources
To answer the above questions I used the following sources to collect datasets for my analysis

State-Level Real Estate Sales Data from 2012-2024.

https://www.redfin.com/news/data-center/

U.S. Census Population Estimates by State from 2020-2024.

https://www.census.gov/data/tables/time-series/demo/popest/2020s-state-total.html

## Conclusion
The analysis revealed clear differences in real estate market activity when adjusted for population. Over the past five years, the top five states with the highest home sales per capita were Florida, Idaho, Arizona, North Carolina, and Nevada. These states consistently showed strong demand, likely driven by factors such as population growth, migration patterns, and relatively affordable housing options during key periods of the market.

On the other end of the spectrum, New Mexico, North Dakota, West Virginia, Mississippi, and New York had the lowest sales per capita. These states may have faced challenges such as slower population growth, economic stagnation, or affordability barriers.

By focusing on per capita sales, this analysis offers a more balanced view of real estate activity across the U.S., helping to highlight not just the biggest markets, but the most active ones relative to their size.
