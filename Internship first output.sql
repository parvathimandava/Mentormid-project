CREATE TABLE Loan(LoanNr_ChkDgt VARCHAR(50) PRIMARY KEY,Name VARCHAR(50),City VARCHAR(50),
State VARCHAR(50),Zip VARCHAR(50),Bank VARCHAR(40),BankState VARCHAR(50),NAICS VARCHAR(50),ApprovalDate DATE,ApprovalFY VARCHAR(4), Term INT,NoEmp INT,NewExist INT,CreateJob INT,RetainedJob INT,FranchiseCode INT,UrbanRural INT,RevLineCr VARCHAR(5),LowDoc VARCHAR(5),
ChgOffDate DATE,DisbursementDate DATE,DisbursementGross MONEY,BalanceGross MONEY,MIS_Status	VARCHAR(20),ChgOffPrinGr MONEY,GrAppv MONEY, SBA_Appv MONEY);

COPY Loan(LoanNr_ChkDgt,Name,City,State,Zip	Bank,BankState,NAICS,ApprovalDate,ApprovalFY,Term,NoEmp,NewExist,CreateJob,RetainedJob,FranchiseCode,UrbanRural,RevLineCr,LowDoc,ChgOffDate,DisbursementDate,DisbursementGross,BalanceGross,MIS_Status,ChgOffPrinGr,GrAppv,SBA_Appv
)
FROM ‘’
DELIMITER ‘,’
CSV HEADER;