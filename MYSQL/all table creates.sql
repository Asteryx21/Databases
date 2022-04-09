CREATE TABLE users
(
  username VARCHAR(12) NOT NULL,
  password VARCHAR(10) NOT NULL,
  name VARCHAR(25) NOT NULL,
  surname VARCHAR(30) NOT NULL,
  type ENUM('employee','manager','evaluator','admin'),
  reg_date DATE NOT NULL,
  email VARCHAR(35) NOT NULL,
  PRIMARY KEY (username)
  
);

CREATE TABLE company
(
  AFM CHAR(9) NOT NULL,
  DOY VARCHAR(15) NOT NULL,
  name VARCHAR(35) NOT NULL,
  street VARCHAR(15) NOT NULL,
  num INT NOT NULL,
  city VARCHAR(15) NOT NULL,
  country VARCHAR(15) NOT NULL,
  phone INT NOT NULL,
  PRIMARY KEY (AFM)
);


CREATE TABLE employee
(
  ΑΜ INT NOT NULL,
  companyAFM CHAR(9) NOT NULL,
  _years_of_service INT NOT NULL,
  bio VARCHAR(200) NOT NULL,
  certificates VARCHAR(35) NOT NULL,
  awards VARCHAR(35) NOT NULL,
  username VARCHAR(12) NOT NULL,
  PRIMARY KEY (username),
  FOREIGN KEY (username) REFERENCES users(username)
   ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE evaluator
(
  evaluatorCode INT NOT NULL,
  firm CHAR(9) NOT NULL,
  evaluatorUsername VARCHAR(12) NOT NULL,
  PRIMARY KEY (evaluatorUsername),
  FOREIGN KEY (firm) REFERENCES company(AFM),
  FOREIGN KEY (evaluatorUsername) REFERENCES users(username)
     ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE job
(
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  id INT NOT NULL AUTO_INCREMENT,
  edra VARCHAR(45) NOT NULL,
  job_title VARCHAR(40) NOT NULL,
  salary FLOAT NOT NULL,
  evaluator VARCHAR(12) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (evaluator) REFERENCES evaluator(evaluatorUsername)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE project
(
  project_desc VARCHAR(500) NOT NULL,
  url VARCHAR(60) NOT NULL,
  project_id INT NOT NULL AUTO_INCREMENT,
  empl VARCHAR(12) NOT NULL,
  PRIMARY KEY (project_id),
  FOREIGN KEY (empl) REFERENCES employee(username)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE manager
(
  exp_years INT NOT NULL,
  firm CHAR(9) NOT NULL,
  manager_username VARCHAR(12) NOT NULL,
  PRIMARY KEY (manager_username),
  FOREIGN KEY (firm) REFERENCES company(AFM),
  FOREIGN KEY (manager_username) REFERENCES users(username)
   ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE has_degree
(
  degr_idryma VARCHAR(40) NOT NULL,
  degr_title VARCHAR(50) NOT NULL,
  grade FLOAT NOT NULL,
  etos INT NOT NULL,
  empl_username VARCHAR(12) NOT NULL,
  PRIMARY KEY (degr_idryma, degr_title),
  FOREIGN KEY (empl_username) REFERENCES employee(username),
  UNIQUE (degr_idryma, degr_title)
  );

CREATE TABLE evaluation
(
  evalid INT NOT NULL AUTO_INCREMENT,
  eval1 INT ,
  eval2 INT,
  eval3 INT,
  PRIMARY KEY (evalid)
);


CREATE TABLE eval_2
(
  manager_report VARCHAR(200),
  manager_username VARCHAR(12) NOT NULL,
  empl_username VARCHAR(12) NOT NULL,
  evalid INT NOT NULL,
  FOREIGN KEY (manager_username) REFERENCES manager(manager_username),
  FOREIGN KEY (empl_username) REFERENCES employee(username),
  FOREIGN KEY (evalid) REFERENCES evaluation(evalid)
   ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE eval_3
(
  skills VARCHAR(250),
  project_id INT,
  degr_idryma VARCHAR(40) NOT NULL,
  degr_title VARCHAR(50) NOT NULL,
  empl_username VARCHAR(12) NOT NULL,
  evalid INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES project(project_id),
  FOREIGN KEY (degr_idryma, degr_title) REFERENCES has_degree(degr_idryma, degr_title),
  FOREIGN KEY (empl_username) REFERENCES employee(username),
  FOREIGN KEY (evalid) REFERENCES evaluation(evalid)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE eval_1
(
  vathmos VARCHAR(250),
  empl_username VARCHAR(12) NOT NULL,
  evaluatorUsername VARCHAR(12) NOT NULL,
  evalid INT NOT NULL,
  FOREIGN KEY (empl_username) REFERENCES employee(username),
  FOREIGN KEY (evaluatorUsername) REFERENCES evaluator(evaluatorUsername),
  FOREIGN KEY (evalid) REFERENCES evaluation(evalid)
);


CREATE TABLE requestevaluation
(
  job_id INT NOT NULL,
  empl_username VARCHAR(12) NOT NULL,
  FOREIGN KEY (job_id) REFERENCES job(id),
  FOREIGN KEY (empl_username) REFERENCES employee(username)
     ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE languages
(
  languages ENUM("EN","FR","SP","GR") NOT NULL,
  employee VARCHAR(12) NOT NULL,
  FOREIGN KEY (employee) REFERENCES employee(username)
     ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE antikeim
(
  title VARCHAR(36) NOT NULL,
  descr VARCHAR(200) NOT NULL,
  belongs_to VARCHAR(36) NOT NULL,
  PRIMARY KEY (title),
  FOREIGN KEY (belongs_to) REFERENCES antikeim(title)
    ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE log
(
  event_date DATE NOT NULL,
  event_time TIME NOT NULL,
  completion VARCHAR(9) NOT NULL,
  type VARCHAR(25) NOT NULL,
  table_name VARCHAR(25) NOT NULL,
  username VARCHAR(12) NOT NULL,
  id INT NOT NULL,
  FOREIGN KEY (username) REFERENCES employee(username),
  FOREIGN KEY (id) REFERENCES job(id)
     ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE needs
(
  id INT NOT NULL,
  antikeim_title VARCHAR(36) NOT NULL,
  FOREIGN KEY (id) REFERENCES job(id),
  FOREIGN KEY (antikeim_title) REFERENCES antikeim(title)
     ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE degree
(
  bathmima ENUM("LYKEIO","UNI","MASTER","PHD") NOT NULL,
  idryma VARCHAR(40) NOT NULL,
  title VARCHAR(50) NOT NULL,
  FOREIGN KEY (idryma, title) REFERENCES has_degree(degr_idryma, degr_title),
  UNIQUE (idryma, title)
  );

CREATE TABLE evaluationresult
(
  eval_grade INT ,
  comments VARCHAR(225) ,
  username VARCHAR(12) NOT NULL,
  id INT NOT NULL,
  evalid_ INT NOT NULL,
  FOREIGN KEY (username) REFERENCES employee(username),
  FOREIGN KEY (id) REFERENCES job(id),
  FOREIGN KEY (evalid_) REFERENCES evaluation(evalid)
    ON DELETE CASCADE ON UPDATE CASCADE
);