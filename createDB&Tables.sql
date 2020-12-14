CREATE DATABASE college_db;
-- commented out rows in tables are forgein keys in next, This document is just for laying out tables in full.
--Table creation order: College_Branchs--Employees--Majors--Minors--STUDENTS--Courses--All_Courses_Offered--Students_Courses

--College_Branchs
CREATE TABLE College_Branchs(
  branch_id INT AUTO_INCREMENT PRIMARY KEY,
  branch_name VARCHAR(100),
  phone VARCHAR(20),
  email VARCHAR(50),
  address VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(2),
  zip INT,
  main_branch_id INT
);
--Insert Main branch data YAY!
INSERT INTO College_Branchs (branch_name,phone,email,address,city,state,zip,main_branch_id)
VALUES ('College of Creative Arts', '304-293-4141', 'cac@mail.wvu.edu', '1436 Evansdale Drive', 'Morgantown', 'WV', 265066111, NULL);
--Insert sub branch data YAY!
INSERT INTO College_Branchs (branch_name,phone,email,address,city,state,zip,main_branch_id)
VALUES
  ('School of Art & Design', '304-293-2140', 'cac@mail.wvu.edu', '1436 Evansdale Drive', 'Morgantown', 'WV', 265066111, 1),
  ('School of Music', '304-293-5511', 'cac@mail.wvu.edu', '1436 Evansdale Drive', 'Morgantown', 'WV', 265066111, 1),
  ('School of Theatre & Dance', '304-293-202', 'cac@mail.wvu.edu', '1436 Evansdale Drive', 'Morgantown', 'WV', 265066111, 1),
  ('Art Museum of WVU', '304-293-2141 Ext. 2', 'WVUMuseumEdCenter@mail.wvu.edu', '20 Fine Arts Drive', 'Morgantown', 'WV', 265066112, 1);
--Alter the table so that main_branch_id is now set to a FOREIGN key that refers to branch_id
ALTER TABLE College_Branchs
ADD FOREIGN KEY (main_branch_id)
REFERENCES College_Branchs(branch_id)
ON DELETE SET NULL;

--All Employees
CREATE TABLE Employees(
  employee_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  employee_type VARCHAR(50),
  title VARCHAR(200),
  sex VARCHAR(2),
  phone VARCHAR(20),
  email VARCHAR(50),
  address VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(2),
  zip INT,
  country VARCHAR(30),
  status VARCHAR(15),
  start_date DATE,
  end_date DATE,
  salary INT,
  branch_id INT,
  FOREIGN KEY (branch_id) REFERENCES College_Branchs(branch_id) ON DELETE SET NULL
);
--Insert data YAY!
INSERT INTO Employees (first_name,last_name,employee_type,title,sex,phone,email,address,city,state,zip,country,status,start_date,end_date,salary,branch_id)
VALUES
  ('Sean', 'Beatty', 'Staff', 'Chief Business Officer', 'M', '304-293-4267', 'Sean.Beatty@mail.wvu.edu', '1234 Mtn View Drive', 'Morgantown', 'WV', 26506, 'USA', 'Active', '2006-09-21', '', 60780, 1),
  ('Bernadette', 'Dombrowski', 'Staff', 'Communications Specialist', 'F', '304-293-3397', 'bernadette.dombrowski@mail.wvu.edu', '1234 Pleasent View', 'Morgantown', 'WV', 26507, 'USA', 'Active', '2010-02-11', '', 58000, 1),
  ('Keith', 'Jackson', 'Staff', 'Dean', 'M', '304-293-4351', 'Keith.Jackson@mail.wvu.edu', '1234 Fast Drive', 'Morgantown', 'WV', 26507, 'USA', 'Active', '20017-01-20', '', 105000, 1),
  ('Octavia', 'Spriggs', 'Staff', 'Dir. of Communications & Marketingr', 'F', '304-293-4347', 'Octavia.Spriggs@mail.wvu.edu', '1567 Mtn View Drive', 'Morgantown', 'WV', 26506, 'USA', 'Active', '20013-05-15', '', 65000, 1),
  ('John', 'Hendricks', 'Staff', 'Associate Dean', 'M', '304-293-4360', 'John.Hendricks@mail.wvu.edu', '2453 Lonely Mtn', 'Morgantown', 'WV', 26508, 'USA', 'Active', '2006-09-21', '', 80500, 1),
  ('James', 'Froemel', 'Staff', 'Chief Business OfficeCoordinator of Undergraduate Recruitment', 'M', '304-293-4339', 'Jfroemel@mail.wvu.edu', '6789 Never Run Drive', 'Morgantown', 'WV', 26508, 'USA', 'Active', '2009-09-21', '', 60780, 1),
  ('Matthew', 'Reed', 'Staff', 'Chief Business OfficeCoordinator of Undergraduate Recruitment', 'M', '304-293-4339', 'Matthew.Reed@mail.wvu.edu', '9876 Starry Ave', 'Morgantown', 'WV', 26504, 'USA', 'Deactive', '1990-01-12', '2009-07-05', 60780, 1),
  ('Eve', 'Faulkes', 'Faculty', 'Professor of Graphic Design', 'F', '304-692-1116', 'Eve.Faulkes@mail.wvu.edu', '9876 Drawn Lane', 'Morgantown', 'WV', 26507, 'USA', 'Active', '1985-06-12', '', 80700, 2),
  ('Joseph', 'Galbreath', 'Faculty', 'Associate Professor of Graphic Design', 'M', '304-293-4149', 'Joseph.Galbreath@mail.wvu.edu', '3456 Electric Ave', 'Morgantown', 'WV', 26508, 'USA', 'Active', '2005-01-01', '5', 60000, 2),
  ('Peter', 'Amstutz', 'Faculty', 'Professor of Piano', 'M', '304-293-4479', 'Peter.Amstutz@mail.wvu.edu', '0293 Black Key Street', 'Morgantown', 'WV', 26509, 'USA', 'Active', '1999-06-22', '', 70780, 3),
  ('Hope', 'Koehler', 'Faculty', 'Professor of Voice', 'F', '304-293-4522', 'Hope.Koehler@mail.wvu.edu', '7365 Projection Grove', 'Pittsburgh', 'PA', 15207, 'USA', 'Active', '2003-03-26', '', 60890, 3),
  ('Yoav', 'Kaddar', 'Faculty', 'Professor of Dance Area Coordinator of Dance', 'M', '304-293-8623', 'Yoav.Kaddar@mail.wvu.edu', '7279 Strolling Drive', 'Fairmont', 'WV', 26554, 'USA', 'Active', '2000-07-07', '', 70400, 4),
  ('Mary', 'McClung', 'Faculty', 'Professor of Costume Design, Director of Costuming', 'F', '304-293-6914', 'Mary.McClung@mail.wvu.edu', '3825 Puppet Master', 'Morgantown', 'WV', 26506, 'USA', 'Active', '2002-04-20', '', 65000, 4),
  ('Todd ', 'Tubutis', 'Faculty', 'Director of WVU Art Museum', 'M', '304-293-6825', 'Todd.Tubutis@mail.wvu.edu', '5276 Gallery Rd', 'Morgantown', 'WV', 26505, 'USA', 'Active', '2009-02-18', '', 95000, 5),
  ('Liza', 'KirkAbel', 'Faculty', 'Museum Facility Manager', 'F', '304-293-9017', 'Liza.Abel@mail.wvu.edu', '2368 Rum Beach Ave', 'Morgantown', 'WV', 26508, 'USA', 'Active', '2010-08-28', '', 75000, 5);

--Majors
CREATE TABLE Majors(
  major_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  major_name VARCHAR(100),
  degree_type VARCHAR(100),
  total_credit_hours INT,
  branch_id INT,
  FOREIGN KEY (branch_id) REFERENCES College_Branchs(branch_id) ON DELETE SET NULL
);
--Insert data YAY!
INSERT INTO Majors (major_name,degree_type,total_credit_hours,branch_id)
VALUES
  ('Graphic Design', 'Bachelor of Fine Arts', 120, 2),
  ('Art History', 'Bachelor of Arts', 120, 2),
  ('Music Education', 'Bachelor of Music', 136, 3),
  ('Music Performance: Voice', 'Bachelor of Music', 122, 3),
  ('Dance', 'Bachelor of Arts', 121, 4),
  ('Theatre Design and Technology', 'Bachelor of Fine Arts', 122, 4),
  ('Undecided', 'Bachelor', 120, NULL);

--Minors
CREATE TABLE Minors(
  minor_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  minor_name VARCHAR(100),
  total_credits_hours INT,
  branch_id INT,
  FOREIGN KEY (branch_id) REFERENCES College_Branchs(branch_id) ON DELETE SET NULL
);
--Insert data YAY!
INSERT INTO Minors (minor_name,total_credits_hours,branch_id)
VALUES
  ('Theatre', 18, 4),
  ('Theatre Production', 18, 4),
  ('Music Industry', 15, 3),
  ('World Music', 18, 3),
  ('Electronic Media', 18, 2),
  ('Printmaking', 18, 2),
  ('Art History', 18, 2);

--STUDENTS
CREATE TABLE Students(
  student_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  sex VARCHAR(2),
  phone VARCHAR(20),
  email VARCHAR(50),
  address VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(2),
  zip INT,
  country VARCHAR(10),
  status VARCHAR(15),
  start_date DATE,
  end_date DATE,
  year VARCHAR(10),
  major_id INT NOT NULL,
  minor_id INT,
  gpa DECIMAL(3,2),
  credits_earned INT,
  credits_attempted INT,
  advisior_id INT,
  FOREIGN KEY (major_id) REFERENCES Majors(major_id),
  FOREIGN KEY (minor_id) REFERENCES Minors(minor_id),
  FOREIGN KEY (advisior_id) REFERENCES Employees(employee_id) ON DELETE SET NULL
);
--Insert data YAY!
INSERT INTO Students (first_name,last_name,sex,phone,email,address,city,state,zip,country,status,start_date,end_date,year,major_id,minor_id,gpa,credits_earned,credits_attempted,advisior_id)
VALUES
  ('Tessa', 'Rahilly', 'F', '304-754-3544', 'tlrahilly@aol.com', '2893 Mt Lake Rd', 'Hedgesville', 'WV', 25427, 'USA', 'Graduated', '2013-08-10', '2017-05-20', 'Senior', 1, 7, 3.90, 125, 125, 9),
  ('Kimberly', 'Smith', 'F', '260-600-0000', 'ksmith@mix.wvu.edu', '2745 Patchy Hall', 'Glennberg', 'VA', 2789, 'USA', 'Active', '2019-08-12', '0000-00-00', 'Sophomore', 5, 1, 3.40, 45, 62, 12),
  ('John', 'Newburg', 'M', '405-700-2000', 'jnewburg@mix.wvu.edu', '4789 Lake Veiw Drive', 'Hagerstown', 'MD', 21740, 'USA', 'Active', '2018-01-15', '0000-00-00', 'Junior', 2, NULL, 3.50, 78, 96, 8),
  ('Cassandra', 'Marker', 'F', '304-279-8000', 'cmarker@mix.wvu.edu', '7284 Roman Ave', 'Martiansburg', 'WV', 25427, 'USA', 'Graduated', '2013-08-10', '2017-05-20', 'Senior', 3, 3, 3.40, 136, 139, 11),
  ('Marcus', 'Hammersmith', 'M', '450-400-3000', 'mhammersmith@mix.wvu.edu', '5876 Shackers Hill', 'Lexington', 'VA', 2798, 'USA', 'Deactive', '2013-08-10', '2014-02-15', 'Freshman', 1, 7, 1.20, 9, 25, 9);

--Courses
CREATE TABLE Courses(
  course_id VARCHAR(20) NOT NULL PRIMARY KEY,
  course_name VARCHAR(100),
  credit_hours DECIMAL(3,2),
  writing_requirement VARCHAR(1),
  level VARCHAR(20),
  summary VARCHAR(1000),
  branch_id INT,
  FOREIGN KEY (branch_id) REFERENCES College_Branchs(branch_id)
);
--Insert data YAY!
INSERT INTO Courses (course_id,course_name,credit_hours,writing_requirement,level,summary,branch_id)
VALUES
  ('ART-101', 'Introduction to Visual Arts', 3, 'Y', 'Undergraduate', 'This introduction to the visual arts gives insight into the relationship of art and culture. While this course introduces major styles and artists, it is not strictly an art history course. The course seeks the answer to the question of how one perceives art. The role art has played in the past and how the past informs the ever-changing present is examined. Slides, films, and field trips enrich the experience. * Arts/Humanities Approved General Education Course. Total of 45 hours of lecture.', 2),
  ('MUA-111', 'Woodwind Instrument I', 1, 'N', 'Undergraduate', 'One half-hour lesson and one half-hour practice time each week. Course fee required. Total of 6 contact hours and a total of 6 hours of required practice. ', 3),
  ('THR-101', 'Introduction to the Theater', 3, 'N', 'Undergraduate', 'This course introduces the first principles and practice of the correlated arts which make up the production of a play. A theater production will integrate the content of the course. Total of 45 hours of lecture. ', 4),
  ('GDT-146', '	Graphic Design I', 3, 'N', 'Undergraduate', 'In this class, students will learn how to implement the principles and elements of graphic design (contrast, alignment, repetition, and proximity, as well as line, color, shape, depth, texture, format). They will see how these are used to solve visual communication problems. The assignments will be created digitally using current software applications such as Adobe Creative Suite Illustrator, Adobe Photoshop, Adobe InDesign. Students will receive an overview of the field, follow the design process and see what it is like to be a graphic designer. Students produce a portfolio of their work. Total of 45 hours of lecture. Course fee required.', 2);

--Professors_Courses (find a better name for this table) find out what the composite key should be ?faculty_id or course_id?
CREATE TABLE All_Courses_Offered(
  offered_courses_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  course_id VARCHAR(20) NOT NULL,
  section_id VARCHAR(3),
  status VARCHAR(15),
  term VARCHAR(10),
  term_year YEAR,
  start_date DATE,
  end_date DATE,
  employee_id INT,
  campus VARCHAR(40),
  building VARCHAR(100),
  room_number VARCHAR(10),
  days VARCHAR(10),
  start_time TIME,
  end_time TIME,
  seating INT,
  FOREIGN KEY (course_id) REFERENCES Courses(course_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
--Insert data YAY!
INSERT INTO All_Courses_Offered (course_id,section_id,status,term,term_year,start_date,end_date,employee_id,campus,building,room_number,days,start_time,end_time,seating)
VALUES
  ('ART-101', '03', 'Closed', 'Spring', 2013, '2013-01-25', '2013-05-19', 9, 'Evansdale', 'Creative Arts Center', '201B', 'T,TH', '02:00:00', '04:00:00', 23),
  ('MUA-111', '01', 'Closed', 'Spring', 2017, '2017-01-26', '2017-05-20', 10, 'Evansdale', 'Creative Arts Center', '201B', 'M,W,F', '02:00:00', '04:00:00', 22),
  ('GDT-146', '01', 'Closed', 'Fall', 2014, '2014-08-31', '2020-12-20', 9, 'Evansdale', 'Creative Arts Center', '200A', 'T,TH', '09:30:00', '1:30:00', 20),
  ('ART-101', '03', 'Open', 'Fall', 2020, '2020-08-31', '2020-12-20', 8, 'Evansdale', 'Creative Arts Center', '201B', 'M,W,F', '11:30:00', '01:30:00', 23),
  ('ART-101', '04', 'Open', 'Fall', 2020, '2020-08-31', '2020-12-20', 9, 'Evansdale', 'Creative Arts Center', '202B', 'M,W,F', '02:00:00', '04:00:00', 23),
  ('MUA-111', '01', 'Open', 'Fall', 2020, '2020-08-31', '2020-12-20', 10, 'Evansdale', 'Creative Arts Center', '101A', 'T', '9:30:00', '10:00:00', 22),
  ('MUA-111', '04', 'Open', 'Fall', 2020, '2020-08-31', '2020-12-20', 11, 'Evansdale', 'Creative Arts Center', '101B', 'TH', '02:00:00', '03:00:00', 23),
  ('THR-101', '01', 'Open', 'Fall', 2020, '2020-08-31', '2020-12-20', 9, 'Downtown', 'Hodges Hall', '315', 'M,W,F', '01:00:00', '02:30:00', 25),
  ('THR-101', '02', 'Open', 'Fall', 2020, '2020-08-31', '2020-12-20', 9, 'Dowtown', 'Hodges Hall', '320', 'T,TH', '10:00:00', '12:30:00', 25),
  ('GDT-146', '01', 'Open', 'Fall', 2020, '2020-08-31', '2020-12-20', 9, 'Evansdale', 'Creative Arts Center', '220', 'M,W,F', '10:30:00', '01:30:00', 20);

--Students_Courses
CREATE TABLE Students_Courses(
  offered_courses_id INT NOT NULL,
  student_id INT NOT NULL,
  grade VARCHAR(2),
  PRIMARY KEY(offered_courses_id, student_id),
  FOREIGN KEY (offered_courses_id) REFERENCES All_Courses_Offered(offered_courses_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
--Insert data YAY!
INSERT INTO Students_Courses
 VALUES
  (1,1,'A'),
  (2,1,'B'),
  (3,1,'A'),
  (1,4,'A'),
  (3,4,'B'),
  (1,5,'C'),
  (2,5,'NA'),
  (3,5,'F'),
  (8,2,''),
  (4,2,''),
  (7,2,''),
  (5,3,''),
  (6,3,''),
  (9,3,'');
