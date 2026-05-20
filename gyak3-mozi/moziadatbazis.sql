-- =============================================
-- Moziadatbazis - SQL inicializalos fajl
-- 2 tabla: rendezok + filmek (idegen kulccsal)
-- =============================================

CREATE DATABASE IF NOT EXISTS moziadatbazis
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_hungarian_ci;

USE moziadatbazis;

-- -----------------------------------------------
-- 1. tabla: rendezok
-- -----------------------------------------------
CREATE TABLE IF NOT EXISTS rendezok (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  nev           VARCHAR(100)  NOT NULL,
  szuletesi_ev  INT,
  nemzetiseg    VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO rendezok (nev, szuletesi_ev, nemzetiseg) VALUES
('Christopher Nolan',  1970, 'brit'),
('Bong Joon-ho',       1969, 'del-koreai'),
('Frank Darabont',     1959, 'amerikai'),
('Quentin Tarantino',  1963, 'amerikai'),
('Steven Spielberg',   1946, 'amerikai'),
('Peter Jackson',      1961, 'uj-zelandi'),
('Robert Zemeckis',    1952, 'amerikai'),
('David Fincher',      1962, 'amerikai'),
('Ridley Scott',       1937, 'brit'),
('Lana Wachowski',     1965, 'amerikai'),
('Martin Scorsese',    1942, 'amerikai'),
('Jonathan Demme',     1944, 'amerikai'),
('James Cameron',      1954, 'kanadai'),
('Denis Villeneuve',   1967, 'kanadai'),
('Alfonso Cuaron',     1961, 'mexikoi'),
('Damien Chazelle',    1985, 'amerikai'),
('Jordan Peele',       1979, 'amerikai'),
('Guillermo del Toro', 1964, 'mexikoi'),
('Wes Anderson',       1969, 'amerikai'),
('David Lynch',        1946, 'amerikai');

-- -----------------------------------------------
-- 2. tabla: filmek (rendezok.id idegen kulcs)
-- -----------------------------------------------
CREATE TABLE IF NOT EXISTS filmek (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  cim         VARCHAR(150)  NOT NULL,
  rendezo_id  INT           NOT NULL,
  ev          INT           NOT NULL,
  mufaj       VARCHAR(50)   NOT NULL,
  ertekeles   DECIMAL(3,1)  NOT NULL,
  jatekido    INT,
  FOREIGN KEY (rendezo_id) REFERENCES rendezok(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO filmek (cim, rendezo_id, ev, mufaj, ertekeles, jatekido) VALUES
-- Christopher Nolan (id=1)
('Inception',                        1, 2010, 'sci-fi',   8.8, 148),
('The Dark Knight',                  1, 2008, 'akcio',    9.0, 152),
('Interstellar',                     1, 2014, 'sci-fi',   8.6, 169),
('Memento',                          1, 2000, 'thriller', 8.4, 113),
('The Prestige',                     1, 2006, 'thriller', 8.5, 130),

-- Bong Joon-ho (id=2)
('Parasite',                         2, 2019, 'thriller', 8.6, 132),
('Okja',                             2, 2017, 'drama',    7.3, 118),
('Snowpiercer',                      2, 2013, 'sci-fi',   7.1, 126),

-- Frank Darabont (id=3)
('The Shawshank Redemption',         3, 1994, 'drama',    9.3, 142),
('The Green Mile',                   3, 1999, 'drama',    8.6, 189),
('The Mist',                         3, 2007, 'horror',   7.2, 126),

-- Quentin Tarantino (id=4)
('Pulp Fiction',                     4, 1994, 'krimi',    8.9, 154),
('Django Unchained',                 4, 2012, 'western',  8.4, 165),
('Inglourious Basterds',             4, 2009, 'haborus',  8.3, 153),
('Kill Bill Vol. 1',                 4, 2003, 'akcio',    8.1, 111),
('The Hateful Eight',                4, 2015, 'western',  7.8, 187),

-- Steven Spielberg (id=5)
('Schindler listaja',                5, 1993, 'drama',    8.9, 195),
('Saving Private Ryan',              5, 1998, 'haborus',  8.6, 169),
('Jurassic Park',                    5, 1993, 'akcio',    8.1, 127),
('E.T.',                             5, 1982, 'sci-fi',   7.9, 115),

-- Peter Jackson (id=6)
('A Gyurus Ur: A gyuru szovetsege', 6, 2001, 'fantasy',  8.8, 178),
('A Gyurus Ur: A ket torony',       6, 2002, 'fantasy',  8.7, 179),
('A Gyurus Ur: A kiraly visszater', 6, 2003, 'fantasy',  8.9, 201),

-- Robert Zemeckis (id=7)
('Forrest Gump',                     7, 1994, 'drama',    8.8, 142),
('Cast Away',                        7, 2000, 'drama',    7.8, 143),
('Back to the Future',               7, 1985, 'sci-fi',   8.5, 116),

-- David Fincher (id=8)
('Fight Club',                       8, 1999, 'thriller', 8.8, 139),
('Se7en',                            8, 1995, 'krimi',    8.6, 127),
('Gone Girl',                        8, 2014, 'thriller', 8.1, 149),
('The Social Network',               8, 2010, 'drama',    7.8, 120),

-- Ridley Scott (id=9)
('Gladiator',                        9, 2000, 'akcio',    8.5, 155),
('Blade Runner',                     9, 1982, 'sci-fi',   8.1, 117),
('The Martian',                      9, 2015, 'sci-fi',   8.0, 144),

-- Lana Wachowski (id=10)
('The Matrix',                      10, 1999, 'sci-fi',   8.7, 136),
('The Matrix Reloaded',             10, 2003, 'sci-fi',   7.2, 138),

-- Martin Scorsese (id=11)
('Goodfellas',                      11, 1990, 'krimi',    8.7, 146),
('The Departed',                    11, 2006, 'krimi',    8.5, 151),
('Taxi Driver',                     11, 1976, 'thriller', 8.2, 114),
('The Wolf of Wall Street',         11, 2013, 'drama',    8.2, 180),

-- Jonathan Demme (id=12)
('The Silence of the Lambs',        12, 1991, 'thriller', 8.6, 118),

-- James Cameron (id=13)
('Titanic',                         13, 1997, 'drama',    7.9, 194),
('Avatar',                          13, 2009, 'sci-fi',   7.8, 162),
('Terminator 2',                    13, 1991, 'akcio',    8.5, 137),

-- Denis Villeneuve (id=14)
('Arrival',                         14, 2016, 'sci-fi',   7.9, 116),
('Blade Runner 2049',               14, 2017, 'sci-fi',   8.0, 164),
('Dune',                            14, 2021, 'sci-fi',   8.0, 155),
('Prisoners',                       14, 2013, 'thriller', 8.1, 153),

-- Alfonso Cuaron (id=15)
('Gravity',                         15, 2013, 'sci-fi',   7.7,  91),
('Roma',                            15, 2018, 'drama',    7.7, 135),
('Children of Men',                 15, 2006, 'sci-fi',   7.9, 109),

-- Damien Chazelle (id=16)
('La La Land',                      16, 2016, 'roman',    8.0, 128),
('Whiplash',                        16, 2014, 'drama',    8.5, 107),

-- Jordan Peele (id=17)
('Get Out',                         17, 2017, 'horror',   7.7, 104),
('Us',                              17, 2019, 'horror',   6.8, 116),
('Nope',                            17, 2022, 'horror',   6.8, 130),

-- Guillermo del Toro (id=18)
('The Shape of Water',              18, 2017, 'roman',    7.3, 123),
('Pan Labyrinth',                   18, 2006, 'fantasy',  8.2, 118),

-- Wes Anderson (id=19)
('The Grand Budapest Hotel',        19, 2014, 'komedia',  8.1,  99),
('Asteroid City',                   19, 2023, 'komedia',  6.6, 105),

-- David Lynch (id=20)
('Mulholland Drive',                20, 2001, 'thriller', 7.9, 147),
('Blue Velvet',                     20, 1986, 'thriller', 7.7, 120);
