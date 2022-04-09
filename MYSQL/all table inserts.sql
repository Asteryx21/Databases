INSERT INTO users(username,password,name,surname,type,reg_date,email)
VALUES 
('tasosp','123','tasos','papatasos','manager','2019-08-01','tasosp@gmail.com'),
('nefelis','123','nefeli','sakka','evaluator','2019-08-01','nefelis@gmail.com'),
('vagelisk','123','vagelis','kapsoulakis','evaluator','2019-08-01','vagelisk19@gmail.com'),
('giorgosp','123','giorgos','papagiorgos','evaluator','2019-08-01','giorgosp20@gmail.com'),
('giannisp','123','giannis','papagiannis','employee','2019-08-01','giannisp99@gmail.com'),
('mariap','123','maria','papamaria','manager','2019-08-01','mariap21@gmail.com'),
('konstantinap','123','konstantina','papakonstantina','employee','2019-08-01','konstantinap90@gmail.com'),
('athanasiap','123','athanasia','papa','employee','2019-08-01','athanasiap@gmail.com'),
('petrosa','123','petros','antwniou','employee','2019-08-01','petrosa97@gmail.com'),
('spyrosg','123','spyros','gewrgiou','employee','2019-08-01','spyrosg95@gmail.com'),
('admin','123','admin','admin','admin','2019-08-01','admin@gmail.com');



INSERT INTO company(AFM,DOY,name,street,num,city,country,phone)
VALUES 
('234023568','DOY A patrwn','pawlendar','korinthou',45,'Patra','Ellada',2104970236),
('928342923','DOY B athinwn','DALAVERE','mezonws',69,'Athina','Ellada', 2105910582);

INSERT INTO manager(exp_years,firm,manager_username)
VALUES
(10,'234023568','tasosp'),
(15,'928342923','mariap');
INSERT INTO evaluator(evaluatorCode,firm,evaluatorUsername)
VALUES
(66,'234023568','nefelis'),
(67,'234023568','vagelisk'),
(15,'928342923','giorgosp');
INSERT INTO employee(ΑΜ,companyAFM,_years_of_service,bio,certificates,awards,username)
VALUES
(1041871,'234023568',5,'viografiko tou gianni','pistopoihtika tou gianni','vraveia  tou gianni','giannisp'),
(1047062,'234023568',4,'viografiko ths kostantinas','pistopoihtika ths kostantinas','vraveia ths kostantinas','konstantinap'),
(1046254,'234023568',5,'viografiko ths athanasias','pistopoihtika ths athanasias','vraveia ths athanasias','athanasiap'),
(1045329,'928342923',5,'viografiko tou petrou','pistopoihtika tou petrou','vraveia tou petrou','petrosa'),
(1049543,'928342923',3,'viografiko tou spyrou','pistopoihtika tou spyrou','vraveia tou spyrou','spyrosg');
INSERT INTO languages(languages,employee)
VALUES
('EN,SP,GR','athanasiap'),
('GR','giannisp'),
('GR','petrosa'),
('FR,GR','spyrosg'),
('SP,GR','konstantinap');
INSERT INTO project(project_desc,url,empl)
VALUES
('project desc gia 1 project','wwww.url1.com','spyrosg'),
('project desc gia 2 project','wwww.url2.com','athanasiap'),
('project desc gia 3 project','wwww.url3.com','athanasiap'),
('project desc gia 4 project','wwww.url4.com','giannisp'),
('project desc gia 5 project','wwww.url5.com','konstantinap');
INSERT INTO has_degree(degr_idryma,degr_title,grade,etos,empl_username)
VALUES
('CEID PATRAS','Diplwmatiki title',7,2010,'spyrosg'),
('CSD AUTH','Diplwmatiki sth viopliroforiki',6,2010,'giannisp'),
('DI UOA','Diplwmatiki',7,2011,'konstantinap'),
('CEID PATRAS','Diplwmatiki',8,2015,'athanasiap'),
('CEID GIANENA','Didaktoriko panw se kati',10,2021,'athanasiap'),
('1o lykeio patras','elegxos lykeiou',9,2020,'petrosa');
INSERT INTO degree(bathmima,idryma,title)
VALUES
('MASTER','CEID PATRAS','Diplwmatiki title'),
('UNI','CSD AUTH','Diplwmatiki'),
('UNI','DI UOA','Diplwmatiki'),
('PHD','CEID GIANENA','Didaktoriko panw se kati'),
('LYKEIO','1o lykeio patras','elegxos lykeiou');
INSERT INTO job(start_date,end_date,edra,job_title,salary,evaluator)
VALUES
('2020-08-10','2020-09-10','234023568','front end developer',5000,'nefelis'),
('2020-10-25','2020-11-10','234023568','back end developer',4500,'vagelisk'),
('2021-03-01','2021-04-05','928342923','economic manager',7000,'giorgosp'),
('2021-01-01','2021-02-05','928342923','PR manager',500,'giorgosp');
INSERT INTO antikeim(title,descr)
VALUES
('gnwseis sthn Java kai Python','na eisai toulaxiston Senior developer '),
('gnwseis se HTML/CSS/JavaScript', 'na exeis ylopoihsei toulaxiston mia web efarmogi'),
('Gnwseis sthn SQL','Senior ebiria sthn SQL'),
('Database adminstration','ebiria se diaxirisi vasewn'),
('Network security','gnwseis kryptografias'),
('Oikonomika','  eksidikefsi sthn statistiki'),
('logistiki','kales gnwseis sth logistiki'),
( 'Ksenes glwsses','AGGLIKA KAI TOULAXISTON AKOMA 1'),
('na eisai epikinoniakos anthropos','eikanotita sinergasias');
INSERT INTO needs(id,antikeim_title)
VALUES
(1,'gnwseis sthn Java kai Python'),
(1,'gnwseis se HTML/CSS/JavaScript'),
(2,'Gnwseis sthn SQL'),
(2,'Database adminstration'),
(2,'Network security'),
(3,'Oikonomika'),
(3,'logistiki'),
(3, 'Ksenes glwsses'),
(4,'na eisai epikinoniakos anthropos');
INSERT INTO requestevaluation(job_id,empl_username)
VALUES
(1,'konstantinap'),
(1,'athanasiap'),
(3,'petrosa'),
(2,'athanasiap'),
(3,'giannisp'),
(3,'spyrosg');
INSERT INTO evaluation(eval1,eval2,eval3)
VALUES
(2,2,1),
(3,3,2),
(NULL,3,0),
(3,2,1),
(4,4,2),
(4,4,2),
(3,3,1);


INSERT INTO eval_1(vathmos,empl_username,evaluatorUsername,evalid)
VALUES
('etsi kai etsi 2','giannisp','giorgosp',1),
('metria 3 ','konstantinap','nefelis',2),
(NULL,'petrosa','vagelisk',3),
('kalos kai o spyros 3','spyrosg','vagelisk',4),
('aristh 4','athanasiap','nefelis',5),
('aristh 4','athanasiap','vagelisk',6),
('poly kalos 3','spyrosg','giorgosp',7);

INSERT INTO eval_2(manager_report,manager_username,empl_username,evalid)
VALUES
('etsi kai etsi 2','mariap','giannisp',1),
('metria 3','tasosp','konstantinap',2),
('kalos 3','tasosp','petrosa',3),
('kalos o spyros 2','tasosp','spyrosg',4),
('aristh 4','tasosp','athanasiap',5),
('aristh 4','tasosp','athanasiap',6),
('poly kalos 3','mariap','spyrosg',7);
INSERT eval_3(skills,project_id,degr_idryma,degr_title,empl_username,evalid)
VALUES
('aksiologite me 1',4,'CSD AUTH','Diplwmatiki sth viopliroforiki','giannisp',1),
('aksiologite me 2',5,'DI UOA','Diplwmatiki','konstantinap',2),
('aksiologite me 0',NULL,'1o lykeio patras','elegxos lykeiou','petrosa',3),
('aksiologite me 1',1,'CEID PATRAS','Diplwmatiki title','spyrosg',4),
('aksiologite me 2',2,'CEID PATRAS','Diplwmatiki','athanasiap',5),
('aksiologite me 2',3,'CEID GIANENA','Didaktoriko panw se kati','athanasiap',6),
('aksiologite me 1',1,'CEID PATRAS','Diplwmatiki title','spyrosg',7);

INSERT INTO evaluationresult(eval_grade,comments,username,id,evalid_)
VALUES
(2+2+1,'tha borouse na eixa paei kai kalitera','giannisp',3,1),
(NULL,'ekremmhs','konstantinap',1,2),
(NULL,'ekremmhs','petrosa',2,3),
(3+2+1,' μπραβo σπυρο ', 'spyrosg',2,4),
(4+4+2,'to be hired','athanasiap',1,5),
(4+4+2,'to be hired ','athanasiap',2,6),
(NULL,'ekremmhs','spyrosg',3,7);

