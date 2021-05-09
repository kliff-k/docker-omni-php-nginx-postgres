CREATE DATABASE aftersale_db;
CREATE USER aftersale_user WITH PASSWORD 'AFTERSALE_PWD';
GRANT ALL PRIVILEGES ON DATABASE "aftersale_db" to aftersale_user;

\c aftersale_db;

CREATE TABLE TEST(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
