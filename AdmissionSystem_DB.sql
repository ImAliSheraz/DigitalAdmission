USE admissionsystem_db;
/* user table */
CREATE TABLE roles(
role_id int NOT NULL ,
role_name varchar(20),
role_description nvarchar(50),
PRIMARY KEY(role_id));
INSERT INTO roles VALUES (1,'Super Admin','Can Control all operation in application');
INSERT INTO roles VALUES (2,'Admin','Can Control fewer operation in application');
SELECT * FROM roles
CREATE TABLE department(
dep_id int NOT NULL ,
dep_name varchar(20),
dep_head varchar(20),
PRIMARY KEY(dep_id));
INSERT INTO department VALUES (1,'CS','Nadeem Ahmad');
INSERT INTO department  VALUES (2,'SE','Irfan Jaffar');
INSERT INTO department  VALUES (3,'IT','Irfan ul Haq');
SELECT * from department
CREATE TABLE users(
user_id int NOT NULL,
user_name varchar(20) NOT NULL,
user_fullName varchar(20) NOT NULL,
user_password varchar(30) ,
user_role int REFERENCES roles(role_id),
PRIMARY KEY(user_id));

SELECT* FROM  users;
INSERT INTO users VALUES (1,'ali77','Ali Sheraz','12345','1');
INSERT INTO users VALUES (2,'hamza91','Hamza Ejaz','12345','2');

/* student table */
CREATE TABLE students(
stu_id int NOT NULL IDENTITY,
stu_name varchar(20) NOT NULL,
stu_fatherName varchar(20) NOT NULL,
stu_email varchar(30) NOT NULL,
stu_contact varchar(20) NOT NULL,
stu_department int REFERENCES department(dep_id),
stu_gender varchar(10) NOT NULL,
PRIMARY KEY(stu_id));
SELECT * FROM  students;
SELECT stu_id,stu_name,stu_fatherName,stu_email,stu_contact, dep_name as stu_department,stu_gender FROM  students inner join department on stu_department=dep_id;



/* course table */
CREATE TABLE courses(
cor_id int NOT NULL IDENTITY,
cor_name varchar(20) NOT NULL,
cor_pre varchar(20) ,
cor_fol varchar(20) ,
cor_des varchar(30) ,
cor_dep int REFERENCES department(dep_id),
cor_sems varchar(5) NOT NULL,
PRIMARY KEY(cor_id));
SELECT* FROM  courses;

/* Teacher table */
CREATE TABLE teacher(
t_id int NOT NULL IDENTITY,
t_name varchar(20) NOT NULL,
t_qulification varchar(20) NOT NULL,
t_email varchar(50) NOT NULL,
t_contact varchar(20) NOT NULL,
t_department int REFERENCES department(dep_id),
t_gender varchar(10) NOT NULL,
PRIMARY KEY(t_id));
SELECT * FROM  teacher;

/* class Table    */
CREATE TABLE class(
c_id int NOT NULL IDENTITY,
c_name int REFERENCES courses(cor_id),
c_teacher int REFERENCES teacher(t_id),
PRIMARY KEY(c_id));






