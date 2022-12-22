create database ResDb;

-- comment



create table Restuarant(

    [Id] INT IDENTITY(1,1), -- PRIMARY KEY , --  IDENTITY CONSTRAINT will automatically increment the values
    [Name] VARCHAR not null,
    [Cuisine] VARCHAR default('unknown'),
    [OpenTime] time,--hh:mm::ss [00:00:00 to 23:59:59]
    [CloseTime] time,
    [Phone] VARCHAR,-- check ([phone] is not null or [Email] is not null)-- varchar(10)
    [Website] VARCHAR,
    [Email] VARCHAR,
    [Zipcode] VARCHAR not null,
    PRIMARY KEY (Id)
    -- check constraint Age int check ( age > 17)
    --Candidate key(Id,Name)
    --CONSTRAINT [PK_ResturantId] PRIMARY KEY(Id)
    );

    --create index search
    --    on Restuarants(Cuisine,Zipcode);

    create table Users(
        [username] varchar PRIMARY KEY,
        [password] varchar,
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
        [username] varchar references Users(username), -- Foreign key from users table
        -- CONSTRAINT  [FK_RestuarantId] FOREIGN KEY(RestuarantId) References Restuarant,
        -- CONSTRAINT  [FK_Users_Username] FOREIGN KEY(username) References Users,
        -- CONSTRAINT [PK_ReviewsId] PRIMARY KEY(Id)
    );

    alter table Reviews 
    add PRIMARY key(Id);
GO