CREATE TABLE Bank (
    BankCode VARCHAR(3) PRIMARY KEY ,
    BankName VARCHAR(100) NOT NULL,
    HeadOffice VARCHAR(100),
    Branches INT CHECK (Branches > 0)
);

INSERT INTO Bank VALUES('SBT', 'State Bank of Travancore', 'Ernakulam', 50);
INSERT INTO Bank VALUES('SBI', 'State Bank of Inda', 'Mumbai', 50);
INSERT INTO Bank VALUES('FB', 'Federal Bank', 'Ernakulam', 20);
INSERT INTO Bank VALUES('HDF', 'HDFC Bank', 'Munnar', 40);

 drop table bank;
CREATE TABLE Branch (
    BranchId INT PRIMARY KEY,
    BranchName VARCHAR(100) DEFAULT 'New Delhi',
    BankId VARCHAR(3),
    CONSTRAINT fk_bank FOREIGN KEY (BankId) REFERENCES Bank(BankCode)
    on delete cascade
);
INSERT INTO Branch VALUES(1, 'Kottayam', 'SBT');
INSERT INTO Branch VALUES(2, 'Ernakulam', 'SBI');
INSERT INTO Branch VALUES(3, 'New Delhi', 'SBI');
INSERT INTO Branch VALUES(4, 'Kottayam', 'HDF');

alter table branch drop primary key;

create view bank_head_office  as  select bankcode,bankname,headoffice,branches from bank where headoffice ='Ernakulam';

select * from bank_head_office;


create view bank_branch as select t1.bankcode,t1.bankname,t1.headoffice,t1.branches from bank t1  join branch t2  on t1.bankcode=t2.bankid where t2.branchname='Kottayam';

select * from bank_branch;