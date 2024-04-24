CREATE TABLE Movies_Data(
    Movie_ID INTEGER PRIMARY KEY,
    Movie_Name Varchar(255),
    Release_Date date,
    Duration_min INTEGER
);

INSERT INTO Movies_Data (Movie_ID, Movie_Name, Release_Date, Duration_min) VALUES (1,"The God Father","1972-04-20",120);
INSERT INTO Movies_Data (Movie_ID, Movie_Name, Release_Date, Duration_min) VALUES (2,"The Dark Knight","2008-04-19",125);
INSERT INTO Movies_Data (Movie_ID, Movie_Name, Release_Date, Duration_min) VALUES (3,"Pulp Fiction","1994-03-18",130);
INSERT INTO Movies_Data (Movie_ID, Movie_Name, Release_Date, Duration_min) VALUES (4,"Forest Gump","1994-09-22",120);
INSERT INTO Movies_Data (Movie_ID, Movie_Name, Release_Date, Duration_min) VALUES (5,"Inception","2010-08-14",135);

SELECT * from Movies_Data;

CREATE TABLE Media(
    Media_ID Integer PRIMARY KEY,
    Movie_ID Integer,  
    Media_Type VARchar(255),
    File_Path VARChar(255),
    FOREIGN KEY (Movie_ID) REFERENCES Movies_Data(Movie_ID)
);

INSERT INTO Media (Media_ID,Movie_ID,Media_Type,File_Path) VALUES (101,1,'Img','https://www.imdb.com/title/tt0068646/');
INSERT INTO Media (Media_ID,Movie_ID,Media_Type,File_Path) VALUES (102,2,'Img','https://www.imdb.com/title/tt0468569/?ref_=chttp_t_3');
INSERT INTO Media (Media_ID,Movie_ID,Media_Type,File_Path) VALUES (103,3,'Img','https://www.imdb.com/title/tt0110912/?ref_=chttp_t_8');
INSERT INTO Media (Media_ID,Movie_ID,Media_Type,File_Path) VALUES (104,4,'Img','https://www.imdb.com/title/tt0109830/?ref_=chttp_t_11');
INSERT INTO Media (Media_ID,Movie_ID,Media_Type,File_Path) VALUES (105,5,'Img','https://www.imdb.com/title/tt1375666/?ref_=chttp_t_14');
INSERT INTO Media (Media_ID,Movie_ID,Media_Type,File_Path) VALUES (106,5,'Video','https://www.youtube.com/watch?v=YoHD9XEInc0');
INSERT INTO Media (Media_ID,Movie_ID,Media_Type,File_Path) VALUES (107,1,'Video','https://www.youtube.com/watch?v=YoHD9XEInc0');
Select * from Media;

CREATE TABLE Genre(
    Genre_ID Integer PRIMARY KEY,
    Genre_Name Varchar(255)
);

INSERT INTO Genre (Genre_ID,Genre_Name) VALUES (201,'Drama');
INSERT INTO Genre (Genre_ID,Genre_Name) VALUES (202,'Action');
INSERT INTO Genre (Genre_ID,Genre_Name) VALUES (203,'Comedy');
INSERT INTO Genre (Genre_ID,Genre_Name) VALUES (204,'Thriller');

Select * from Genre;

Create Table Movie_Genre(
    Movie_ID INT,
    Genre_ID Int,
    FOREIGN KEY (Movie_ID) REFERENCES Movies_Data(Movie_ID),
    FOREIGN KEY (Genre_ID) REFERENCES Genre (Genre_ID)
);

Insert INTO Movie_Genre (Movie_ID, Genre_ID) VALUES (1,201);
Insert INTO Movie_Genre (Movie_ID, Genre_ID) VALUES (2,202);
Insert INTO Movie_Genre (Movie_ID, Genre_ID) VALUES (3,201);
Insert INTO Movie_Genre (Movie_ID, Genre_ID) VALUES (4,201);
Insert INTO Movie_Genre (Movie_ID, Genre_ID) VALUES (4,203);
Insert INTO Movie_Genre (Movie_ID, Genre_ID) VALUES (5,204);

Select * from Movie_Genre;


CREATE TABLE User(
    User_ID Integer PRIMARY KEY,
    User_Name Varchar(255)
);

Insert into User (User_ID,User_Name)
VALUES
(501,"John"),
(502,"Sam"),
(503,"Peter"),
(504,"Fran");

SELECT * from User;

Create TABLE Movie_Review(
    Movie_ID Int,
    User_ID Int,
    Review VARCHAR (255),
    FOREIGN KEY (Movie_ID) REFERENCES Movies_Data(Movie_ID),
    FOREIGN KEY (User_ID) REFERENCES User (User_ID)
);

Insert into Movie_Review (Movie_ID, User_ID,Review)
VALUES
(1,501,"Good"),
(1,502,"Very Good"),
(2,501,"Average"),
(2,504,"Excellent"),
(3,503,"Good"),
(4,502,"Not Good"),
(5,501,"Excellent");

SELECT * from Movie_Review;

CREATE TABLE Artist(
    Artist_ID Integer PRIMARY KEY,
    Artist_Name Varchar(255)
);

Insert into Artist (Artist_ID,Artist_Name)
VALUES
(1001,"Leonardo"),
(1002,"Cillian"),
(1003,"Christian Bale"),
(1004,"Tom Hanks"),
(1005,"Christian Bale"),
(1006,"Tom Hanks"),
(1007,"Marlon Brando"),
(1008,"Uma Thurman");

SELECT * FROM Artist;

CREATE TABLE Skills(
    Skill_ID Integer PRIMARY KEY,
    Skill_Name Varchar(255)
);

Insert into Skills (Skill_ID,Skill_Name)
VALUES
(601,"Dance"),
(602,"Fight"),
(603,"Sing");

SELECT * FROM Skills;


CREATE TABLE Artist_Skills(
    Artist_ID Integer,
    Skill_ID Integer,
    FOREIGN KEY (Artist_ID) REFERENCES Artist(Artist_ID),
    FOREIGN KEY (Skill_ID) REFERENCES Skills (Skill_ID)
);

Insert into Artist_Skills (Artist_ID,Skill_ID)
VALUES
(1001,601),
(1001,602),
(1002,603),
(1003,602),
(1004,601),
(1005,602),
(1007,601),
(1008,601);

SELECT * FROM Artist_Skills;

Create Table Roles(
    Role_ID int PRIMARY KEY,
    Role_Name VARCHAR(255),
    Artist_ID Int,
    Movie_ID Int,
    FOREIGN KEY (Artist_ID) REFERENCES Artist(Artist_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movies_Data(Movie_ID)
);

INSERT INTO Roles (Role_ID,Role_Name,Artist_ID,Movie_ID) 
Values 
(701,"LeadRole",1001,5),
(702,"Son",1004,4),
(703,"Villain",1002,5),
(704,"LeadRole",1003,2),
(705,"Grandfather",1007,1),
(706,"LeadRole",1005,2),
(707,"LeadRole",1008,3);

SELECT * FROM Roles;

Select * from Movies_Data;

UPDATE Artist
Set Artist_Name="Vito Corleone"
WHERE Artist_ID=1005;

Select Movies_Data.Movie_ID, Movies_Data.Movie_Name, Media.Media_Type
FROM Movies_Data
INNER JOIN Media on Media.Movie_ID=Movies_Data.Movie_ID;

Select Movies_Data.Movie_ID, Movies_Data.Movie_Name, Genre.Genre_Name
FROM Movies_Data
INNER JOIN Genre, Movie_Genre on Movie_Genre.Movie_ID=Movies_Data.Movie_ID;

Select Movies_Data.Movie_ID, Movies_Data.Movie_Name, Movie_Genre.Genre_ID, Genre.Genre_Name
FROM Movies_Data
INNER JOIN Movie_Genre on Movie_Genre.Movie_ID=Movie_Genre.Movie_ID
INNER JOIN Genre on Genre.Genre_ID=Movie_Genre.Genre_ID;

SELECT Movies_Data.Movie_ID, Movies_Data.Movie_Name, Movie_Review.Review,User.User_Name
FROM Movies_Data
INNER JOIN Movie_Review on Movie_Review.Movie_ID=Movies_Data.Movie_ID
INNER JOIN User on User.User_ID=Movie_Review.User_ID;

Select Artist.Artist_Name, Artist_Skills.Skill_ID, Skills.Skill_Name
FROM Artist
INNER JOIN Artist_Skills on Artist_Skills.Artist_ID=Artist.Artist_ID
INNER JOIN Skills on Skills.Skill_ID=Artist_Skills.Skill_ID;

SELECT Artist.Artist_Name, Movies_Data.Movie_Name, Roles.Role_Name
FROM Artist
INNER JOIN Roles ON Roles.Artist_ID=Artist.Artist_ID
INNER JOIN Movies_Data on Movies_Data.Movie_ID=Roles.Movie_ID;



