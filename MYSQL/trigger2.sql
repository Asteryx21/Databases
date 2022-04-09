CREATE DEFINER=`root`@`localhost` TRIGGER `company_AFTER_INSERT` BEFORE UPDATE ON `company` FOR EACH ROW BEGIN
IF NEW.AFM NOT LIKE OLD.AFM THEN
	SET NEW.AFM=OLD.AFM;
END IF;
IF NEW.DOY NOT LIKE OLD.DOY THEN
	SET NEW.DOY=OLD.DOY;
END IF;
IF NEW.name NOT LIKE OLD.name THEN
	SET NEW.name=OLD.name;
END IF;
END