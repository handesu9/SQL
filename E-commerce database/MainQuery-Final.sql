create table Customer (
CustID int not null,
CustName nvarchar (50) not null,
CustPhone char (10) not null,
CustMail nvarchar (50),
Primary key (CustID));

create table Manager (
ManID int not null,
ManName nvarchar(50) not null
Primary key (ManID));

create table Employee (
EmpID int not null,
EmpName nvarchar(50) not null,
EmpExp int,
EmpSal int not null,
EmpPhone char(10) not null,
Empgender tinyint not null, 
ManID int not null,
Constraint EmpPK Primary key (EmpID),
Constraint fkManID
	Foreign key (ManID)
	References Manager (ManID));

create table Product (
ProdID int not null,
ProdName nvarchar(50) not null,
EnterTime date not null,
StoreAmount int,
InvID int,
Constraint ProdPk Primary key (ProdID)
);

create table Inventory (
InvID int not null,
InvName nvarchar(50) not null,
InvSize int not null,
CapInf float, 
InvAdress varchar (50) not null,
StoreAmount int,
Constraint Invpk  Primary key (InvID));

create table Sales (
	SaleID int not null,
	CustID int not null,
	ProdID int not null,
	EmpID int not null,
	SalAmount int not null,
	Constraint SalePK Primary key (SaleID),
	Constraint fkCustID
	Foreign Key (CustID)
	References Customer (CustID),
Constraint fkProdID
	Foreign Key (ProdID)
	References Product (ProdID),
Constraint fkEmpID
	Foreign Key (EmpID)
	References Employee (EmpID)
	);

	Create table Dependent (
EmpID int not null,
dependent_name char(50),
Relationship varchar(10),
Constraint PKDep Primary key (EmpID, dependent_name),
Constraint DepFK FOREIGN KEY (EmpID) REFERENCES Employee(EmpID) ON DELETE CASCADE);

Create table Store(
StoreAmount int not null,
InvID int ,
Constraint StorePK Primary Key(StoreAmount)
);


ALTER TABLE Product
ADD FOREIGN KEY (InvID) REFERENCES Inventory(InvID);

ALTER TABLE Product
ADD FOREIGN KEY (StoreAmount) REFERENCES Store(StoreAmount);

ALTER TABLE Inventory
ADD FOREIGN KEY (StoreAmount) REFERENCES Store(StoreAmount);


insert into Customer values (111,'Ahmet Sarý', '1212121212','aaaaa@aaa.com');
insert into Customer values (222,'Hande Mavi', '24323423','sdfsa@aaa.com');
insert into Customer values (333,'Veli Mor', '1786543452','aagfhghfha@aaa.com');
insert into Customer values (444,'Ece Altýn', '3647589564','asdfdfgsdfaa@aaa.com');
insert into Customer values (555,'Ayþe Gümüþ', '1928374657','aaasdasda@aaa.com');
insert into Customer values (666,'Mustafa Bronz', '8765679876','aavxcvxca@aaa.com');
insert into Customer values (777,'Kadir Deli', '1099877534','aawerwera@aaa.com');
insert into Customer values (888,'Oðuzhan Soylu', '2456789824','aczczcxa@aaa.com');
insert into Customer values (999,'Mark Luther', '2456787645','arwerwea@aaa.com');
insert into Customer values (101,'Jhon Wick', '9873458745','aaczxvvcbnva@aaa.com');
insert into Customer values (102,'Kane Iron', '2535466789','rwwerra@aaa.com');
insert into Customer values (103,'Aleyna Aydýn', '8787655443','ouduyytu@aaa.com');
insert into Customer values (104,'Can Lütfi', '4354557565','qyucxcvx@aaa.com');
insert into Customer values (105,'Nazlý Kara', '9872346178','sdfgfhjk@aaa.com');
insert into Customer values (106,'Kadir Kýlýç', '9988334455','mkhyu@aaa.com');
insert into Customer values (107,'Alper Tamer', '1283746586','pokljhhg@aaa.com');
insert into Customer values (108,'Fatma Önder', '9998887776','sadfghjka@aaa.com');
insert into Customer values (109,'Ýpek Barýþ', '5566442211','xcvbnmö@aaa.com');
insert into Customer values (110,'Emre Aksakal', '9988665544','aqwertyu@aaa.com');
insert into Customer values (119,'Deniz Tarla', '7766112233','ddaadfsdfsdfg@aaa.com');


insert into Manager values (999,'Hakan Tas');
insert into Manager values (998,'Melek Dost');
insert into Manager values (997,'Rize Ankara');
insert into Manager values (996,'Sultan Kiraz');
insert into Manager values (995,'Emre Akbas');
insert into Manager values (994,'Emine Akar');
insert into Manager values (993,'Ali Aksu');


insert into Employee values (11,'Talan Toran',3,4560,1122334455,1,999);
insert into Employee values (12,'Ceren Tarar',3,4760,1313131313,0,998);
insert into Employee values (13,'Ahmet Yapdý',5,4260,6565656565,1,996);
insert into Employee values (14,'Sahil Kasým',6,4770,9876857674,0,997);
insert into Employee values (15,'Selin Ocak',2,4870,9876456345,0,998);
insert into Employee values (16,'Dolunay Altýnok',1,5555,2535465342,0,999);
insert into Employee values (17,'Ýlaysu Arikan',5,5345,2536475687,0,995);
insert into Employee values (18,'Buse Kolin',6,6543,9988776633,0,995);
insert into Employee values (21,'Ahmet Ay',1,9872,7364978222,1,998);


insert into Store values (1500,null);
insert into Store values (1900,null);
insert into Store values (2500,null);
insert into Store values (500,null);

insert into Inventory values (1,'Sisli',2000,45,'sisli',1500);
insert into Inventory values (2,'Hisar',4000,55,'Rumelihisarý',1900);
insert into Inventory values (3,'Etiler',5000,75,'Etiler',2500);
insert into Inventory values (4,'Bebek',1000,95,'Bebek',500);


insert into Product values (1,'phone','2021-10-14',1500,1);
insert into Product values (2,'laptop','2021-11-14',1900,4);
insert into Product values (3,'keyboard','2021-03-14',2500,3);
insert into Product values (4,'mouse','2021-11-14',500,3);
insert into Product values (5,'headphone','2021-12-25',1500,2);

insert into Sales values (1,101,1,11,1);
insert into Sales values (2,102,2,13,3);
insert into Sales values (3,103,3,14,2);
insert into Sales values (4,104,1,15,1);
insert into Sales values (5,105,2,11,2);
insert into Sales values (6,110,3,14,1);
insert into Sales values (7,110,4,14,3);

insert into dependent values (11,'John','son');
insert into dependent values (12,'George','Husband');
insert into dependent values (13,'Turi','Father');
insert into dependent values (14,'Harvey','daughter');


-- 1. Which customers have purchased less than 3 times ?

SELECT C.CustName
FROM Customer C
WHERE C.CustID In (SELECT S.CustID
                   FROM Sales S inner join Product P on P.ProdID=S.ProdID
				   WHERE S.SalAmount < 3)


-- 2. Which employee sells the least? What is name her/him manager?

SELECT S.SalAmount, E.EmpName, M.ManName
FROM  Sales S INNER JOIN EMPLOYEE E ON E.EmpID=S.EmpID
			  INNER JOIN Manager M ON E.ManID=M.ManID
WHERE E.EmpID  =(SELECT E1.EmpID
					   FROM (SELECT S.EmpID, SUM(S.SalAmount) AS SalAmount
					         FROM Sales S
					         GROUP BY S.EmpID)E1
					   WHERE E1.SalAmount =(SELECT MIN(E2.SalAmount)
										   FROM (SELECT S.EmpID, SUM(S.SalAmount) AS SalAmount
					                       FROM Sales S
					                       GROUP BY S.EmpID)E2))   
	   	  

-- 3.List the names of managers with at least 2 employees.

SELECT DISTINCT M.ManName
FROM EMPLOYEE E, MANAGER M
WHERE E.ManID = M.ManID AND E.ManID IN
      (SELECT E.ManID 
       FROM EMPLOYEE E, MANAGER M
       WHERE E.ManID=M.ManID
       GROUP BY E.ManID 
       HAVING COUNT(*) > 1 )


--4.Which employee has the most experience yet receives the lowest salary?

SELECT DISTINCT E.EmpName 
FROM Employee E 
WHERE E.EmpSal = (SELECT MIN(E2.EmpSal)
                  FROM Employee E2 
                  WHERE E2.EmpExp = (SELECT MAX(E3.EmpExp)
				                     FROM Employee E3)  )
				  
--5.Find the manager by name that are not managing any employees.

SELECT DISTINCT M.ManName
FROM  MANAGER M
WHERE NOT EXISTS (SELECT * FROM Employee E WHERE E.ManID=M.ManID )
ORDER BY M.ManName
      


--6.Find the sale information about laptop

USE master 
GO

CREATE PROCEDURE dbo.uspGetSaledProductName @ProdName nvarchar(30)
AS
SELECT * 
FROM Sales S, Product P
WHERE S.ProdID=P.ProdID AND P.ProdName = @ProdName
GO

EXEC dbo.uspGetSaledProductName @ProdName = 'laptop'



--7.Find class of cutomers

USE master 
GO
CREATE PROCEDURE dbo.ratingsofcustomers
@CustomerID INT
AS
BEGIN
	DECLARE @message VARCHAR
	DECLARE @numSale INT 
	SET @numSale = (SELECT SUM(S.SalAmount)
					FROM Sales S
					WHERE S.CustID= @CustomerID)
	IF @numSale > 2
		PRINT 'Super Class. Good job.' 
		ELSE IF @numSale >1
		PRINT 'Middle Class.'
		ELSE IF @numSale >0
		PRINT 'Upper Class.'
		ELSE 
		PRINT 'No Sales.'
		END
		

		EXECUTE dbo.ratingsofcustomers @CustomerID=102
		


--8. Find Left Product Amount

USE master 
GO

CREATE PROCEDURE dbo.LeftProductAmount @ProdID INT
AS
DECLARE @a INT
DECLARE @b INT


SET @a = (SELECT SUM(S1.SalAmount)
FROM (SELECT S.SalAmount
FROM Sales S
WHERE S.ProdID=@ProdID) AS S1)

SELECT @b = (SELECT SUM(S2.StoreAmount)
FROM (SELECT P.StoreAmount 
FROM Product P
WHERE P.ProdID=@ProdID) AS S2)
PRINT @b-@a

GO

EXEC dbo.LeftProductAmount @ProdID = 1


--9. Find dependents of employee
USE master 
GO

CREATE PROCEDURE dbo.dependentinfo @EmpId INT
AS

DECLARE @dalga1 VARCHAR (15)
DECLARE @dalga2 VARCHAR (15)
SET @dalga2 = (SELECT D.dependent_name
			FROM Dependent D
			WHERE D.EmpID = @EmpId)
SET @dalga1 =  (SELECT D.Relationship
                FROM Dependent D  
                WHERE D.EmpID = @EmpId)
IF @dalga1 is not null 
print @dalga2 +' is '+ @dalga1 +' of this employee'

GO

EXEC dbo.dependentinfo @EmpId = 11



--10. Find which Employee sold Keyboard and Mouse.

SELECT DISTINCT E.EmpName 
FROM Sales S INNER JOIN Product P ON P.ProdID = S.ProdID 
			 INNER JOIN Employee E ON E.EmpID = S.EmpID
 
WHERE P.ProdName= 'Keyboard'

INTERSECT

SELECT DISTINCT E.EmpName 
FROM Sales S INNER JOIN Product P ON P.ProdID = S.ProdID 
			 INNER JOIN Employee E ON E.EmpID = S.EmpID
 
WHERE P.ProdName= 'Mouse'