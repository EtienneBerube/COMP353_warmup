-- Query 1: details of all the people who are associated with a GroupZone MontrealPrimaryGrade1_Group_1 (first-name, last-name, date of birth, email, phone, city)
SELECT first_name, last_name, date_of_birth, email, telephone_number, city FROM Person WHERE id = (SELECT person_id From Person_GroupZone where group_zone_id = (SELECT id From GroupZone where name ='MontrealPrimaryGrade1_Group_1'))


-- Query 2: details (first-name, last-name, date of birth, email, phone, city) of all the people who tested positive for the COVID-19 on January 10th, 2021
SELECT first_name, last_name, date_of_birth, email, telephone_number, city FROM Person WHERE id = (SELECT person_id FROM Diagnostic WHERE covid_19_positive = 1 AND (test_date LIKE "2020-01-10%"))


-- Query 3: details of the diagnosis of the people who live at 95 Robert St. (firstname, last-name, date of birth, email, phone, date of diagnosis, test result, Include the history of the diagnosis if a person have been tested more than once)
SELECT (SELECT id from Person where address = "95 Robert St.")

-- Query 4: all the people who live with Roger Macdonald (firstname, last-name, date of birth, email, phone)
SELECT ( SELECT id FROM Person WHERE first_name='Doug') AS person_id

-- Query 5:  all the people who are members of the same GroupZones of Roger Macdonald (If he is a member of more than on GroupZone, give the name of each GroupZone and the list of people in that SPECIFIC GroupZone)
SELECT ( SELECT id FROM Person WHERE first_name='Doug') AS person_id

-- Query 6: all Public Health Workers who work in Viau Public Health Center (first-name, last-name, date of birth, email, phone, city)
SELECT ( SELECT id FROM Person WHERE first_name='Doug') AS person_id

