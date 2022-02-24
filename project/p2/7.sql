

ALTER TABLE Test
    ADD CHECK (examdate IS NULL OR examdate >= pscrpdate);



-- insert a record that violates this constraint and the database throwing an error
INSERT INTO tests
VALUES (1111, 'GUTV92030001', null, 7007, NULL, 'blood test', '2022-04-30', '2022-05-01', '2021-04-30', NULL)
;
