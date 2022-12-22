create database ResDb;

-- comment



create table Restuarant(

    [Id] INT IDENTITY(1,1), -- PRIMARY KEY , --  IDENTITY CONSTRAINT will automatically increment the values
    [Name] VARCHAR(25) not null,
    [Cuisine] VARCHAR(25) default('unknown'),
    [OpenTime] time,--hh:mm::ss [00:00:00 to 23:59:59]
    [CloseTime] time,
    [Phone] VARCHAR(10),-- check ([phone] is not null or [Email] is not null)-- varchar(10)
    [Website] VARCHAR(20),
    [Email] VARCHAR(20),
    [Zipcode] VARCHAR(20) not null,
    PRIMARY KEY (Id)
    -- check constraint Age int check ( age > 17)
    --Candidate key(Id,Name)
    --CONSTRAINT [PK_ResturantId] PRIMARY KEY(Id)
    );

    --create index search
    --    on Restuarants(Cuisine,Zipcode);

    create table Users(
        [username] varchar(25),
        [password] varchar(max),
        PRIMARY key(username)
    );


    create table [Reviews](
        [Id] int IDENTITY(1,1),
        [OverallRating] float not null,
        [Comment] Varchar(max),
        [TableRating] int not null,
        [AmbienceRating] int not null,
        [ServiceRating] int not null,
        [RestuarantId] int references Restuarant(Id), -- Foreign key from Restuarant table
        [username] varchar(25) references Users(username), -- Foreign key from users table
        -- CONSTRAINT  [FK_RestuarantId] FOREIGN KEY(RestuarantId) References Restuarant,
        -- CONSTRAINT  [FK_Users_Username] FOREIGN KEY(username) References Users,
        -- CONSTRAINT [PK_ReviewsId] PRIMARY KEY(Id)
    );

    alter table Reviews 
    add PRIMARY key(Id);
GO


drop table Users;
/*alter table reviews 
    alter column username varchar(25)

alter table Users
    alter column [username] varchar(25)*/

-- DML Commands
-- INSERT, UPDATE AND DELETE

Insert into restuarant (Name, Cuisine,OpenTime,CloseTime,Phone,Website,Email,Zipcode) values('McDonalds','American','07:00:00','22:00:00','9876543210','http:mcdonalds.com','contactus@mcdonalds.com','110011')
Insert into restuarant (Name, Cuisine,OpenTime,CloseTime,Phone,Website,Email,Zipcode) values('Starbucks','Cafe','07:00:00','22:00:00','9876541230','http:starbucks.com','contactus@starbucks.com','110011')
Insert into restuarant (Name, Cuisine,OpenTime,CloseTime,Phone,Website,Email,Zipcode) values('Cofee Day','Cafe','07:00:00','22:00:00','9768543210','http:coffeeday.com','contactus@coffeeday.com','110011')


-- Insert into restuarant (Name, Cuisine,OpenTime,CloseTime,Phone,Website,Email,Zipcode) values('McDonalds','American','07:00:00','22:00:00','9876543210','http:mcdonalds.com','contactus@mcdonalds.com','110011')
--('Starbucks','Cafe','07:00:00','22:00:00','9876541230','http:starbucks.com','contactus@starbucks.com','110011')
--('Cofee Day','Cafe','07:00:00','22:00:00','9768543210','http:coffeeday.com','contactus@coffeeday.com','110011')

--delete from Restuarant where id=3
-- SET Foreign key checks=0

--TRUNCATE table Reviews
--Truncate table Restuarant;
-- SELECT -> dql 

select * from restuarant;
select * from reviews;
select * from Users;

-- select name, cuisine,phone,zipcode,email from Restuarant;

-- if we want to update table

update restuarant
set zipcode='220013' where name = 'starbucks'

/*update restuarant
set zipcode='220013' phone='2345678901' where name = 'starbucks'*/

-- DROP TABLE

-- insertion into review

insert into Users values('Kaveri priya','priya92'),('Pushpinder','pushpi21');

insert into Reviews values(4.2,'good',4.3,4.4,4.7,3,'kaveri priya');