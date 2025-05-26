# Bonus Section Answer

1. PostgresSQL is an open-source Database Management System (DBMS). It is a SQL (Structured Query Language) database. Postgres is a higher lavel RDBMS. It's help to write complex query and highly efficient. It provide us best performance and scalability, multiversion concurrency control services, deep language support. PSQL is 100% open source DBMS.
   
2. When we create a database, a public schema is created by-default. Schema's are like box. We normaly working in a public schema.
Schemas allow us to organize database objects tables, views, indexing, function etc. A database can have one or more schema.

3. **Primary key:** Primary key is a column in a database. It uniquely identifies each row in a table. It might be unique and incremental. The key should not be null. 
**Primary Key:** A foreign key is a column. It creates relationship between two tables. This key refers to the primary key of a parent table.

***Example:*** For example, we have two tables 'departments' and 'students'. Now, department table has field like **department_id, department_name** etc. Here department_id is a Primary key of the departments table.
In Students table has some column including **student_id, student_name** and **department_id**. Here **department_id** is a foreign key that established a relationship between departments and students tables.

4. **CHAR** and **VARCHAR** is two data types in PostgreSQL. The difference both are the CHAR data types stored fixed length of strings and the VARCHAR is stored characters strings of variable strings.
5. **WHERE:** The **WHERE** clause is used for conditional query. When we want to get data using **SELECT** clause based on any condition, the **WHERE** clause helps us to querying data by conditions. The WHERE clause has a limit that is- When we use aggregate functions, the WHERE clause does not works with aggregate functions.
6. **LIMIT:** LIMIT is a limiting to querying all data from tables. Suppose we have 10k data, we want just 50 data, than we can use LIMIT for limiting that kind of data. Here is the example below: <br/>
```
SELECT * FROM blogs LIMIT 50;
```
The query is *only retrive 50 data from blogs table.*

7. We can update or modify record/row data using **UPDATE** clause. First of all, we have to write `UPDATE <tables_name>`. After that, we need to `SET` which column data we want to update like `SET course = 'Zoology'`. After set we have to clarify which row's column we want to update by WHERE clause, like `WHERE first_name = 'Jane'`. It means where naem is **Jane**, update course column data by **Zoology**. Example below:
```
    UPDATE students
        SET course = 'Zoology'
            WHERE first_name = 'Jane'
```

***WARNING*** If we don't clarify which rows data using WHERE, the update statement will update whole course column by **Zoology**.

8. Join operation means, joining between multiples tables. In PostgreSQL, there is kind of joins, **INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN, NATURAL JOIN**. All the join clause perform to join multiple tables for different cases for retrive data.<br/>
9.**GROUP BY:** We can group our data with this clause. We can get the data of the rows by grouping. **GROUP BY** clause works with aggregate functions. For example: **sum( ), max( ), min( ), count( )**..etc…