--Let's create Genres table
CREATE TABLE Genres (
    genreid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

--Let's create Performers table
CREATE TABLE Performers (
    performerid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

--Let's create a junction table for Performers and Genres (many-to-many)
CREATE TABLE Performer_Genre (
    performerid INT,
    genreid INT,
    PRIMARY KEY (performerid, genreid),
    FOREIGN KEY (performerid) REFERENCES Performers(performerid),
    FOREIGN KEY (genreid) REFERENCES Genres(genreid)
);

--Let's create Albums table
CREATE TABLE Albums (
    albumid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    year_of_release INT
);

--Let's create a junction table for Performers and Albums (many-to-many)
CREATE TABLE Performer_Album (
    performerid INT,
    albumid INT,
    PRIMARY KEY (performerid, albumid),
    FOREIGN KEY (performerid) REFERENCES Performers(performerid),
    FOREIGN KEY (albumid) REFERENCES Albums(albumid)
);

--Let's create Tracks table
CREATE TABLE Tracks (
    trackid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INT, -- in seconds
    albumid INT,
    FOREIGN KEY (albumid) REFERENCES Albums(albumid)
);

--Let's create Collections table
CREATE TABLE Collections (
    collectionid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    year_of_release INT
);

--Let's create a junction table for Collections and Tracks (many-to-many)
CREATE TABLE Collection_Track (
    collectionid INT,
    trackid INT,
    PRIMARY KEY (collectionid, trackid),
    FOREIGN KEY (collectionid) REFERENCES Collections(collectionid),
    FOREIGN KEY (trackid) REFERENCES Tracks(trackid)
);