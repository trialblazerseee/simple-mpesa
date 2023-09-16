CREATE DATABASE mosip_mpesa
	ENCODING = 'UTF8'
	LC_COLLATE = 'en_US.UTF-8'
	LC_CTYPE = 'en_US.UTF-8'
	TABLESPACE = pg_default
	OWNER = postgres
	TEMPLATE  = template0;
COMMENT ON DATABASE mosip_mpesa IS 'Database for Mpesa related Transaction';

\c mosip_mpesa

DROP SCHEMA IF EXISTS mpesa CASCADE;
CREATE SCHEMA mpesa;
ALTER SCHEMA mpesa OWNER TO postgres;
ALTER DATABASE mosip_mpesa SET search_path TO mpesa,pg_catalog,public;
