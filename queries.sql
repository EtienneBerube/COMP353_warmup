-- Query 1: details of all the people who are associated with a GroupZone MontrealPrimaryGrade1_Group_1 
-- (first-name, last-name, date of birth, email, phone, city)
SELECT first_name, last_name, date_of_birth, email, telephone_number, city FROM Person
INNER JOIN Person_GroupZone AS pgz ON Person.id = pgz.person_id
INNER JOIN GroupZone AS gz ON pgz.group_zone_id = gz.id
WHERE gz.name ='MontrealPrimaryGrade1_Group_1';


-- Query 2: details of all the people who tested positive for the COVID-19 on January 10th, 2021
-- (first-name, last-name, date of birth, email, phone, city)
SELECT first_name, last_name, date_of_birth, email, telephone_number, city FROM Person 
INNER JOIN Diagnostic ON Person.id = Diagnostic.person_id
WHERE covid_19_positive = 1 AND test_date LIKE "2020-01-10%";

	
-- Query 3: details of the diagnosis of the people who live at 95 Robert St. 
-- (firstname, last-name, date of birth, email, phone, date of diagnosis, test result, Include the history of the diagnosis if a person have been tested more than once)
SELECT first_name, last_name, date_of_birth, email, telephone_number, result_date, covid_19_positive FROM Person
INNER JOIN Diagnostic ON Person.ID = Diagnostic.person_id	
WHERE address = "95 Robert St.";
	

-- Query 4: all the people who live with Roger Macdonald (firstname, last-name, date of birth, email, phone)
SELECT first_name, last_name, date_of_birth, email, telephone_number FROM Person 
WHERE address =(SELECT address FROM Person 
				WHERE first_name='Roger' AND last_name='Macdonald'
				LIMIT 1);


-- Query 5:  all the people who are members of the same GroupZones of Roger Macdonald 
-- (If he is a member of more than on GroupZone, give the name of each GroupZone and the list of people in that SPECIFIC GroupZone)
WITH
  roger_gz AS (Select pgz.group_zone_id 
                FROM Person 
                INNER JOIN Person_GroupZone AS pgz ON Person.id = pgz.person_id
                where first_name = 'Roger' AND last_name='Macdonald')
SELECT gz.name, first_name, last_name
FROM Person
INNER JOIN Person_GroupZone AS pgz ON Person.id = pgz.person_id
INNER JOIN GroupZone AS gz ON pgz.group_zone_id = gz.id
WHERE gz.id IN (SELECT * FROM roger_gz);


-- Query 6: all Public Health Workers who work in Viau Public Health Center (first-name, last-name, date of birth, email, phone, city)
SELECT first_name, last_name, date_of_birth, email, telephone_number FROM PublicHealthWorker
WHERE center_id = (SELECT id FROM PublicHealthCenter 
					WHERE name = 'Viau Public Health Center'
					LIMIT 1);


-- Counts for all Relations
SELECT COUNT(*) FROM Person;
SELECT COUNT(*) FROM GroupZone;
SELECT COUNT(*) FROM Person_GroupZone;
SELECT COUNT(*) FROM PublicHealthCenter;
SELECT COUNT(*) FROM PublicHealthWorker;
SELECT COUNT(*) FROM Diagnostic;	