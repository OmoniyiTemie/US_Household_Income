# US Household Income Data Cleaning


SELECT *
FROM us_household_income
;

ALTER TABLE us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id`
;

SELECT * 
FROM us_project.us_household_income_statistics;




# Checking number of observations both tables:

SELECT COUNT(id)
FROM us_project.us_household_income;

SELECT COUNT(id)
FROM us_project.us_household_income_statistics;




#----------------------------------------------------------------------------------------------------------------------------
									# For "US_HOUSEHOLD_INCOME" Table
#----------------------------------------------------------------------------------------------------------------------------


										# Checking for duplicates:


SELECT id, 
	   COUNT(id)
FROM us_project.us_household_income
GROUP BY id
HAVING COUNT(id) > 1
;

# It appears that there are six duplicates. Deleting them:



DELETE FROM us_household_income
WHERE row_id IN (
				SELECT row_id
				FROM    (
						SELECT row_id, id,
						ROW_NUMBER() OVER(PARTITION BY  id ORDER BY id) AS row_num
						FROM us_project.us_household_income
						) AS duplicates
                        
			     WHERE row_num > 1
                 )
;


# Checking:

				SELECT row_id
				FROM    (
						SELECT row_id, id,
						ROW_NUMBER() OVER(PARTITION BY  id ORDER BY id) AS row_num
						FROM us_project.us_household_income
						) AS duplicates
                        
			     WHERE row_num > 1
;
# DUPLICATES REMOVED!!




										# Checking the "State_Name" Column

SELECT DISTINCT State_Name
FROM us_household_income
;

UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia'
;

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;


# Checking:

SELECT DISTINCT State_Name
FROM us_household_income
;

# FIXED!!


										# Checking the "State_ab" Column

SELECT DISTINCT State_Name, State_ab
FROM us_household_income
;

# No issues discovered


										# Checking the "Place" Column

SELECT *
FROM us_household_income
WHERE Place = ''
;


UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'
;

# FIXED!!


										# Checking the "Type" Column

SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY Type
;

# 'Borough' was wrongly entered as 'Boroughs' in one of the rows. Updating:

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;



										# Checking the Numerical Columns "ALand" & "AWater" Column
                                        
# Zeroes, NULLs and Blanks:
                                        
SELECT id, Aland, AWater
FROM us_household_income
WHERE AWater = 0 OR AWater = '' OR AWater = NULL
;

SELECT id, Aland, AWater
FROM us_household_income
WHERE ALand= 0 OR ALand = '' OR ALand = NULL
;

# Nothing of particular interest




#----------------------------------------------------------------------------------------------------------------------------
									# For "US_HOUSEHOLD_INCOME_STATISTICS" Table
#----------------------------------------------------------------------------------------------------------------------------


# Checking for duplicates:


SELECT id, 
	   COUNT(id)
FROM us_project.us_household_income_statistics
GROUP BY id
HAVING COUNT(id) > 1
;

# It appears that there are NO duplicates. 










