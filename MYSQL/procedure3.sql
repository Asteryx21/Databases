CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure3`(IN stJob INT(11))
BEGIN
DECLARE stGrade INT(11);
DECLARE stUsername VARCHAR(12);
DECLARE stEval1 INT(11);
DECLARE stEval2 INT(11);
DECLARE stEval3 INT(11);
DECLARE counter INT(11);

DECLARE finishedFlag INT default 0;

DECLARE gradeCursor	CURSOR FOR SELECT username,eval_grade FROM evaluationresult 
INNER JOIN job ON job.id = evaluationresult.id
WHERE  stJob=job.id;

DECLARE evalGrades CURSOR FOR SELECT eval1, eval2, eval3 FROM evaluation
INNER JOIN evaluationresult ON evaluationresult.evalid_ = evaluation.evalid
INNER JOIN job ON job.id = evaluationresult.id
WHERE  stJob = job.id;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;

OPEN evalGrades;
OPEN gradeCursor;
FETCH gradeCursor INTO stUsername,stGrade;
#FETCH evalGrades INTO stEval1,stEval2,stEval3;
SET finishedFlag=0;
IF (stJob = 4 ) THEN
SELECT ' δεν υπάρχουν υποψήφιοι για αυτη τη δουλεια' FROM requestevaluation WHERE stJob != requestevaluation.job_id;
END IF;
    WHILE (finishedFlag=0) DO
		IF (stGrade IS NOT NULL) THEN
			SELECT 'Οριστικοποιημένοι πίνακες' AS results, username,eval_grade FROM evaluationresult	WHERE stJob = id  ORDER BY eval_grade DESC;
        ELSEIF (stGrade is NULL) THEN 
			 SELECT username,eval_grade FROM evaluationresult	WHERE ( eval_grade is NOT NULL AND stJob=id )  ORDER BY eval_grade DESC;
			 SELECT COUNT(ISNULL(eval_grade)) AS 'εκρεμεις αιτησεις' FROM evaluationresult WHERE eval_grade IS NULL AND stJob=id ;
			
        END IF;
    
       FETCH gradeCursor INTO stUsername,stGrade;
    END WHILE; 
CLOSE gradeCursor;
CLOSE evalGrades;

END