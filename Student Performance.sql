-- Importing the dataset into SQL database
SELECT *
FROM Student

---Checking for the Null Values in the dataset
SELECT * 
FROM Student
WHERE StudentID IS NULL OR Age IS NULL OR Gender IS NULL OR Ethnicity IS NULL OR ParentalEducation IS NULL OR StudyTimeWeekly IS NULL OR
Absences IS NULL OR Tutoring IS NULL OR ParentalSupport IS NULL OR Extracurricular IS NULL OR Sports IS NULL OR
Music IS NULL OR Volunteering IS NULL OR GPA IS NULL OR GradeClass IS NULL;

---Checking for the number of rows
SELECT COUNT (*) AS row_num
FROM Student

---Number of columns
SELECT COUNT (*) AS col_num
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME ='Student'

---Rounding up the decimal numbers to 2 decimal values
SELECT 
    StudyTimeWeekly,
    ROUND(StudyTimeWeekly, 2) AS rounded_price
FROM 
    Student;
UPDATE 
    Student
SET 
    StudyTimeWeekly = ROUND(StudyTimeWeekly, 2);

UPDATE 
    Student
SET 
    GPA = ROUND(GPA, 2);

---Checking for the Max & Min Values for both Studytimeweekly & GPA
SELECT MAX (StudyTimeWeekly) AS Max_StudyTime, MIN (StudyTimeWeekly) AS Min_StudyTime
FROM Student

SELECT MAX (GPA) AS Max_GPA, MIN (GPA) AS Min_GPA
FROM Student

-- Change the data type of the column to VARCHAR
ALTER TABLE Student
	ALTER COLUMN Gender VARCHAR(10);

UPDATE Student
SET Gender= CASE 
                 WHEN Gender = 0 THEN 'Male'
                   WHEN Gender = 1 THEN 'Female'
                  END;
ALTER TABLE Student
	ALTER COLUMN Ethnicity VARCHAR (20);

UPDATE Student
	SET Ethnicity= CASE 
                 WHEN Ethnicity = 0 THEN 'Caucasian'
                   WHEN Ethnicity = 1 THEN 'African American'
				   WHEN Ethnicity = 2 THEN 'Asian'
				   WHEN Ethnicity = 3 THEN 'Other'
                  END;

ALTER TABLE Student
	ALTER COLUMN ParentalEducation VARCHAR (30);

UPDATE Student
SET ParentalEducation= CASE 
                 WHEN ParentalEducation = 0 THEN 'None'
                   WHEN ParentalEducation = 1 THEN 'High School'
				   WHEN ParentalEducation = 2 THEN 'Some College'
				   WHEN ParentalEducation = 3 THEN 'Bachelor'
				   WHEN ParentalEducation = 4 THEN  'Higher'
                  END;

ALTER TABLE Student
	ALTER COLUMN Tutoring VARCHAR (10);

UPDATE Student
SET Tutoring= CASE 
                 WHEN Tutoring = 0 THEN 'No'
                   WHEN Tutoring = 1 THEN 'Yes'
                  END;

ALTER TABLE Student
	ALTER COLUMN ParentalSupport VARCHAR (30);

UPDATE Student
SET ParentalSupport= CASE 
                 WHEN ParentalSupport = 0 THEN 'None'
                   WHEN ParentalSupport = 1 THEN 'Low'
				   WHEN ParentalSupport = 2 THEN 'Moderate'
				   WHEN ParentalSupport = 3 THEN 'High'
				   WHEN ParentalSupport = 4 THEN  'VeryHigh'
                  END;

ALTER TABLE Student
	ALTER COLUMN Extracurricular VARCHAR(10);

UPDATE Student
SET Extracurricular= CASE 
                 WHEN Extracurricular = 0 THEN 'No'
                   WHEN Extracurricular = 1 THEN 'Yes'
                  END;

ALTER TABLE Student
	ALTER COLUMN Sports VARCHAR(10);

UPDATE Student
SET Sports = CASE 
                 WHEN Sports = 0 THEN 'No'
                   WHEN Sports = 1 THEN 'Yes'
                  END;

ALTER TABLE Student
	ALTER COLUMN Music VARCHAR(10);

UPDATE Student
SET Music = CASE 
                 WHEN Music = 0 THEN 'No'
                   WHEN Music = 1 THEN 'Yes'
                  END;

ALTER TABLE Student
	ALTER COLUMN Volunteering VARCHAR(10);

UPDATE Student
SET Volunteering = CASE 
                 WHEN Volunteering = 0 THEN 'No'
                   WHEN Volunteering = 1 THEN 'Yes'
                  END;

ALTER TABLE Student
	ALTER COLUMN GradeClass VARCHAR (30);

UPDATE Student
SET GradeClass= CASE 
                 WHEN GradeClass = 0 THEN 'A'
                   WHEN GradeClass = 1 THEN 'B'
				   WHEN GradeClass = 2 THEN 'C'
				   WHEN GradeClass = 3 THEN 'D'
				   WHEN GradeClass = 4 THEN  'F'
                  END;

--- How does parental education level impact students' GPA?
SELECT ParentalEducation, AVG(GPA) AS Average_GPA
FROM Student
GROUP BY ParentalEducation
ORDER BY Average_GPA;

---What is the relationship between the amount of weekly study time and students' GPA?
SELECT StudyTimeWeekly, AVG(GPA) AS Average_GPA
FROM Student
GROUP BY StudyTimeWeekly
ORDER BY Average_GPA;

---The correlation between studytimeweekly & GPA
SELECT 
    (SUM(StudyTimeWeekly * GPA) - SUM(StudyTimeWeekly) * SUM(GPA) / COUNT(*)) / 
    (SQRT((SUM(StudyTimeWeekly * StudyTimeWeekly) - SUM(StudyTimeWeekly) * SUM(StudyTimeWeekly) / COUNT(*)) * 
    (SUM(GPA * GPA) - SUM(GPA) * SUM(GPA) / COUNT(*)))) AS correlation
FROM student;

---Does participation in extracurricular activities influence students' academic performance?

SELECT Extracurricular, AVG(GPA) AS Average_GPA
FROM Student
GROUP BY Extracurricular
ORDER BY Average_GPA;

---How do absences affect students' GPA?
SELECT Absences, AVG(GPA) AS Average_GPA
FROM Student
GROUP BY Absences
ORDER BY Average_GPA;

---Is there a difference in academic performance (GPA) among students of different ethnic backgrounds?
SELECT Ethnicity, AVG(GPA) AS avg_GPA
FROM student
GROUP BY Ethnicity
ORDER BY avg_GPA;

---What is the effect of tutoring and parental support on students' GPA?
SELECT Tutoring, ParentalSupport, AVG(GPA) AS Average_GPA
FROM Student
GROUP BY Tutoring, ParentalSupport
ORDER BY Tutoring;


---How does gender influence academic performance?
SELECT Gender, AVG(GPA) AS Average_GPA
FROM Student
GROUP BY Gender;

---What is the relationship between students' involvement in sports and their GPA?
SELECT Sports, AVG(GPA) AS Average_GPA
FROM Student
GROUP BY Sports;



SELECT 
    Sports, 
    AVG(GPA) AS avg_GPA,
    COUNT(*) AS count_students
FROM student
GROUP BY Sports;


