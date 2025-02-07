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

This structured data-cleaning process ensured a clean and reliable dataset for analysis. The full SQL scripts used for these operations are included in this repository. 


---------------------------


## Exploratory Data Analysis

This project explores and analyzes the US Household Income dataset to uncover trends in household income, landmass, and other key attributes across different states, counties, and city types. The analysis was conducted using SQL and involved several key steps:

1. **Landmass and Water Area Analysis**: Calculated the total land area (ALand) and water area (AWater) for each state. Identified states with the largest land and water areas using aggregate functions (SUM()) and sorting results in descending order.
   
2. **Household Income Analysis**:
   - Joined the us_household_income and us_household_income_statistics tables using an INNER JOIN to combine geographical and income-related data.
   - Filtered out records where Mean household income is 0 to ensure meaningful analysis.
   - Analyzed household income at different levels:
        By State: Calculated the average mean and median income for each state, sorting results to identify states with the highest incomes.
        By Type: Examined how different geographical types (e.g., cities, boroughs, towns) affect income levels.
        Applied a threshold filter (100+ records per type) to ensure a fair representation of data.
     
3. **City-Level Income Analysis for Alabama**: Focused on Alabama’s cities, calculating the average household income by city to identify high-income areas.

   
### Key Insights
- States with a high cost of living tend to have higher average household incomes.
- Certain geographical types have significantly higher incomes than others, but some types have limited representation in the dataset.
- The distribution of household income varies widely by city and state, reflecting regional economic differences.

This EDA process helped uncover meaningful patterns in US household income distribution. The full SQL scripts used for this analysis are included in this repository. 
