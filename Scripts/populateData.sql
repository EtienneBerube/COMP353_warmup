INSERT INTO Person(first_name, last_name, date_of_birth, medicare_number, telephone_number, address, city, province, postal_code, citizenship, email)
VALUES ('Bob', 'Mckenzie', '1953-04-18 6:09:43', 1234567890, '8002672001', '24 Sussex Drive', 'Ottawa', 'Ontario', 'K1M1M4', 'Canadian', 'bob@bobndoug.ca' ),
 ('Doug', 'Mckenzie', '1949-05-20 7:10:44', 111111, '6139416900', '24 Sussex Drive', 'Ottawa', 'Ontario', 'K1M1M4', 'Canadian', 'doug@bobndoug.ca'),
 ('William', 'Shatner', '1931-03-22 8:11:45', 222222, '1234567890', '4419 Av Girouard', 'Montreal', 'Quebec', 'H4A3E5', 'Canadian', 'Kirk@UnitedFederationOfPlanets.earth'),
 ('Celine', 'Dion', '1968-03-30 9:12:46', 333333, '2345678901', 'Chateau Frontnac', 'Quebec', 'Quebec', 'a1b2c3', 'Canadian', 'Celine@Dion.qc.ca'),
 ('Ryan', 'Reynolds', '1976-10-23 10:00:47', 444444, '3456789012', 'Rogers Arena', 'Vancouver', 'British Columbia', 'V6B6G1', 'Canadian', 'Deadpool@Marvel.com'),
 ('Roger', 'Macdonald', '1907-12-31 11:01:48', 555555, '4567890123', 'Golden Arches', 'Ville-Marie', 'Quebec','M4CDEZ', 'Canadian', 'Roger@Rogers.ca');


-- UPDATE Person AS a
-- INNER JOIN Parent as B On first_name = 'Roger'
-- SET Person.
-- 
-- --  Inserting Roger's children
-- INSERT INTO Person(first_name, last_name, date_of_birth, medicare_number, telephone_number, address, city, province, postal_code, citizenship, email, parent_id)
-- INNER JOIN Person ON first_name = 'Roger' AS p 
-- VALUES ('Bobburt', 'Macdonald', '2012-01-01 12:02:49', 666666, '5678901234', 'Golden Arches', 'Ville-Marie', 'Quebec','M4CDEZ', 'Canadian', 'Roger@Rogers.ca', p.id) -- , (select id from Person where first_name='Roger')),

 INSERT INTO Person(first_name, last_name, date_of_birth, medicare_number, telephone_number, address, city, province, postal_code, citizenship, email, parent_id)
 VALUES ('Bobburt', 'Macdonald', '2012-01-01 12:02:49', 666666, '5678901234', 'Golden Arches', 'Ville-Marie', 'Quebec','M4CDEZ', 'Canadian', 'Roger@Rogers.ca',(select * FROM (select id from Person where first_name='Roger') as parent_id)),
 ('Roger Jr.', 'Macdonald', '2010-01-01 12:02:49', 777777, '6789012345', 'Golden Arches', 'Ville-Marie', 'Quebec','M4CDEZ', 'Canadian', 'Roger@Rogers.ca', (select * FROM (select id from Person where first_name='Roger') as parent_id)),
 ('Bobby', 'Macdonald', '2008-01-01 12:02:49', 999999, '7890123456', 'Golden Arches', 'Ville-Marie', 'Quebec','M4CDEZ', 'Canadian', 'Roger@Rogers.ca', (select * FROM (select id from Person where first_name='Roger') as parent_id)),
 ('Rogetta', 'Macdonald', '1945-01-01 12:02:49', 111112, '8901234567', 'Golden Arches', 'Ville-Marie', 'Quebec','M4CDEZ', 'Canadian', 'Roger@Rogers.ca', (select * FROM (select id from Person where first_name='Roger') as parent_id));

-- Create groups
INSERT INTO GroupZone(name)
VALUES ('MontrealPrimaryGrade1_Group_1'),
 ('OttawaPrimaryGrade2_Group_2'),
 ('QuebecCityPrimaryGrade3_Group_3'),
 ('FamousCanadiansNotInMTL_Group1'),
 ('BobAndDougsSpecialGroup'),
 ('PeopleWhoHaveGoneToAHabsGameRecently'), -- sadly this group will remain empty
 ('FamousCanadiansFromMTL'),
 ('RogersFamily'),
 ('RogersFriendz_Group_1'),
 ('HabsFans');


INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Bob') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "BobAndDoug%" LIMIT 1) AS group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Doug') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "BobAndDoug%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Bob') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "FamousCanadiansNot%" LIMIT 1) AS group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Doug') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "FamousCanadiansNot%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='William') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "FamousCanadiansFrom%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='William') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "MontrealPrimary%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Celine') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "QuebecCity%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Ryan') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "Ottawa%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Ryan') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "RogersFriend%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Roger') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "RogersFamily%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Bobburt') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "RogersFamily%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Roger Jr.') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "RogersFamily%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Bobby') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "RogersFamily%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Rogetta') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "RogersFamily%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Roger') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "Habs%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Bobburt') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "Habs%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Roger Jr.') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "Habs%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Bobby') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "Habs%" LIMIT 1) As group_zone_id;

INSERT INTO Person_GroupZone(person_id, group_zone_id)
SELECT ( SELECT id FROM Person WHERE first_name='Rogetta') AS person_id, (SELECT id FROM GroupZone WHERE name LIKE "Habs%" LIMIT 1) As group_zone_id;

INSERT INTO PublicHealthCenter(name, website, telephone_number, address, facility_type)
VALUE ('Viau Public Health Center', 'ViauHealth.qc.ca', '5141111111', '1 Heath center road', 'Health facility'),
 ('Beef Public Health Center', 'BeefHealth.qc.ca', '5141111112', '2 Heath center road', 'Cow Health facility'),
 ('Chicken Public Health Center', 'ChickenHealth.qc.ca', '5141111113', '3 Heath center road', 'Chicken Health facility'),
 ('Turkey Health Center', 'TurkeyHealth.qc.ca', '5141111114', '4 Heath center road', 'Big Burb Health facility'),
 ('Duck Public Health Center', 'DuckHealth.qc.ca', '5141111115', '5 Heath center road', 'Swim Burb Health facility'),
 ('Goose Public Health Center', 'GooseHealth.qc.ca', '5141111116', '6 Heath center road', 'Angry Birb Health facility'),
 ('Pork Public Health Center', 'PorkHealth.qc.ca', '5141111117', '7 Heath center road', 'Piggy Health facility'),
 ('Mutton Public Health Center', 'MuttonHealth.qc.ca', '5141111118', '8 Heath center road', 'Smol Sheep Health facility'),
 ('Goat Public Health Center', 'GoatHealth.qc.ca', '5141111119', '9 Heath center road', 'Greatest of all time Health facility'),
 ('Venison Public Health Center', 'VenisonHealth.qc.ca', '5141111120', '10 Heath center road', 'Deer Health facility');
 
INSERT INTO PublicHealthWorker (first_name, last_name, date_of_birth, telephone_number, city, email, is_tested, center_id)
VALUE ('Frederick', 'Banting', '1891-11-14 00:00:01', '1231231231', 'Montreal', 'Frederick@uOfT.ca', b'0', (select id from PublicHealthCenter where name like 'Viau%')),
('Ernest', 'McCulloch', '1926-04-27 00:00:02', '2342342432', 'Toronto', 'Ernest@uOfT.ca', b'1', (select * FROM (select id from PublicHealthCenter where name like 'Beef%') as center_id)),
('Wilfred', 'Gordon Bigelow', '1913-06-18 00:00:03', '3453453453', 'Brandon', 'WGF@uOfT.ca', b'0', (select * FROM (select id from PublicHealthCenter where name like 'Chicken%') as center_id)),
('Norman', 'Bethune', '1890-03-04 00:00:04', '4564564564', 'Gravenhurst', 'Norman@commu.ca', b'1', (select * FROM (select id from PublicHealthCenter where name like 'Turkey%') as center_id)),
('Emily', 'Stowe', '1831-05-01 00:00:05', '5675675675', 'Norwich', 'Emily@FirstFemaleDoctor.ca', b'0', (select * FROM (select id from PublicHealthCenter where name like 'Duck%') as center_id)),
('William', 'Osler', '1849-07-12 00:00:06', '6786786', 'Bradford West Gwillimbury', 'WillOsler@McGillMed.ca', b'1', (select * FROM (select id from PublicHealthCenter where name like 'Goose%') as center_id)),
('John', 'Callaghan', '1923-10-01  00:00:07', '7897897897', 'Hamilton', 'JohnC@uOfT.ca', b'0', (select * FROM (select id from PublicHealthCenter where name like 'Pork%') as center_id)),
('Elizabeth', 'Bagshaw', '1881-10-19 00:00:08', '8908908908', 'Mariposa', 'ElizabethB@uOfT.ca', b'0', (select * FROM (select id from PublicHealthCenter where name like 'Mutton%') as center_id)),
('Wilder', 'Penfield', '1891-01-26 00:00:09', '9019019019', 'Montreal', 'Penfield@Princeton.ca', b'1', (select * FROM (select id from PublicHealthCenter where name like 'Goat%') as center_id)),
('Maude', 'Abbott', '1869-03-18 00:00:10', '0120120120', 'Montreal', 'mAbbot@McGill.ca', b'0', (select * FROM (select id from PublicHealthCenter where name like 'Venison%') as center_id));

INSERT INTO Diagnostic (covid_19_positive, test_date ,result_date, person_id, center_id, worker_id)
VALUE (b'0', '2020-01-02 00:00:01', '2020-01-02 00:00:03', (select id from Person where first_name = 'Bob'), (select id from PublicHealthCenter where name like 'Beef%'), (select id from PublicHealthWorker where first_name ='Ernest')),
(b'0', '2020-01-04 00:00:01', '2020-01-05 00:00:02', (select id from Person where first_name = 'Doug'), (select id from PublicHealthCenter where name like 'Chicken%'), (select id from PublicHealthWorker where first_name = 'Wilfred')),
(b'0', '2020-01-06 00:00:01', '2020-01-07 00:00:02', (select id from Person where first_name = 'William'), (select id from PublicHealthCenter where name like 'Turkey%'), (select id from PublicHealthWorker where first_name = 'Norman')),
(b'0', '2020-01-08 00:00:01', '2020-01-09 00:00:02', (select id from Person where first_name = 'Celine'), (select id from PublicHealthCenter where name like 'Duck%'), (select id from PublicHealthWorker where first_name = 'Emily')),
(b'0', '2020-01-10 00:00:01', '2020-01-11 00:00:02', (select id from Person where first_name = 'Ryan'), (select id from PublicHealthCenter where name like 'Goose%'), (select id from PublicHealthWorker where first_name = 'William')),
(b'0', '2020-01-12 00:00:01', '2020-01-13 00:00:02', (select id from Person where first_name = 'Bobburt'), (select id from PublicHealthCenter where name like 'Pork%'), (select id from PublicHealthWorker where first_name = 'John')),
(b'0', '2020-01-14 00:00:01', '2020-01-15 00:00:02', (select id from Person where first_name = 'Roger Jr.'), (select id from PublicHealthCenter where name like 'Mutton%'), (select id from PublicHealthWorker where first_name = 'Elizabeth')),
(b'0', '2020-01-16 00:00:01', '2020-01-17 00:00:02', (select id from Person where first_name = 'Bobby'), (select id from PublicHealthCenter where name like 'Goat%'), (select id from PublicHealthWorker where first_name = 'Wilder')),
(b'0', '2020-01-18 00:00:01', '2020-01-19 00:00:02', (select id from Person where first_name = 'Rogetta'), (select id from PublicHealthCenter where name like 'Venison%'), (select id from PublicHealthWorker where first_name = 'Maude')),
(b'1', '2020-01-20 00:00:01', '2020-01-21 00:00:02', (select id from Person where first_name = 'Roger'), (select id from PublicHealthCenter where name like 'Viau%'), (select id from PublicHealthWorker where first_name = 'Frederick'));





