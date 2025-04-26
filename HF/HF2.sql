CREATE Table UGYFEL2
(
LOGIN varchar(100) MASKED WITH (Function = 'partial(1, "XXX", 1)'),
EMAIL varchar(100) MASKED WITH (Function = 'email()'),
NEV varchar(100) MASKED WITH (Function = 'partial(1, "XX")'),
SZULEV int MASKED WITH (Function = 'random(1,10)',
NEM varchar(100),
CIM varchar(100) MASKED WITH (Function = 'default()')
)

INSERT INTO UGYFEL2
(LOGIN,EMAIL,NEV,SZULEV,NEM,CIM)
SELECT login, email, nev, szulev, nem, cim
FROM Ugyfel 

CREATE USER MaskUser WITHOUT Login;
GRANT SELECT ON UGYFEL2 TO MaskUser

EXECUTE AS User= 'MaskUser';
SELECT * FROM UGYFEL2
REVERT
