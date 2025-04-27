CREATE Table UGYFEL2
(
LOGIN nvarchar(100) MASKED WITH (Function = 'default()'),
EMAIL nvarchar(100) MASKED WITH (Function = 'email()'),
NEV nvarchar(100) MASKED WITH (Function = 'partial(1, "XXX", 1)'),
SZULEV int MASKED WITH (Function = 'random(1900,2000)',
NEM nvarchar(100),
CIM nvarchar(100) MASKED WITH (Function = 'default()')
);

INSERT INTO UGYFEL2
(LOGIN,EMAIL,NEV,SZULEV,NEM,CIM)
SELECT login, email, nev, szulev, nem, cim
FROM Ugyfel;

CREATE USER MaskUser WITHOUT Login;
GRANT SELECT ON UGYFEL2 TO MaskUser

EXECUTE AS User= 'MaskUser';
SELECT * FROM UGYFEL2
REVERT
