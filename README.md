Connect to psql
CREATE DATABASE daily_diary_manager;
\c daily_diary_manager;
To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

create database for test:
CREATE DATABASE "daily_diary_manager_test";
CREATE TABLE diary_entries(id SERIAL PRIMARY KEY, content VARCHAR(60));
