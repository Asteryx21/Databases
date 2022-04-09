SET FOREIGN_KEY_CHECKS=0;

INSERT INTO evaluator(evaluatorCode,firm,evaluatorUsername)
VALUES
(21,'234023545','spyrosf');


INSERT INTO job(start_date,end_date,edra,job_title,salary,evaluator)
VALUES('2021-12-02','2021-02-08','234023545','web developer',3000,'spyrosf');

DELETE FROM job
WHERE id = 4;


ALTER TABLE job AUTO_INCREMENT = 3;

UPDATE employee
SET bio = 'bla bla'
WHERE username = 'paulosp';

INSERT INTO requestevaluation(job_id,empl_username)
VALUES(4,'spyrosf');


DELETE FROM requestevaluation
WHERE job_id=4;



