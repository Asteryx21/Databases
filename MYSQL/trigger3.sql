CREATE DEFINER=`root`@`localhost` TRIGGER `tr3users` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
DECLARE emplUsername VARCHAR(12);
DECLARE managUsername VARCHAR(12);
DECLARE evalUsername VARCHAR(12);
DECLARE currentUser VARCHAR(20);
 SET currentUser=CURRENT_USER();

 SELECT username INTO emplUsername FROM employee WHERE username=currentUser; 
 SELECT manager_username INTO managUsername FROM manager WHERE manager_username=currentUser; 
  SELECT evaluatorUsername INTO evalUsername FROM evaluator WHERE evaluatorUsername=currentUser; 


IF currentUser = emplUsername THEN 
   UPDATE users SET users.password = NEW.password;
ELSEIF currentUser = managUsername THEN
   UPDATE users SET users.password = NEW.password  AND users.email = NEW.email;
ELSEIF currentUser = evalUsername THEN
   UPDATE users
   SET users.password = NEW.password AND 
   users.email = NEW.email AND
   users.name = NEW.name AND
   users.surname = NEW.surname;
ELSE 
  INSERT INTO users VALUES 
  (NEW.username,NEW.password,NEW.name,NEW.surname,NEW.type,NEW.reg_date,NEW.email);

END IF;


END