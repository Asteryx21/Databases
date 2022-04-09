CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure2`(IN stID INT(11), IN stCode INT(11))
BEGIN

DECLARE stGrade INT(11);
DECLARE stEval1 INT(11);
DECLARE stEval2 INT(11);
DECLARE stEval3 INT(11);


DECLARE finishedFlag INT default 0;

DECLARE gradeCursor	CURSOR FOR SELECT eval_grade FROM evaluationresult 
INNER JOIN job ON job.id = evaluationresult.id
INNER JOIN evaluator ON evaluator.evaluatorUsername = job.evaluator 
WHERE  stCode = evaluator.evaluatorCode AND stID = job.id;

DECLARE evalGrades CURSOR FOR SELECT eval1, eval2, eval3 FROM evaluation
INNER JOIN evaluationresult ON evaluationresult.evalid_ = evaluation.evalid
INNER JOIN job ON job.id = evaluationresult.id
INNER JOIN evaluator ON evaluator.evaluatorUsername = job.evaluator 
WHERE  stCode = evaluator.evaluatorCode AND stID = job.id;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;

OPEN gradeCursor; 
OPEN evalGrades;
FETCH evalGrades INTO stEval1,stEval2,stEval3;
FETCH gradeCursor INTO stGrade;
SET finishedFlag=0;
    WHILE (finishedFlag=0) DO
        IF (stGrade is NOT NULL ) THEN
            SELECT stGrade;
		ELSEIF ( stGrade is NULL AND stEval1 is NOT NULL AND stEval2 is NOT NULL AND stEval3 is NOT NULL) THEN
           UPDATE  evaluationresult 
           INNER JOIN evaluation ON evaluationresult.evalid_ = evaluation.evalid
           SET evaluationresult.eval_grade = evaluation.eval1 + evaluation.eval2 + evaluation.eval3
           WHERE stID = evaluationresult.id;
           SELECT stGrade;
		ELSEIF (stGrade is NULL AND (stEval1 is NULL OR stEval2 is NULL OR stEval3 is NULL ) ) THEN
			SELECT 'οχι τελικη αξιολογηση' AS stGrade;
        END IF;
        FETCH gradeCursor INTO stGrade;
        FETCH evalGrades INTO stEval1,stEval2,stEval3;
    END WHILE; 
CLOSE evalGrades;
CLOSE gradeCursor;
END