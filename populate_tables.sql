SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `Match` VALUES (1, '2020-01-31 20:00:00', 'Camp Nou', 5, 4, 1, 2);
INSERT INTO `Match` VALUES (2, '2019-10-12 09:00:00', 'Santiago Bernabéu', 2, 2, 2, 6);
INSERT INTO `Match` VALUES (3, '2019-11-11 11:00:00', 'Old Trafford', 1, 3, 3, 7);
INSERT INTO `Match` VALUES (4, '2019-06-06 13:00:00', 'Stamford Bridge', 0, 0, 4, 1);
INSERT INTO `Match` VALUES (5, '2019-08-30 14:00:00', 'Emirates', 4, 2, 5, 4);
INSERT INTO `Match` VALUES (6, '2019-09-15 19:00:00', 'Stanley Park', 2, 3, 6, 10);
INSERT INTO `Match` VALUES (7, '2019-12-02 07:00:00', 'Parc des Princes', 1, 1, 7, 8);
INSERT INTO `Match` VALUES (8, '2020-02-02 15:00:00', 'Allianz Arena', 3, 3, 8, 3);
INSERT INTO `Match` VALUES (9, '2020-01-03 22:00:00', 'San Siro', 1, 2, 9, 5);
INSERT INTO `Match` VALUES (10, '2019-09-23 16:00:00', 'Juventus', 4, 6, 10, 9);

INSERT INTO Team VALUES (1, 'FC Barcelona', 'Barcelona', 1);
INSERT INTO Team VALUES (2, 'Real Madrid', 'Madrid', 2);
INSERT INTO Team VALUES (3, 'Manchester United', 'Trafford', 3);
INSERT INTO Team VALUES (4, 'Chelsea', 'London', 4);
INSERT INTO Team VALUES (5, 'Arsenal', 'London', 5);
INSERT INTO Team VALUES (6, 'Liverpool', 'Liverpool', 6);
INSERT INTO Team VALUES (7, 'Paris Saint-Germain', 'Paris', 7);
INSERT INTO Team VALUES (8, 'Bayern München', 'Munich', 8);
INSERT INTO Team VALUES (9, 'AC Milan', 'Milan', 9);
INSERT INTO Team VALUES (10, 'Juventus', 'Turin', 10);

INSERT INTO Player VALUES (1, 'Lionel Messi', 'Forward', '1987-06-24', '1994-06-12', 1);
INSERT INTO Player VALUES (2, 'Sergio Ramos', 'Defender', '1986-03-30', '1996-06-12', 2);
INSERT INTO Player VALUES (3, 'Harry Maguire', 'Defender', '1993-03-05', '2011-06-12', 3);
INSERT INTO Player VALUES (4, 'César Azpilicueta', 'Defender', '1989-08-28', '2001-06-12', 4);
INSERT INTO Player VALUES (5, 'Pierre-Emerick Aubameyang', 'Forward', '1989-06-18', '1995-06-12', 5);
INSERT INTO Player VALUES (6, 'Jordan Henderson', 'Midfielder', '1990-06-17', '1998-06-12', 6);
INSERT INTO Player VALUES (7, 'Thiago Silva', 'Defender', '1984-09-22', '1998-06-12', 7);
INSERT INTO Player VALUES (8, 'Manuel Neuer', 'Goalkeeper', '1986-03-27', '1991-06-12', 8);
INSERT INTO Player VALUES (9, 'Alessio Romagnoli', 'Defender', '1995-01-12', '2012-06-12', 9);
INSERT INTO Player VALUES (10, 'Giorgio Chiellini', 'Defender', '1984-08-14', '1990-06-12', 10);

INSERT INTO played_in VALUES (3, 78, 1, 1, 1);
INSERT INTO played_in VALUES (1, 90, 2, 2, 2);
INSERT INTO played_in VALUES (0, 84, 3, 3, 3);
INSERT INTO played_in VALUES (1, 76, 4, 4, 4);
INSERT INTO played_in VALUES (2, 76, 5, 5, 5);
INSERT INTO played_in VALUES (2, 83, 6, 6, 6);
INSERT INTO played_in VALUES (1, 90, 7, 7, 7);
INSERT INTO played_in VALUES (0, 57, 8, 8, 8);
INSERT INTO played_in VALUES (0, 68, 9, 9, 9);
INSERT INTO played_in VALUES (0, 42, 10, 10, 10);

INSERT INTO previous_teams VALUES ('1994-06-12', '2001-06-12', 5, 1);
INSERT INTO previous_teams VALUES ('1996-06-12', '2005-06-12', 9, 2);
INSERT INTO previous_teams VALUES ('2011-06-12', '2011-06-12', 10, 3);
INSERT INTO previous_teams VALUES ('2001-06-12', '2001-06-12', 2, 4);
INSERT INTO previous_teams VALUES ('1998-06-12', '1998-06-12', 1, 6);
INSERT INTO previous_teams VALUES ('1998-06-12', '1998-06-12', 2, 6);
INSERT INTO previous_teams VALUES ('1998-06-12', '1998-06-12', 7, 7);
INSERT INTO previous_teams VALUES ('1998-06-12', '1998-06-12', 6, 7);
INSERT INTO previous_teams VALUES ('2012-06-12', '2012-06-12', 7, 9);
INSERT INTO previous_teams VALUES ('1990-06-12', '1990-06-12', 4, 10);

SET FOREIGN_KEY_CHECKS = 1;