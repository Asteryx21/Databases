CREATE DEFINER=`root`@`localhost` TRIGGER `requestevaluation_AFTER_INSERT` AFTER INSERT ON `requestevaluation` FOR EACH ROW BEGIN
INSERT INTO staffevaluation.log (event_date,event_time,completion,type,table_name,id)
    VALUES(current_date(),current_time(),'success','insert','requestevaluation',NEW.job_id);
END