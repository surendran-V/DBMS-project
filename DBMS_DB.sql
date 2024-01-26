USE alumni;
CREATE TABLE student (
  srn VARCHAR(50) PRIMARY KEY, sname VARCHAR(50) UNIQUE NOT NULL, dob date NOT NULL , gender VARCHAR(2)
);
CREATE TABLE department (
  deptid VARCHAR(50) PRIMARY KEY,
  dept_name VARCHAR(100) NOT NULL
);
CREATE TABLE belongs (
  srn VARCHAR(50),
  dept_id VARCHAR(50),
  PRIMARY KEY (srn, dept_id),
  FOREIGN KEY (srn) REFERENCES student(srn) ON DELETE CASCADE,
  FOREIGN KEY (dept_id) REFERENCES department(deptid) ON DELETE CASCADE
);
CREATE TABLE alumni (
  id VARCHAR(50) PRIMARY KEY,
  alumni_name VARCHAR(100) NOT NULL,
  year_of_grad YEAR NOT NULL,
  gender VARCHAR(2),
  UNIQUE (alumni_name)
);
CREATE TABLE majored (
  deptid VARCHAR(50),
  id VARCHAR(50),
  PRIMARY KEY (deptid, id),
  FOREIGN KEY (deptid) REFERENCES department(deptid) ON DELETE CASCADE,
  FOREIGN KEY (id) REFERENCES alumni(id) ON DELETE CASCADE
);
CREATE TABLE company (
  company_name VARCHAR(100) PRIMARY KEY,
  tier INT
);
CREATE TABLE internship (
  id VARCHAR(50),
  company_name VARCHAR(100),
  pay DECIMAL(10, 2),
  intern_year YEAR,
  duration VARCHAR(50),
  PRIMARY KEY (id, company_name),
  FOREIGN KEY (id) REFERENCES alumni(id) ON DELETE CASCADE,
  FOREIGN KEY (company_name) REFERENCES company(company_name) ON DELETE CASCADE
);
CREATE TABLE club (
  club_name VARCHAR(100) PRIMARY KEY,
  genre VARCHAR(50)
);
CREATE TABLE joined (
  id VARCHAR(50),
  club_name VARCHAR(100),
  PRIMARY KEY (id, club_name),
  FOREIGN KEY (id) REFERENCES alumni(id) ON DELETE CASCADE,
  FOREIGN KEY (club_name) REFERENCES club(club_name) ON DELETE CASCADE
);
CREATE TABLE stay (
  sid VARCHAR(50),
  stype VARCHAR(50),
  expenditure DECIMAL(10, 2),
  PRIMARY KEY (sid),
  FOREIGN KEY (sid) REFERENCES alumni(id) ON DELETE CASCADE
);

CREATE TABLE course (
  course_id VARCHAR(50) PRIMARY KEY,
  course_name VARCHAR(100)
);
CREATE TABLE enrols (
  course_id VARCHAR(50),
  id VARCHAR(50),
  PRIMARY KEY (course_id, id),
  FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE,
  FOREIGN KEY (id) REFERENCES alumni(id) ON DELETE CASCADE
);
-- Insert into alumni table

INSERT INTO alumni (id, alumni_name, year_of_grad, gender) VALUES
  ('PES2UG15CS021', 'John Doe', 2025, 'M'),
  ('PES2UG16CS023', 'Jane Smith', 2025, 'F'),
  ('PES2UG17CS025', 'Robert Johnson', 2025, 'M'),
  ('PES2UG18CS027', 'Emily Davis', 2025, 'F'),
  ('PES2UG18CS029', 'Michael Wilson', 2025, 'M'),
  ('PES2UG15CS031', 'Sophia Miller', 2025, 'F'),
  ('PES2UG16CS033', 'William Brown', 2025, 'M'),
  ('PES2UG14CS035', 'Olivia Davis', 2025, 'F'),
  ('PES2UG15CS037', 'Ethan Anderson', 2025, 'M'),
  ('PES2UG16CS039', 'Ava Johnson', 2025, 'F'),
  ('PES2UG17CS041', 'Liam Smith', 2025, 'M'),
  ('PES2UG16CS043', 'Emma Johnson', 2025, 'F'),
  ('PES2UG15CS045', 'Daniel White', 2025, 'M'),
  ('PES2UG17CS047', 'Olivia Brown', 2025, 'F'),
  ('PES2UG18CS049', 'Alexander Davis', 2025, 'M'),
  ('PES2UG13CS051', 'Ellie Goulding', 2025, 'F'),
  ('PES2UG15CS053', 'William Anderson', 2025, 'M'),
  ('PES2UG14CS055', 'Ava Taylor', 2025, 'F'),
  ('PES2UG14CS057', 'Ethan Harris', 2025, 'M'),
  ('PES2UG16CS059', 'Grace Martinez', 2025, 'F');

  
  -- Add more alumni records as needed;

-- Insert into company table
INSERT INTO company (company_name, tier) VALUES
  ('TCS', 1),
  ('Infosys', 2),
  ('Wipro', 1),
  ('HCL Technologies', 2),
  ('Tech Mahindra', 3),
  ('Cognizant', 1),
  ('Qualcom', 3);
  -- Add more company records as needed;

-- Insert into internship table
INSERT INTO internship (id, company_name, pay, intern_year, duration) VALUES
  ('PES2UG15CS021', 'TCS', 30000.00, 2018, '3 months'),
  ('PES2UG16CS023', 'Infosys', 25000.00, 2019, '2 months'),
  ('PES2UG17CS025', 'Wipro', 28000.75, 2020, '4 months'),
  ('PES2UG18CS027', 'HCL Technologies', 32000.25, 2021, '3 months'),
  ('PES2UG18CS029', 'Tech Mahindra', 30000.00, 2021, '2 months'),
  ('PES2UG15CS031', 'Cognizant', 34000.50, 2018, '3 months'),
  ('PES2UG16CS033', 'Qualcom', 31000.00, 2019, '2 months'),
  ('PES2UG14CS035', 'TCS', 36000.75, 2017, '4 months'),
  ('PES2UG15CS037', 'Infosys', 29000.25, 2018, '3 months'),
  ('PES2UG16CS039', 'Wipro', 33000.50, 2019, '2 months'),
  ('PES2UG17CS041', 'HCL Technologies', 30000.00, 2020, '4 months'),
  ('PES2UG16CS043', 'Tech Mahindra', 35000.25, 2019, '3 months'),
  ('PES2UG15CS045', 'Cognizant', 32000.00, 2018, '2 months'),
  ('PES2UG17CS047', 'Qualcom', 37000.50, 2020, '4 months'),
  ('PES2UG18CS049', 'TCS', 34000.75, 2021, '3 months'),
  ('PES2UG13CS051', 'Infosys', 31000.25, 2016, '2 months'),
  ('PES2UG15CS053', 'Wipro', 38000.00, 2018, '4 months'),
  ('PES2UG14CS055', 'HCL Technologies', 29000.50, 2017, '3 months'),
  ('PES2UG14CS057', 'Tech Mahindra', 32000.25, 2017, '2 months'),
  ('PES2UG16CS059', 'Cognizant', 36000.50, 2019, '3 months');
 
  -- Add more internship records as needed;

-- Insert into club table
INSERT INTO club (club_name, genre) VALUES
  ('CodeChef', 'Programming'),
  ('Dsgnr', 'Fine Arts'),
  ('Cliff Hangers', 'Music'),
  ('Tuskers', 'Athletics'),
  ('Apostrophe', 'Public Speaking'),
  ('Innovation Labs', 'Science and Technology'),
  ('Pixelloid', 'Visual Arts'),
  ('QQC', 'Miscellaneous'),
  ('ByteBusters', 'Programming'),
  ('CanvasCraft', 'Fine Arts'),
  ('Rhythmic Beats', 'Music'),
  ('Speedy Soles', 'Athletics'),
  ('Eloquent Voices', 'Public Speaking'),
  ('Tech Explorers', 'Science and Technology'),
  ('ColorPalette', 'Visual Arts'),
  ('Adventurers Guild', 'Miscellaneous');
  
  -- Add more club records as needed;

-- Insert into joined table
INSERT INTO joined (id, club_name) VALUES
  ('PES2UG15CS021', 'CodeChef'),
  ('PES2UG16CS023', 'Dsgnr'),
  ('PES2UG17CS025', 'Cliff Hangers'),
  ('PES2UG18CS027', 'Tuskers'),
  ('PES2UG18CS029', 'Apostrophe'),
  ('PES2UG15CS031', 'Innovation Labs'),
  ('PES2UG16CS033', 'Pixelloid'),
  ('PES2UG14CS035', 'QQC'),
  ('PES2UG15CS037', 'ByteBusters'),
  ('PES2UG16CS039', 'CanvasCraft'),
  ('PES2UG17CS041', 'Rhythmic Beats'),
  ('PES2UG16CS043', 'Speedy Soles'),
  ('PES2UG15CS045', 'Eloquent Voices'),
  ('PES2UG17CS047', 'Tech Explorers'),
  ('PES2UG18CS049', 'ColorPalette'),
  ('PES2UG13CS051', 'Adventurers Guild'),
  ('PES2UG15CS053', 'CodeChef'),
  ('PES2UG14CS055', 'Dsgnr'),
  ('PES2UG14CS057', 'Cliff Hangers'),
  ('PES2UG16CS059', 'Tuskers');

  -- Add more joined records as needed;


INSERT INTO stay (id, stype, expenditure) VALUES/*-----------------------------------this-------------------------------------------------*/
  ('PES2UG15CS021', 'Day-Scholar', 1500.00 COLLATE utf8_general_ci),
  ('PES2UG16CS023', 'Hostel', 1200.75 COLLATE utf8_general_ci),
  ('PES2UG17CS025', 'PG', 1300.20 COLLATE utf8_general_ci),
  ('PES2UG18CS027', 'Day-Scholar', 1400.50 COLLATE utf8_general_ci),
  ('PES2UG18CS029', 'Hostel', 1100.25 COLLATE utf8_general_ci),
  ('PES2UG15CS031', 'PG', 1200.75 COLLATE utf8_general_ci),
  ('PES2UG16CS033', 'Day-Scholar', 1300.00 COLLATE utf8_general_ci),
  ('PES2UG14CS035', 'Hostel', 1000.50 COLLATE utf8_general_ci),
  ('PES2UG15CS037', 'PG', 1100.25 COLLATE utf8_general_ci),
  ('PES2UG16CS039', 'Day-Scholar', 1200.00 COLLATE utf8_general_ci),
  ('PES2UG17CS041', 'Hostel', 900.75 COLLATE utf8_general_ci),
  ('PES2UG16CS043', 'PG', 1000.50 COLLATE utf8_general_ci),
  ('PES2UG15CS045', 'Day-Scholar', 1100.25 COLLATE utf8_general_ci),
  ('PES2UG17CS047', 'Hostel', 800.50 COLLATE utf8_general_ci),
  ('PES2UG18CS049', 'PG', 900.25 COLLATE utf8_general_ci),
  ('PES2UG13CS051', 'Day-Scholar', 1000.00 COLLATE utf8_general_ci),
  ('PES2UG15CS053', 'Hostel', 700.75 COLLATE utf8_general_ci),
  ('PES2UG14CS055', 'PG', 800.50 COLLATE utf8_general_ci),
  ('PES2UG14CS057', 'Day-Scholar', 900.25 COLLATE utf8_general_ci),
  ('PES2UG16CS059', 'Hostel', 600.50 COLLATE utf8_general_ci);
  -- Add more stay records as needed;

-- Insert into course table
INSERT INTO course (course_id, course_name) VALUES
  ('UECS341A', 'Computer Science'),
  ('UEEE352A', 'Electrical Engineering'),
  ('UEME367A', 'Mechanical Engineering'),
  ('UEEC378A', 'Electronics and Communication'),
  ('UECV389A', 'Civil Engineering'),
  ('UEBT401A', 'Biotechnology'),
  ('UECH415A', 'Chemical Engineering'),
  ('UEMT430A', 'Material Science'),
  ('UEIT445A', 'Information Technology'),
  ('UEAU460A', 'Aerospace Engineering'),
  ('UEML475A', 'Machine Learning'),
  ('UEDA489A', 'Data Analytics'),
  ('UECV504A', 'Environmental Engineering'),
  ('UECS519A', 'Cybersecurity'),
  ('UEAI534A', 'Artificial Intelligence'),
  ('UEEE550A', 'Power Systems'),
  ('UERO570A', 'Robotics'),
  ('UEEC585A', 'VLSI Design'),
  ('UEBT600A', 'Bioinformatics'),
  ('UECH615A', 'Chemical Process Engineering');
  -- Add more course records as needed;
-- Insert into enrols table
INSERT INTO enrols (course_id, id) VALUES/*--------------------------------------this----------------------------------------------------*/
  ('UECS341A', 'PES2UG15CS021'),
  ('UEIT445A', 'PES2UG15CS021'),
  ('UEME367A', 'PES2UG16CS023'),
  ('UEEC378A', 'PES2UG17CS025'),
  ('UEEC585A', 'PES2UG17CS025'),
  ('UEDA489A', 'PES2UG18CS027'),
  ('UECV389A', 'PES2UG18CS029'),
  ('UEMT430A', 'PES2UG18CS029'),
  ('UEAU460A', 'PES2UG15CS031'),
  ('UECH415A', 'PES2UG16CS033'),
  ('UECH615A', 'PES2UG16CS033'),
  ('UEBT401A', 'PES2UG14CS035'),
  ('UEML475A', 'PES2UG15CS037'),
  ('UEEE352A', 'PES2UG16CS039'),
  ('UEEE550A', 'PES2UG16CS039'),
  ('UEBT600A', 'PES2UG17CS041'),
  ('UEAI534A', 'PES2UG16CS043'),
  ('UERO570A', 'PES2UG16CS043'),
  ('UECS341A', 'PES2UG15CS045'),
  ('UECH415A', 'PES2UG17CS047'),
  ('UECH615A', 'PES2UG17CS047'),
  ('UEMT430A', 'PES2UG18CS049'),
  ('UECS519A', 'PES2UG13CS051'),
  ('UEBT401A', 'PES2UG14CS057'),
  ('UECS341A', 'PES2UG13CS051'),
  ('UECV389A', 'PES2UG14CS055'),
  ('UECS519A', 'PES2UG15CS053'),
  ('UEIT445A', 'PES2UG16CS059'),
  ('UEIT445A', 'PES2UG15CS053'),
  ('UECS341A', 'PES2UG16CS059');
  -- Add more enrols records as needed;
  
  -- Insert into student table
INSERT INTO student (srn, sname, dob, gender) VALUES
  ('PES2UG21CS091', 'Alice Johnson', '2002-05-15', 'F'),
  ('PES2UG21CS094', 'Bob Smith', '2003-09-22', 'M'),
  ('PES2UG21CS097', 'Charlie Davis', '2002-07-10', 'M'),
  ('PES2UG21CS100', 'Diana Brown', '2003-01-18', 'F'),
  ('PES2UG21CS103', 'Ethan Wilson', '2002-12-05', 'M'),
  ('PES2UG21CS106', 'Fiona Miller', '2003-03-29', 'F'),
  ('PES2UG21CS109', 'George Taylor', '2002-08-14', 'M'),
  ('PES2UG21CS112', 'Hannah Anderson', '2003-06-07', 'F'),
  ('PES2UG21CS115', 'Ian Harris', '2002-04-25', 'M'),
  ('PES2UG21CS118', 'Jessica Martinez', '2003-11-11', 'F');
  -- Add more student records as needed;

-- Insert into department table
INSERT INTO department (deptid, dept_name) VALUES
  ('CSE101', 'Computer Science'),
  ('EEE201', 'Electrical'),
  ('MES301', 'Mechanical'),
  ('ECE401', 'Electronics'),
  ('CVE501', 'Civil'),
  ('BTY601', 'Biotech'),
  ('CHE701', 'Chemical'),
  ('DSC001', 'Data Science');

  -- Add more department records as needed;

-- Insert into belongs table
INSERT INTO belongs (srn, dept_id) VALUES
  ('PES2UG21CS091', 'CSE101'),
  ('PES2UG21CS094', 'EEE201'),
  ('PES2UG21CS097', 'MES301'),
  ('PES2UG21CS100', 'ECE401'),
  ('PES2UG21CS103', 'CVE501'),
  ('PES2UG21CS106', 'BTY601'),
  ('PES2UG21CS109', 'CHE701'),
  ('PES2UG21CS112', 'DSC001'),
  ('PES2UG21CS115', 'DSC001'),
  ('PES2UG21CS118', 'CSE101');
  -- Add more belongs records as needed;
-- Insert into majored table
INSERT INTO majored (deptid, id) VALUES /*---------------------------------this----------------------------------------------------------*/
  ('CSE101', 'PES2UG15CS021'),
  ('MES301', 'PES2UG16CS023'),
  ('EEE201', 'PES2UG17CS025'),
  ('DSC001', 'PES2UG18CS027'),
  ('CVE501', 'PES2UG18CS029'),
  ('MES301', 'PES2UG15CS031'),
  ('CHE701', 'PES2UG16CS033'),
  ('BTY601', 'PES2UG14CS035'),
  ('DSC001', 'PES2UG15CS037'),
  ('EEE201', 'PES2UG16CS039'),
  ('BTY601', 'PES2UG17CS041'),
  ('CSE101', 'PES2UG16CS043'),
  ('CSE101', 'PES2UG15CS045'),
  ('CHE701', 'PES2UG17CS047'),
  ('MES301', 'PES2UG18CS049'),
  ('CSE101', 'PES2UG13CS051'),
  ('BTY601', 'PES2UG14CS057'),
  ('CVE501', 'PES2UG14CS055'),
  ('CSE101', 'PES2UG15CS053'),
  ('CSE101', 'PES2UG16CS059');
  -- Add more majored records as needed;

