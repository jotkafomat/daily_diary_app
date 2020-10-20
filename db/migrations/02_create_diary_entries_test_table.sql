CREATE DATABASE "daily_diary_manager_test";
\c daily_diary_manager_test;
CREATE TABLE diary_entries(id SERIAL PRIMARY KEY, content VARCHAR(60));
