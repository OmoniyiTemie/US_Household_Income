# US Household Income EDA



SELECT *
FROM us_household_income
;

SELECT * 
FROM us_project.us_household_income_statistics;



										# Investigating the LandMass and Area of Water by State (Personal Curiosity)
                                        
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY SUM(ALand) DESC
;

SELECT State_Name, SUM(AWater), SUM(ALand)
FROM us_household_income
GROUP BY State_Name
ORDER BY SUM(AWater) DESC
;



											# HOUSEHOLD INCOME ANALYSIS
                                            
# Joining both tables together:

SELECT *
FROM us_household_income T1
INNER JOIN us_household_income_statistics T2
	ON T1.id = T2.id
WHERE Mean <> 0;


SELECT T1.State_Name, County, Type, `Primary`, Mean, Median
FROM us_household_income T1
INNER JOIN us_household_income_statistics T2
	ON T1.id = T2.id
WHERE Mean <> 0;
;


SELECT T1.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income T1
INNER JOIN us_household_income_statistics T2
	ON T1.id = T2.id
WHERE Mean <> 0
GROUP BY T1.State_Name
ORDER BY 2 DESC		# Checked for 'ASC' as well
;
# States with high costs of living appear to have the highest Average Household Income 


SELECT T1.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income T1
INNER JOIN us_household_income_statistics T2
	ON T1.id = T2.id
WHERE Mean <> 0
GROUP BY T1.State_Name
ORDER BY 3 DESC		# Checked for 'ASC' as well
;



# By "Type"

SELECT Type, COUNT(Type), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income T1
INNER JOIN us_household_income_statistics T2
	ON T1.id = T2.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 3 DESC
;


# Some 'Type' do not have enough representation in the dataset. 
# Filtering: Arbitrarily using 100 as the yardstick/threshold

SELECT Type, COUNT(Type), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income T1
INNER JOIN us_household_income_statistics T2
	ON T1.id = T2.id
WHERE Mean <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
;


# Investigating for ALABAMA by City

SELECT T1.State_Name, City, ROUND(AVG(Mean),1)
FROM us_household_income T1
JOIN us_household_income_statistics T2
	ON T1.id = T2.id
WHERE Mean <> 0
AND T1.State_Name = 'Alabama'
GROUP BY T1.State_Name, City
ORDER BY ROUND(AVG(Mean), 1) DESC
;



