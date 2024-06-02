CREATE TABLE dep(
    alk_id INT NOT NULL PRIMARY KEY IDENTITY,
    fon_id INT NULL FOREIGN KEY REFERENCES dep(alk_id),
    names NVARCHAR(20)
)

INSERT dep(fon_id, names) VALUES(null, 'nev1'),
(1, 'nev2'),
(1, 'nev3'),
(2, 'nev4'),
(3, 'nev5'),
(3, 'nev6'),
(4, 'nev7'),

SELECT *
FROM dep 
WHERE fon_id=1

SELECT *
FROM dep d1 JOIN dep d2 ON d1.alk_id=d2.fon_id
WHERE d1.alk_id=1

