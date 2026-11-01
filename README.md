
## Project Overview
This project manages student details, course catalogs, and academic enrollments using a relational database architecture. It demonstrates complete end-to-end data persistence, featuring parameterized SQL operations in Java to prevent security vulnerabilities and execute analytical reporting queries.

## Key Features
- **Relational Database Design:** Normalized schema with primary keys, foreign key constraints, check validations, and `ON DELETE CASCADE` rules.
- **JDBC Data Persistence:** Built using the Data Access Object (DAO) pattern in Java with `PreparedStatement` to execute secure, injection-safe CRUD operations.
- **Advanced Querying & Analytics:** Formatted SQL joins, window functions (`DENSE_RANK`), and aggregation (`GROUP_CONCAT`) for dynamic reporting.
- **Transactional Integrity:** Enforces entity and referential integrity across student profiles and course enrollments.

## Technologies Used
- **Programming Language:** Java (JDK 17+)
- **Database:** MySQL Server 8.0+, MySQL Workbench
- **Database Driver:** MySQL Connector/J (`mysql-connector-j-8.x.x.jar`)
- **Architecture:** DAO (Data Access Object) Pattern

## Database Schema Structure
- `student`: Stores student demographics, location, and academic marks.
- `course`: Stores course details and course duration.
- `enrollment`: Junction table linking students to registered courses with primary/foreign key relationships.

## How to Run
1. Execute `schema.sql` in MySQL Workbench to create the `student_db` database and tables.
2. Configure database credentials (`URL`, `USER`, `PASSWORD`) in `src/DBConnection.java`.
3. Add the `mysql-connector-j.jar` file to your Java project's classpath / referenced libraries.
4. Compile and run `src/StudentDAO.java` to test database operations.

## Database Structure
- **students** – stores student details  
- **courses** – stores course information  
- **enrollments** – maps students to courses  

## Sample Operations
- View all students
- Find top scorers
- Calculate average marks
- Retrieve students based on city
- Fetch student names along with enrolled courses using JOINs

## Purpose
This project was built to strengthen SQL fundamentals and understand relational database concepts through hands-on practice.

## How to Run
1. Open MySQL Workbench  
2. Run the SQL script file to create tables and insert data  
3. Execute SELECT queries to view and analyze data  


