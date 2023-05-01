--Veri tabanýna logon-logoff olan kullanýcý bilgilerini tutma

CREATE TABLE logon_logoff_audit (
    userName    VARCHAR2(30),
    sessID      NUMBER(10),
    logonTime   DATE,
    logoffTime  DATE,
    hostName    VARCHAR2(20),
    IP          VARCHAR2(15)
    );
/
--------------------------------------------

--TRIGGER LOGON

CREATE OR REPLACE TRIGGER logon_audit_trg
AFTER LOGON ON DATABASE
BEGIN
      INSERT INTO logon_logoff_audit (userName, sessId, logonTime, logoffTime, hostName, IP)
      VALUES
      (user, sys_context ('userenv', 'sessionid'),
      sysdate,
      null,
      sys_context ('userenv', 'host'),
      sys_context ('userenv', 'IP_ADDRESS')
      );
END;

--------------------------------------------------
--LOGOFF TRIGGER

CREATE OR REPLACE TRIGGER logoff_audit_trg
BEFORE LOGOFF ON DATABASE
BEGIN
      INSERT INTO logon_logoff_audit (userName, sessId, logonTime, logoffTime, hostName, IP)
    VALUES
      (user, sys_context ('userenv', 'sessionid'),
      null,
      sysdate,
      sys_context ('userenv', 'host'),
      sys_context ('userenv', 'IP_ADDRESS')
    );
END;

/
--TEST
select * from logon_logoff_audit;
