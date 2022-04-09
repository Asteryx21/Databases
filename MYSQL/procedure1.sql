CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure1`(IN  stName VARCHAR(25), IN stSurname VARCHAR(30),
OUT stJob INT(11),OUT stGrade INT(11), OUT  stEvalN VARCHAR(25) ,OUT stEvalS VARCHAR(30),
OUT stEval1 INT(11),OUT stEval2 INT(11), OUT stEval3 INT(11))
BEGIN

DECLARE stJob INT(11);
DECLARE stGrade INT(11);
DECLARE stEvalN VARCHAR(25);
DECLARE stEvalS VARCHAR(30);
DECLARE stEval1 INT(11);
DECLARE stEval2 INT(11);
DECLARE stEval3 INT(11);
DECLARE finishedFlag INT default 0;

DECLARE jobCursor CURSOR FOR SELECT id FROM job 
INNER JOIN requestevaluation ON job.id = requestevaluation.job_id 
INNER JOIN employee ON employee.username = requestevaluation.empl_username 
INNER JOIN users ON employee.username = users.username 
WHERE users.name = stName AND users.surname = stSurname ;

DECLARE gradeCursor CURSOR FOR SELECT eval_grade FROM evaluationresult
INNER JOIN employee ON employee.username = evaluationresult.username
INNER JOIN users ON employee.username = users.username
WHERE users.name = stName AND users.surname = stSurname;

DECLARE nameCursor CURSOR FOR SELECT DISTINCT name,surname FROM users 
INNER JOIN evaluator ON evaluator.evaluatorUsername = users.username
INNER JOIN job ON evaluator.evaluatorUsername = job.evaluator
WHERE job.id = stJob;

DECLARE evalGrades CURSOR FOR SELECT eval1, eval2, eval3 FROM evaluation
INNER JOIN evaluationresult ON evaluationresult.evalid_ = evaluation.evalid
INNER JOIN users ON evaluationresult.username = users.username
WHERE users.name = stName AND users.surname = stSurname;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;
OPEN jobCursor; 
FETCH jobCursor INTO stJob;
OPEN gradeCursor;
FETCH gradeCursor INTO stGrade;
OPEN nameCursor;
FETCH nameCursor INTO stEvalN,stEvalS;
OPEN evalGrades;
FETCH evalGrades INTO stEval1,stEval2,stEval3;
    SET finishedFlag=0;

    WHILE (finishedFlag=0) DO
        IF (stGrade is NULL ) THEN
            SELECT stJob, 'Αξιολόγηση σε εξέλιξη' AS stGrade,stEval1,stEval2,stEval3,stEvalN,stEvalS;
        ELSE
            SELECT  stJob,stGrade,stEval1,stEval2,stEval3,stEvalN,stEvalS;
        END IF;
        FETCH jobCursor INTO stJob;
        FETCH gradeCursor INTO stGrade;
       -- FETCH nameCursor INTO stEvalN,stEvalS;
        FETCH evalGrades INTO stEval1,stEval2,stEval3;
    END WHILE; 
CLOSE nameCursor;
CLOSE gradeCursor;
CLOSE jobCursor;
CLOSE evalGrades;



END