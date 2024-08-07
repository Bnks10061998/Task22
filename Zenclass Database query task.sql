create schema zenclass;
use zenclass;

create table users(
userid int not null unique auto_increment primary key,
username varchar(200) not null,
user_email varchar(200) not null,
user_password varchar(12) not null
);

insert into users (username,user_email,user_password) values 
('kavi','kavi@gmail.com','kavi321'),
('pavi','pavi@gmail.com','pavi600'),
('abi','abi@gmail.com','abi321'),
('ravi','ravi@gmail.com','ravi321'),
('raj','raj@gmail.com','raj321'),
('suresh','abc@gmail.com','suresh321');

select * from users;

create table mentor(
mentorid int not null unique auto_increment primary key,
mentorname varchar(100) not null,
mentor_role varchar(100),
mentor_email varchar(100),
mentor_phonenumber varchar(12)
);

insert into mentor(mentorname,mentor_role,mentor_email,mentor_phonenumber) values
('nagaraj','Software Developer','nagaraj@gmail.com',987654321),
('ramesh','Software Developer','ramesh@gmail.com',987987600),
('kavitha','HR','kavitha@gmail.com',6345654321),
('puzhal','Trainer','puzhal@gmail.com',876554321),
('deena','Supporter','deena@gmail.com',9788854321),
('prakash','Senior Software Developer','prakash@gmail.com',7778654321);

select * from mentor;

create table topics(
topicid int not null unique auto_increment primary key,
topicname varchar(100),
topic_date date,
course varchar(255),
batchid int,
batchlanguage varchar(100),
mentorid int,
foreign key(mentorid) references mentor(mentorid)
);
alter table topics modify column batchid varchar(25);

insert into topics (topicname,topic_date,course,batchid,batchlanguage,mentorid) values
('JS','2024-05-05','Full Stack Developer','FSDT-01','Tamil',1),
('HTML','2024-06-05','Full Stack Developer','FSDT-01','Tamil',1),
('CSS','2024-07-05','Full Stack Developer','FSDT-01','Tamil',1),
('Bootstarp','2024-08-05','Full Stack Developer','FSDT-02','Tamil',4),
('MySQL','2024-09-05','Full Stack Developer','FSDE-01','English',2),
('MongoDB','2024-10-05','Full Stack Developer','FSDT-02','Tamil',3);

select * from topics;

create table Studenttask(
taskid int not null unique auto_increment primary key,
taskname varchar(255),
task_submit_date timestamp default current_timestamp,
taskURL varchar(200),
userid int,
topicid int,
foreign key(userid) references users(userid),
foreign key(topicid) references topics(topicid)
);

insert into Studenttask(taskname,task_submit_date,taskURL,userid,topicid) values 
('Shopping cart using react redux','2024-06-05','https://github.com/Bnks10061998/Task11.git',1,1),
('Product Sales using HTML and CSS','2024-07-05','https://github.com/Bnks10061998/Task12.git',1,2),
('Dice Task','2024-08-05','https://github.com/Bnks10061998/Task13.git',1,3),
('Notepad Creation using CRUD','2024-09-05','https://github.com/Bnks10061998/Task14.git',1,4),
('Mini Project','2024-10-05','https://github.com/Bnks10061998/Task16.git',1,5),
('Database Task in Bolt','2024-11-05','https://github.com/Bnks10061998/Task20.git',1,6);

select * from Studenttask;

create table studentqueries(
Queryid int not null unique auto_increment primary key,
Queryname varchar(255),
querydescription varchar(255),
QueryAttachments longblob,
createdAt timestamp default current_timestamp,
userid int,
mentorid int,
foreign key(userid) references users(userid),
foreign key(mentorid) references mentor(mentorid)
);

insert into studentqueries (Queryname,querydescription,QueryAttachments,userid,mentorid) values
('Foreignkey','This concepts is not understand',load_file('data.png'),1,2);

insert into studentqueries (Queryname,querydescription,QueryAttachments,userid,mentorid) values
('Session Feedback','Session Feedback change',load_file('data5.png'),1,1),
('Session Timing','Change my batch timing',load_file('data1.png'),1,1),
('Callback Function','Error handling Problem',load_file('data2.png'),1,1),
('Props Drilling','output not display',load_file('data3.png'),1,2),
('State Management','Missing Component and file',load_file('data4.png'),1,2);

select * from studentqueries;

create table course(
courseid int not null unique auto_increment primary key,
coursename varchar(255),
userid int,
foreign key(userid) references users(userid)
);

insert into course (coursename,userid) values
('MERN',1),
('PYTHON',1),
('MERN',2),
('MERN',3),
('MERN',4),
('MERN',5),
('PYTHON',2),
('PYTHON',3);

select * from course;

create table portfolio(
portfolioid int not null unique auto_increment primary key,
githubURL varchar(200),
portfoliURl varchar(200),
ResumeURL varchar(200)
);

alter table portfolio add column userid int;
alter table portfolio add foreign key(userid) references users(userid);

insert into portfolio (githubURL,portfoliURL,ResumeURL,userid) values
('https://github.com/Bnks10061998/','sample','kavi.com',1),
('https://github.com/Bnks10061997/','test','abi.com',2);

select * from portfolio;