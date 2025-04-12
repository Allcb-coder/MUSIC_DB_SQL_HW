
--Let's create Genres table
CREATE TABLE genres (
    genreid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

--Let's create Performers table
CREATE TABLE performers (
    performerid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

--Let's create a junction table for Performers and Genres (many-to-many)
CREATE TABLE performer_genre (
    performerid INT,
    genreid INT,
    PRIMARY KEY (performerid, genreid),
    FOREIGN KEY (performerid) REFERENCES performers(performerid),
    FOREIGN KEY (genreid) REFERENCES genres(genreid)
);

--Let's create Albums table
CREATE TABLE albums (
    albumid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    year_of_release INT CHECK (
        year_of_release >= 1900 AND year_of_release <= EXTRACT(YEAR FROM CURRENT_DATE)
    )
);

--Let's create a junction table for Performers and Albums (many-to-many)
CREATE TABLE performer_album (
    performerid INT,
    albumid INT,
    PRIMARY KEY (performerid, albumid),
    FOREIGN KEY (performerid) REFERENCES performers(performerid),
    FOREIGN KEY (albumid) REFERENCES albums(albumid)
);

--Let's create Tracks table
CREATE TABLE tracks (
    trackid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INT CHECK (duration > 0), -- duration in seconds
    albumid INT,
    FOREIGN KEY (albumid) REFERENCES albums(albumid)
);

--Let's create Collections table
CREATE TABLE collections (
    collectionid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    year_of_release INT CHECK (
        year_of_release >= 1900 AND year_of_release <= EXTRACT(YEAR FROM CURRENT_DATE)
    )
);

--Let's create a junction table for Collections and Tracks (many-to-many)
CREATE TABLE collection_track (
    collectionid INT,
    trackid INT,
    PRIMARY KEY (collectionid, trackid),
    FOREIGN KEY (collectionid) REFERENCES collections(collectionid),
    FOREIGN KEY (trackid) REFERENCES tracks(trackid)
);
