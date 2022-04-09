CREATE DEFINER=`root`@`localhost` TRIGGER `job_AFTER_UPDATE` AFTER UPDATE ON `job` FOR EACH ROW BEGIN
INSERT INTO staffevaluation.log (event_date,event_time,completion,type,table_name,id)
    VALUES(current_date(),current_time(),'success','update','job',NEW.id);
END