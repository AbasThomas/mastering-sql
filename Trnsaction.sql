
CREATE DATABASE banks;

use banks;
CREATE TABLE Accounts (
  AccountID     INT            PRIMARY KEY,
  AccountHolder NVARCHAR(100)  NOT NULL,
  Balance       DECIMAL(15,2)  NOT NULL
);

CREATE TABLE TransactionLog (
  TransactionID INT            IDENTITY(1,1) PRIMARY KEY,
  FromAccount   INT            NULL  REFERENCES Accounts(AccountID),
  ToAccount     INT            NULL  REFERENCES Accounts(AccountID),
  Amount        DECIMAL(15,2)  NOT NULL,
  TxDate        DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),
  Status        NVARCHAR(20)   NOT NULL  -- e.g. 'Pending','Committed','RolledBack'
);


INSERT INTO Accounts (AccountID, AccountHolder, Balance) VALUES
  (1, 'Alice Adams',   1000.00),
  (2, 'Bob Baker',     1500.00),
  (3, 'Carol Clark',   500.00),
  (4, 'David Dawson',  2000.00),
  (5, 'Eva Emerson',   250.00);


  select *from Accounts
    select *from TransactionLog
	
  --transfer $20 from alice to bob atomically

  update Accounts set Balance = Balance - 200
  where AccountID = 1;
  
  Update Accounts set Balance = Balance + 200
  where AccountID= 2;
  insert into TransactionLog  (FromAccount,ToAccount, Amount,Status )

  values (1,2,200,'Committted')

  --only allow transfer if source has sufficient funds else rollback

  Drop table Accounts;
  drop table TransactionLog

  begin transaction SAFEfer
  declare @srcBal Decimal (15,2)
  Select @srcBal = Balance from Accounts where AccountID = 3 

  if @srcBal < 300
  Begin 
  Insert into TransactionLog(FromAccount, ToAccount, Amount, Status)
  Values(3,4,300.'ROLLBACK')
  ROLLBACK TRAN SAFEfer
  end 
  else
  begin
  update Accounts set balance =< 300
  where AccountID = 3;
  update accounts set balance += 300
  where accountID = 4
Insert into TransactionLog(FromAccount, ToAccount, Amount, Status)
Values(3,4,300.'Commited')
commit tran SAFEfer
end

