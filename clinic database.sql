create schema HealthyIsTheNewHappy;
use HealthyIsTheNewHappy;

create Table Clinic
(Clinic_ID char(25) primary key NOT NULL,
Clinic_Name char(25),
Address char(25),
Phone int
)Engine = InnoDB;

create Table Drug
(Drug_ID char(25) primary key NOT NULL,
Price int,
Drug_Name char(25),
Drug_Description char(25)
)Engine = InnoDB;

create Table Personal_Info
(ID char(25) primary key NOT NULL,
Person_Name char(25),
Address char(25),
Phone Bigint,
Email char(40)
)Engine = InnoDB;

create Table Employee
(ID char(25) NOT NULL,
E_ID char(25) NOT NULL,
expYears int not null,
salray long,
Type char(25),
Clinic_ID char(25),
Primary Key(E_ID,ID),
constraint fk_Clinic_Employee_doesnt_exists
foreign key (Clinic_ID) references Clinic(Clinic_ID),
constraint fk_ID_Employee_doesnt_exists
foreign key (ID) references Personal_Info(ID)
)Engine = InnoDB;

create Table Patient
(ID char(25) NOT NULL,
Clinic_ID char(25),
Primary Key(ID),
constraint fk_Clinic_Patient_doesnt_exists
foreign key (Clinic_ID) references Clinic(Clinic_ID),
constraint fk_ID_Patient_doesnt_exists
foreign key (ID) references Personal_Info(ID)
)Engine = InnoDB;

create Table Doctor
(Doctor_ID char(25) NOT NULL,
Intership char(50),
Primary Key(Doctor_ID),
constraint fk_Doctor_ID_Employee_doesnt_exists
foreign key (Doctor_ID) references Employee(E_ID)
)Engine = InnoDB;

Create Table Nurse(
Nurse_ID char(25) NOT NULL,
PRIMARY KEY (Nurse_ID),
constraint fk_Nurse_ID_Employee_dosent_exsists
foreign key (Nurse_ID) references Employee(E_ID)
) Engine = InnoDb;

create table Room(
RoomNum Char(25) primary key NOT NULL,
RoomType char(25) NOT NULL,
Clinic_ID char(25) NOT NULL
) Engine = InnoDb;


Create Table Doctor_Room
(RoomNum char(25) NOT NULL,
Doctor_ID char(25) NOT NULL,
Days char(50),
Hours char(50),
Primary Key(RoomNum),
constraint fk_DoctorRoom_Room_doesnt_exists
foreign key (RoomNum) references Room(RoomNum),
constraint fk_Doctor_ID_doesnt_exists
foreign key (Doctor_ID) references Doctor(Doctor_ID)
)Engine = InnoDB;

Create Table Nurse_Room
(RoomNum char(25) NOT NULL,
Nurse_ID char(25) NOT NULL,
Days char(50),
Hours char(50),
Primary Key(RoomNum),
constraint fk_NurseRoom_Room_doesnt_exists
foreign key (RoomNum) references Room(RoomNum),
constraint fk_Nurse_ID_doesnt_exists
foreign key (Nurse_ID) references Nurse(Nurse_ID)
)Engine = InnoDB;

create Table Supplier
(Supplier_ID char(25) NOT NULL,
Primary Key(Supplier_ID),
constraint fk_ID_Supplier_doesnt_exists
foreign key (Supplier_ID) references Personal_Info(ID)
)Engine = InnoDB;

create Table Equipment
(SerialNum char(25) NOT NULL,
Supplier_ID char(25) NOT NULL,
Equipment_Name char(25),
Primary Key(SerialNum),
constraint fk_Supplier_doesnt_exists
foreign key (Supplier_ID) references Supplier(Supplier_ID))Engine = InnoDB;


create Table Equipment_Room
(RoomNum char(25) NOT NULL,
EquipmentSerial char(25) NOT NULL,
constraint fk_Equipment_Room_doesnt_exists
foreign key (RoomNum) references Room(RoomNum),
constraint fk_Equipment_SerialNum_doesnt_exists
foreign key (EquipmentSerial) references Equipment(SerialNum)
)Engine = InnoDB;

create Table Diagnose
(TestNum char(25) NOT NULL,
Result char(100),
Primary Key(TestNum))Engine = InnoDB;

create Table Treatment
(Treatment_ID char(25) NOT NULL,
TestNum char(25) NOT NULL,
Doses char(25),
NumDays char(25),
Primary Key(Treatment_ID),
constraint fk_Treatment_TestNum_doesnt_exists
foreign key (TestNum) references Diagnose(TestNum))Engine = InnoDB;

create Table Appointment
(Appointment_ID char(25) NOT NULL,
RoomNum char(25) NOT NULL,
Patient_ID char(25) NOT NULL,
Doctor_ID char(25) NOT NULL,
TestNum char(25) NOT NULL,
Date char(25),Hours char(50),
Primary Key(Appointment_ID),constraint fk_Appointment_RoomNum_doesnt_exists
foreign key (RoomNum) references Room(RoomNum),
constraint fk_Appointment_Patient_ID_doesnt_exists
foreign key (Patient_ID) references Patient(ID),
constraint fk_Appointment_Doctor_ID_doesnt_exists
foreign key (Doctor_ID) references Doctor(Doctor_ID),
constraint fk_Appointment_TestNum_doesnt_exists
foreign key (TestNum) references Diagnose(TestNum))Engine = InnoDB;


create Table Appointment_Drug_Match
(Appointment_ID char(25) NOT NULL,
Drug_ID char(25) NOT NULL,
primary key (Appointment_ID,Drug_ID),
foreign key (Drug_ID) references Drug(Drug_ID),
foreign key (Appointment_ID) references Appointment(Appointment_ID))Engine = InnoDB;

insert into Clinic values (1,'HealthyIsTheNewHappy', 'Hagiborim4', 5599);

insert into Drug values 
(1,100,'Acamol','release pains'),
(2,150,'Kal Beten','abdominal pain'),
(3,100,'Cough syrup','ease the cough'),
(4,200,'Eye Drop', 'aginst red eyes'),
(5,120, 'Acamol Tzinon','effective aginst tzinon');


#Personal_Info
insert into Personal_Info values
(312345678,'Menahem','Tzitonot 15',0501111111,'Menahem@gmail.com'),
(212385679,'Shifra','Tzlil 20',0502222222,'Shifra@gmail.com'),
(245685690,'Moshe','Root 40',0503333333,'Moshe@walla.com'),
(245642310,'Peretz','HaiBus 15',0504444444,'Seleb@walla.com'),
(248185690,'David','England 1',0501234567,'Something@Yello.com'),
(245681057,'Ania','Rus 1',05055555555,'Ania@gmail.com'),
(285285690,'Moshe','Zihron 17',0507777777,'Moshe12@walla.com'),
(305685690,'Ogen','Maimia 2',0545733333,'Ogen@walla.com'),
(312685690,'Sason','Shemesh 12',0521333333,'Sason@walla.com'),
(012685690,'Smile','Bezeq 9',0541111111,'StamKiBaLiLedaber@walla.com'),
(012885690,'Rooti','Hapina 5',0579561222,'Rooti@gmail.com'),
(085685680,'Tzedi','Tarfati 5',0548233340,'Tzedi@gmail.com'),
(345185670,'Zulema','Spain 3',0525933380,'Zulema@walla.com'),
(312685660,'Zelda','gamboy 41',0521212121,'Zelda@walla.com'),
(325689490,'Yehuda','Levi 2',0501248213,'Yehuda@gmail.com'),
(211123644,'Macarena','Sefi 15',0524096333,'Macarena@walla.com'),
(245055134,'Saray','Jail 80',0541280333,'Saray@walla.com');

insert into Room values 
(1, 'Lab',1),
(2, 'Lab',1),
(3, 'Lab',1),
(4, 'Lab',1),
(5, 'Doctor',1),
(6, 'Doctor',1),
(7, 'Doctor',1),
(8, 'Doctor',1),
(9, 'Nurse',1),
(10, 'Nurse',1),
(11, 'Equipment',1),
(12, 'Equipment',1);

insert into Employee values 
(312345678,1,40,40000,'Doctor',1),
(212385679,2,20,30000,'Doctor',1),
(245685690,3,30,35000,'Doctor',1),
(245642310,4,25,25000,'Doctor',1),
(248185690,5,3,6000,'Nurse',1),
(245681057,6,4,7000,'Nurse',1),
(285285690,7,1,6000,'Cleaner',1),
(305685690,8,2,6000,'Cleaner',1),
(012885690,9,7,8000,'Rentgen',1);

#Patient
insert into Patient values 
(085685680,1),
(345185670,1),
(312685660,1),
(325689490,1),
(211123644,1),
(245055134,1);

#Doctor
insert into Doctor values 
(1,'AfHozenGaron'),
(2,'Family'),
(3,'Ortoped'),
(4,'Family');

#Nurse
insert into Nurse values 
(5),
(6);

#Doctor_Room
insert into Doctor_Room values 
(5, 1,'SunMonTue','10:00-14:00'),
(6, 2,'TueWenThu','14:00-18:00'),
(7, 3,'FriSau','00:00-10:00'),
(8, 4,'AllWeek','10:00-17:00');

#Nurse_Room
insert into Nurse_Room values 
(9, 5,'AllWeek','10:00-17:00'),
(10,6,'AllWeek','17:00-22:00');

#Supplier
insert into Supplier values (312345678);

#Equipment
insert into Equipment values(1,312345678,'Pad'),
(2,312345678,'Needle'),(3,312345678,'Siezers'),
(4,312345678,'Tape'),(5,312345678,'TestTube'),
(6,312345678,'Lalipop'),(7,312345678,'VeinStoper');

#Equipment_Room
insert into Equipment_Room values
(11 ,1),
(11, 2),
(11, 3),
(11, 4),
(12, 1),
(12, 5),
(12, 6),
(12, 7);

#Diagnose
insert into Diagnose values
(1,'Suffer from normal headache, no fever included'),
(2,'Suffer from pain in throat'),
(3,'Period'),
(4,'Fever'),
(5,'Suffer from snoozness!:D (and winter is coming...)'),
(6,'Alergic to SQL');

#Treatment
insert into Treatment values
(1, 1, '5 Pills', 2),
(2, 2, '150mg', 7),
(3, 3, '3 Pills', 3),
(4, 4, '9 Pills', 3),
(5, 5, '9 Pills', 3),
(6, 6, 'Re-Course', 1);

#Appointment
insert into Appointment values
(1,5,085685680,1,1,'Sun','10:00-10:05'),
(2,6,345185670,1,2,'Mon','14:00-14:05'),
(3,7,312685660,2,3,'Fri','14:30-14:40'),
(4,5,325689490,3,4,'Sun','11:00-11:20'),
(5,8,211123644,3,5,'Sun','11:20-11:25'),
(6,8,245055134,3,6,'Tue','11:30-13:00');

#Appointment_Drug_Match
insert into Appointment_Drug_Match values
(1,1),
(2,3),
(3,1),
(4,5),
(5,5),
(6,4);

create table Employee_log(ID char(25),
old_E_ID char(25),new_E_ID char(25),
new_old_expYears int,new_expYears int,
old_salary int,new_salary int,Type char(25),
Clinic_ID char(25),command_ts timestamp,command varchar(10))Engine = InnoDB;

CREATE TRIGGER emp_ins_trg AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
 INSERT INTO Employee_log VALUES(new.id, null, new.E_ID , null, new.expYears, null, new.salary,new.Type, new.Clinic_ID, now(), 'insert')
END$
delimiter ;

delimiter $
CREATE TRIGGER emp_upd_trg AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
 INSERT INTO Employee_log VALUES(new.id, old.E_ID, new.E_ID , old.expYears, new.expYears, old.salary, new.salary,new.Type, new.Clinic_ID, now(), 'update');
END$ 
delimiter ;

delimiter $
CREATE TRIGGER emp_del_trg AFTER DELETE ON Employee
FOR EACH ROW
BEGIN
 INSERT INTO Employee_log VALUES(old.id, old.E_ID, null , old.expYears, null, old.salary, null ,null, old.Clinic_ID, now(), 'delete');
END$
delimiter ;


insert into Employee values 
(312345678,1,40,40000,'Doctor',1),
(212385679,2,20,30000,'Doctor',1),
(245685690,3,30,35000,'Doctor',1),
(245642310,4,25,25000,'Doctor',1),
(248185690,5,3,6000,'Nurse',1),
(245681057,6,4,7000,'Nurse',1),
(285285690,7,1,6000,'Cleaner',1),
(305685690,8,2,6000,'Cleaner',1),
(012885690,9,7,8000,'Rentgen',1);

update Employee
set expYears = 41
where E_ID = 1;
update employee
set salary = 31000
where E_ID = 2;
delete from Employee
where E_ID = 9;




