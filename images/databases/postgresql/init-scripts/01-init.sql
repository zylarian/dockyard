-- PostgreSQL initialization script
-- This script runs automatically on first container startup

-- Create additional databases for services
CREATE DATABASE metabase;
CREATE DATABASE outline;

-- Create users for services
CREATE USER metabase WITH PASSWORD 'metabase';
CREATE USER outline WITH PASSWORD 'outline';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE metabase TO metabase;
GRANT ALL PRIVILEGES ON DATABASE outline TO outline;
