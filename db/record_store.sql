DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  artist_id INT8 REFERENCES artists(id),
  quantity VARCHAR(255)
);
