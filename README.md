# US_Household_Income


## Data Cleaning Project

This project involves cleaning and standardizing the US Household Income dataset to ensure data accuracy and consistency. The cleaning process was performed using SQL and involved several key steps:

1. **Column Renaming**: The column ï»¿id in the us_household_income_statistics table was renamed to id to correct encoding issues.

2. **Duplicate Removal**: The us_household_income table contained six duplicate records, identified using the COUNT(id) function. These duplicates were removed using ROW_NUMBER() to retain only the first occurrence.

3. **State Name Standardization**: Inconsistent state names (georia instead of Georgia and alabama instead of Alabama) were corrected to maintain uniformity.

4. **Validation of State Abbreviations**: A check was performed to ensure that all state abbreviations matched their corresponding state names, with no issues found.

5. **Place Name Corrections**: Missing values in the Place column were identified and corrected by referencing their respective County and City fields.

6. **Correction of Misclassified Types**: The Type column contained an incorrect value (Boroughs instead of Borough), which was updated for consistency.

7. **Numerical Column Checks**: The ALand and AWater columns were analyzed for zeroes, NULLs, and blanks, but no significant issues were found.

8. **Duplicate Check in us_household_income_statistics**: No duplicates were found in the us_household_income_statistics table.

This structured data-cleaning process ensured a clean and reliable dataset for analysis. The full SQL scripts used for these operations are included in this repository. 🚀


---------------------------
