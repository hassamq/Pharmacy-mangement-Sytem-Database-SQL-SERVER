------------------Create Tables----------------------------------
----Manager---
CREATE TABLE Manager (
    Mgr_id int PRIMARY KEY NOT NULL,
    M_fname varchar(50) NOT NULL,
	M_lname varchar(50) NOT NULL,
    M_phone varchar(50) NOT NULL,
    M_address  varchar(50)
  );

----Employee----
CREATE TABLE Employee (
    E_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    E_fname varchar(50) NOT NULL,
	 E_lname varchar(50) NOT NULL,
    E_phone varchar(50) NOT NULL,
   E_address  varchar(50)
	);

----Stock----
CREATE TABLE Stock(
    D_id int IDENTITY(1026,1)  PRIMARY KEY NOT NULL,
    D_name varchar(50) NOT NULL,
	D_category varchar(50) NOT NULL,
    D_company varchar(50) NOT NULL,
    D_qnty  int NOT NULL,
	D_cost int Not NULL,
	Mgr_id int FOREIGN KEY REFERENCES Manager (Mgr_id)
);

----Medicine---
CREATE TABLE Medicine (
    M_id int IDENTITY(301,1) PRIMARY KEY NOT NULL,
    M_name varchar(50) NOT NULL,
    M_qnty  int NOT NULL,
	D_id int  FOREIGN KEY REFERENCES Stock (D_id)
);

----Customer---
CREATE TABLE Customer(
    Cus_id int IDENTITY(1101,1) PRIMARY KEY NOT NULL,
    Cus_fname varchar(50) NOT NULL,
	Cus_lname varchar(50) NOT NULL,
    Cus_gender  varchar(50),
	E_id int  FOREIGN KEY REFERENCES Employee (E_id),
	M_id int  FOREIGN KEY REFERENCES Medicine (M_id)
);

-----Bill---
CREATE TABLE Bill (
    B_reciedId int IDENTITY(2201,1) PRIMARY KEY NOT NULL,
	B_dquantity  int NOT NULL,
    B_tamount int NOT NULL,
	B_date date NOT NULL,
	Cust_id int  FOREIGN KEY REFERENCES Customer (Cus_id)
);

----Cahier----
CREATE TABLE Cashier(
   -- C_id int IDENTITY(1,1) PRIMARY KEY,
    C_fname varchar(50) PRIMARY KEY NOT NULL,
	C_lname varchar(50) NOT NULL,
    C_phone varchar(50) NOT NULL,
   C_address  varchar(50),
	B_reciedId int  FOREIGN KEY REFERENCES Bill (B_reciedId)
);

-----Record----
CREATE TABLE Record(
    R_date DATE  PRIMARY KEY NOT NULL,
	R_titem INT NOT NULL,
    R_gtotal INT NOT NULL,
	R_tprofit INT NOT NULL,
	Mgr_id int FOREIGN KEY REFERENCES Manager (Mgr_id),
	C_fname varchar(50) FOREIGN KEY REFERENCES Cashier (C_fname)
);


 ------------------Insert Values--------------------------------

  ---Manager---
INSERT INTO Manager
VALUES (101,'Hafiz Abdullah','Manzoor','0308-4080900','Lahore');

---Employee---
INSERT INTO Employee 
VALUES ('Ahmad','Yqoob','0301-2345678','Gujranwala');
INSERT INTO Employee 
VALUES ('Tanveer','Ahmad','0308-7634890','Lahore');
INSERT INTO Employee 
VALUES ('Hassan','Rafiq','0309-7634988','Gujranwala');

 ---Stock---
INSERT INTO Stock
VALUES ('Panadol','Fever','TDX',05,60,101);
INSERT INTO Stock
VALUES ('Flagyl','parasitic infections','UIJ',45,35,101);
INSERT INTO Stock
VALUES ('Zyrtec','Allergy','JHG',45,65,101);
INSERT INTO Stock
VALUES ('Acetaminophen','pain reliever','ABC',15,50,101);
INSERT INTO Stock
VALUES ('Clonazepam','Panic disorder','EFG',20,40,101 )

---Medicine---
INSERT INTO Medicine
VALUES ('Panadol',5,1026);
INSERT INTO Medicine
VALUES ('Flagyl',3,1027);
INSERT INTO Medicine
VALUES ('Zyrtec',7,1028);

---Customer---
INSERT INTO Customer
VALUES ('Zahid','Ayub','Male',2,303);
INSERT INTO Customer
VALUES ('Parveen','Raza','Female',1,301);
INSERT INTO Customer
VALUES ('Waqas','Amjad','Male',3,302);

-----Bill-----
INSERT INTO Bill 
VALUES (3,34,'2020-07-12',1102);
INSERT INTO Bill 
VALUES (2,45,'2020-07-15',1101);
INSERT INTO Bill 
VALUES (2,45,'2020-07-17',1103);

-----Cahier----
INSERT INTO Cashier
VALUES ('Numan','Ali','0304-9473833','Gujranwala',2201);

-----Record----
INSERT INTO Record
VALUES ('2020-07-12',15,1500,600,101,'Numan');
INSERT INTO Record
VALUES ('2020-07-15',34,3400,900,101,'Numan');
INSERT INTO Record
VALUES ('2020-07-17',45,6500,1200,101,'Numan');

--------------------Search Tables---------------------------------
/*
-----Stock----
SELECT * FROM Stock
WHERE D_name LIKE 'a%';

----Employee---
SELECT * FROM Employee
WHERE E_fname LIKE '%r';

----Customer----
SELECT * FROM Customer
WHERE Cus_lname LIKE 'a%d';

-----Medicine----
SELECT * FROM Medicine
WHERE M_name LIKE '_y%';

----Employee---
SELECT * FROM Employee
WHERE E_fname LIKE '[TH]%';

----Stock----
SELECT * FROM Stock
WHERE D_company LIKE '[!ua]%';
*/

--------------------Update Tables---------------------------------
/*
-----Manager---
UPDATE Manager
SET M_address = 'Gujranwala'
WHERE Mgr_id = 1001;
--Select * From Manager;

----Employee---
UPDATE Employee
SET E_fname = 'Afaq', E_lname= 'Raheem',E_address='Multan'
WHERE E_id = 3;
--Select * From Employee;

-----Customer----
UPDATE Customer
SET Cus_fname = 'Reman', Cus_lname= 'Shah'
WHERE Cus_id = 1102;
--Select * From Customer;

-----Stock---
UPDATE Stock
SET D_name = 'Brufyn', D_cost= 80,D_qnty=15
WHERE D_id =1002;
--Select * From Stock;

----Medicine---
UPDATE Medicine
SET M_name = 'Clonazepam', M_qnty= 40
WHERE M_id =301;
--Select * FROM Medicine;

*/

------------------Delete Tables----------------------------------
/*
----Employee---
DELETE FROM Employee
WHERE E_fname='Ahmad';
Select * FROM Employee

----Stock---
DELETE FROM Stock
WHERE D_id=1028;
Select * FROM Stock;

----Medicine---
DELETE FROM Medicine
WHERE M_id=302;
Select * FROM Medicine;

----Customer---
DELETE FROM Customer
WHERE Cus_id=1102;
Select * FROM Customer;

----Bill---
DELETE FROM Bill
WHERE B_reciedId=2202;
Select * FROM Bill;
*/


------------------Join Tables----------------------------------
/*
----Bill and Customer---
SELECT Bill.B_reciedId, 
Customer.Cus_fname,Customer.Cus_lname,Customer.Cus_gender
FROM Bill 
JOIN Customer
ON Customer.Cus_id =Bill.Cust_id;

----Medicine And Stock---
SELECT Medicine.M_name, 
Stock.D_id,Stock.D_name,Stock.D_cost,Stock.D_qnty,Stock.D_company
FROM Medicine 
JOIN Stock
ON Stock.D_name =Medicine.M_name;

*/

------------------Add Column----------------------------------
/*
alter table Manager
add Gender varchar(90);
select *from Manager;
*/
------------------Drop Column----------------------------------
/*
alter table Stock
drop column D_category;
select *from Stock;
*/

------------------Triggers----------------------------------
/*
Create trigger trgafterinsert on Customer
after insert
as
declare @var int;
select @var=i.M_id from inserted i;
UPDATE Stock
SET  D_qnty=D_qnty-1
WHERE @var=D_id;
Go
*/
------------------Sum Function----------------------------------
/*
SELECT SUM(M_qnty)
FROM Medicine;
*/
------------------Avg Function----------------------------------
/*
Select AVG(R_gtotal)
FROM Record
*/

------------------Display Tables----------------------------------
Select * From Manager;
Select * From Employee;
Select * From Stock;
Select * From Medicine;
Select * From Customer;
Select * From Bill;
Select * From Cashier;
Select * From Record;

------------------Drop Tables----------------------------------

drop table Manager;
drop table Employee;
drop table Stock;
drop table Medicine;
drop table Customer;
drop table Bill;
drop table Cashier;
drop table Record;

