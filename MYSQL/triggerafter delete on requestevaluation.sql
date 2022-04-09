CREATE DEFINER=`root`@`localhost` TRIGGER `requestevaluation_AFTER_DELETE` AFTER DELETE ON `requestevaluation` FOR EACH ROW BEGIN
INSERT INTO staffevaluation.log (event_date,event_time,completion,type,table_name,id)
    VALUES(current_date(),current_time(),'success','delete','requestevaluation',OLD.job_id);
END