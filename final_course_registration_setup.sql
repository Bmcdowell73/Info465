
-- Create Department Table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Create Role Table
CREATE TABLE Role (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(100)
);

-- Create User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    password_hash VARCHAR(255),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Create Course Table
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT,
    credits INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Session Table
CREATE TABLE Session (
    session_id INT PRIMARY KEY,
    course_id INT,
    instructor_id INT,
    semester VARCHAR(50),
    year INT,
    modality VARCHAR(50),
    max_capacity INT,
    current_enrollment INT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES User(user_id)
);

-- Create Enrollment Table
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    user_id INT,
    session_id INT,
    enrolled_on DATE,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (session_id) REFERENCES Session(session_id)
);

-- Insert Departments
INSERT INTO Department (department_id, department_name) VALUES
(1, 'Information Systems'),
(2, 'Marketing');

-- Insert Roles
INSERT INTO Role (role_id, role_name) VALUES
(1, 'Student'),
(2, 'Instructor'),
(3, 'Administrator'),
(4, 'Teaching Assistant'),
(5, 'Guest');

-- Insert Users
INSERT INTO User (user_id, username, email, password_hash, role_id) VALUES
(101, 'Ashley Nguyen', 'ashley.nguyen@example.edu', 'hash1', 1),
(102, 'Jamal Robinson', 'jamal.robinson@example.edu', 'hash2', 1),
(103, 'Priya Mehta', 'priya.mehta@example.edu', 'hash3', 1),
(104, 'Daniel Lopez', 'daniel.lopez@example.edu', 'hash4', 1),
(105, 'Mei Chen', 'mei.chen@example.edu', 'hash5', 1),
(201, 'Dr. Smith', 'smith@example.edu', 'hash6', 2),
(202, 'Dr. Allen', 'allen@example.edu', 'hash7', 2),
(203, 'Dr. Lee', 'lee@example.edu', 'hash8', 2),
(204, 'Dr. Khan', 'khan@example.edu', 'hash9', 2),
(205, 'Dr. Patel', 'patel@example.edu', 'hash10', 2);

-- Insert Courses
INSERT INTO Course (course_id, course_name, course_description, credits, department_id) VALUES
(1, 'Business Process Engineering', 'BPE course', 3, 1),
(2, 'Data Communications', 'Networking course', 3, 1),
(3, 'Intro to Programming', 'Basics of programming', 4, 1),
(4, 'Consumer Behavior', 'Study of buyer behavior', 3, 2),
(5, 'Principles of Marketing', 'Marketing fundamentals', 3, 2);

-- Insert Sessions
INSERT INTO Session (session_id, course_id, instructor_id, semester, year, modality, max_capacity, current_enrollment) VALUES
(6, 1, 201, 'Fall', 2025, 'In-Person', 30, 0),
(7, 2, 202, 'Fall', 2025, 'Online', 25, 0),
(8, 3, 203, 'Spring', 2026, 'Hybrid', 20, 0),
(9, 4, 204, 'Spring', 2026, 'In-Person', 35, 0),
(10, 5, 205, 'Summer', 2026, 'Online', 40, 0);

-- Insert Enrollments
INSERT INTO Enrollment (enrollment_id, user_id, session_id, enrolled_on) VALUES
(1001, 101, 6, '2025-08-21'),
(1002, 102, 7, '2025-08-21'),
(1003, 103, 8, '2026-01-15'),
(1004, 104, 9, '2026-01-15'),
(1005, 105, 10, '2026-06-01'),
(1006, 101, 7, '2025-08-22');
