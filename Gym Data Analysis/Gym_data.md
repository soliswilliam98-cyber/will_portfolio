📌 Overview

This project is a relational database system designed for managing a gym’s operations and analyzing business performance. It tracks members, memberships, attendance (check-ins), trainers, and training sessions.

The project demonstrates strong SQL fundamentals, database design, and the ability to extract meaningful business insights from data.

🎯 Objectives
Design a normalized relational database
Enforce data integrity using constraints
Simulate real-world gym data
Analyze user behavior and business performance using SQL
🧱 Database Schema

The system includes the following tables:

members → stores gym members
plans → subscription plans
memberships → links members to plans
check_ins → tracks gym attendance
trainers → gym trainers
sessions → personal training sessions

Key features:

Primary and foreign keys
UNIQUE constraints
CHECK constraints (data validation)

📊 Data Generation

Data is generated using PostgreSQL features such as:

generate_series()
RANDOM()

This allows simulation of large datasets (100+ members, 500+ check-ins, etc.).

📈 Analytical Queries

This project includes SQL queries to answer real business questions:

Identify most active members
Detect inactive members (no check-ins)
Calculate total revenue
Determine most popular plans
Analyze trainer performance
Track member retention risks

Example:

-- Members who never checked in
SELECT m.name
FROM members m
LEFT JOIN check_ins c ON m.member_id = c.member_id
WHERE c.checkin_id IS NULL;

🧠 Skills Demonstrated
SQL (PostgreSQL)
Database Design & Normalization
JOINs (INNER, LEFT)
Aggregations (COUNT, SUM, AVG)
Constraints (CHECK, UNIQUE, FOREIGN KEY)
Data Simulation
Business Data Analysis

🚀 How to Run
Run schema.sql to create tables
Run inserts.sql to populate data
Run queries.sql to analyze data
