\c mosip_mpesa

GRANT CONNECT
   ON DATABASE mosip_mpesa
   TO mpesauser;

GRANT USAGE
   ON SCHEMA mpesa
   TO mpesauser;

GRANT ALL ON SCHEMA mpesa TO mpesauser;

ALTER DEFAULT PRIVILEGES IN SCHEMA mpesa GRANT SELECT,INSERT,UPDATE,DELETE,REFERENCES ON TABLES TO mpesauser;

