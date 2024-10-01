
SELECT * FROM us_project.us_household_income_statistics;


SELECT * FROM us_project.us_household_income;

SELECT id, COUNT(id)
FROM us_project.us_household_income
GROUP BY id
HAVING COUNT(id) > 1
;

SELECT *
FROM(
SELECT row_id,
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM us_project.us_household_income
) duplicates
WHERE row_num > 1
;


DELETE FROM us_project.us_household_income
WHERE row_id IN(
	SELECT row_id
	FROM(
		SELECT row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM us_project.us_household_income
		) duplicates
	WHERE row_num > 1)
;

Select DISTINCT State_Name
FROM us_project.us_household_income
ORDER BY 1
;

UPDATE us_project.us_household_income
SET State_Name = 'Georgia'
WHERE State_Name ='georia';

UPDATE us_project.us_household_income
SET State_Name = 'Alabama'
WHERE State_Name ='alabama';

Select DISTINCT State_ab
FROM us_project.us_household_income
ORDER BY 1
;

Select *
FROM us_project.us_household_income
WHERE Place =''
ORDER BY 1
;
UPDATE us_project.us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'
;

Select Type, COUNT(Type)
FROM us_project.us_household_income
GROUP BY TYPE
#RDER BY 1
;

UPDATE us_project.us_household_income
SET Type = 'Borough'
WHERE Type ='Boroughs'
;

Select ALand, AWater
FROM us_project.us_household_income
WHERE(Awater ='' OR Awater = 0  OR Awater IS NULL)
AND (ALand = '' OR ALand = 0 OR ALand iS NULL)
;


