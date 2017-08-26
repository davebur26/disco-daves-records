DROP TABLE albums;
DROP TABLE artists;
DROP TABLE genres;


CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  url VARCHAR(255)
);

CREATE TABLE genres (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  artist_id INT8 REFERENCES artists(id),
  genre_id INT8 REFERENCES genres(id),
  quantity VARCHAR(255),
  buy_cost DECIMAL(3,2),
  sell_price DECIMAL(3,2),
  last_bought DATE,
  url VARCHAR(255)
);
