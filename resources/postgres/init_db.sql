----------------------
-- Database: vanna
----------------------
CREATE DATABASE vanna;
\connect vanna;

CREATE USER "vanna-user" WITH ENCRYPTED PASSWORD 'local';
CREATE USER "vanna-flyway" WITH ENCRYPTED PASSWORD 'flyway';

GRANT ALL PRIVILEGES ON DATABASE vanna TO "vanna-flyway";
ALTER USER "vanna-flyway" WITH CREATEROLE;

--------------------
-- Schema: chromadb
--------------------
CREATE SCHEMA IF NOT EXISTS chromadb;

CREATE ROLE service_role WITH NOLOGIN;

GRANT USAGE ON SCHEMA chromadb TO service_role;
GRANT SELECT, INSERT, UPDATE, DELETE
    ON ALL TABLES IN SCHEMA chromadb
    TO service_role;
GRANT CREATE ON SCHEMA chromadb TO service_role;

GRANT service_role TO "vanna-flyway";
GRANT service_role TO "vanna-user";
