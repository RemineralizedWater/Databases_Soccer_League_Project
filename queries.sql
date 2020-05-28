-- Find the birth date and position of every player whose name starts with the letter T.
SELECT dob, `position`
FROM Player
WHERE `full_name` LIKE 't%';

-- OUTPUT:
-- +------------+----------+
-- | dob        | position |
-- +------------+----------+
-- | 1984-09-22 | Defender |
-- +------------+----------+

-- Find all the players who are currently playing for the team named "FC Barcelona".
SELECT Player.*
FROM player
INNER JOIN Team T on Player.current_tid = T.tid
WHERE team_name = 'FC Barcelona';

-- OUTPUT:
-- +-----+--------------+----------+------------+------------+-------------+
-- | pid | full_name    | position | dob        | start_date | current_tid |
-- +-----+--------------+----------+------------+------------+-------------+
-- |   1 | Lionel Messi | Forward  | 1987-06-24 | 1994-06-12 |           1 |
-- +-----+--------------+----------+------------+------------+-------------+

-- Find the players who are the captain of a team. List the player names and IDs, and also the team name. List only the players with a name starting with the letter T.
SELECT full_name, pid, team_name
FROM Player
INNER JOIN Team T on Player.pid = T.captain_id
WHERE full_name LIKE 't%';

-- OUTPUT:
-- +--------------+-----+---------------------+
-- | full_name    | pid | team_name           |
-- +--------------+-----+---------------------+
-- | Thiago Silva |   7 | Paris Saint-Germain |
-- +--------------+-----+---------------------+

-- Find all the draws or ties (matches without a winner). List the date and times, stadium of these matches.
SELECT date_time, stadium
FROM `Match`
WHERE home_goals = away_goals;

-- OUTPUT:
-- +---------------------+--------------------+
-- | date_time           | stadium            |
-- +---------------------+--------------------+
-- | 2019-10-12 09:00:00 | Santiago Bernabéu  |
-- | 2019-06-06 13:00:00 | Stamford Bridge    |
-- | 2019-12-02 07:00:00 | Parc des Princes   |
-- | 2020-02-02 15:00:00 | Allianz Arena      |
-- +---------------------+--------------------+

-- Find the total number of goals scored by each team during the year 2019.
Select goals.tid, goals.team_name, SUM(goals.total_goals)
FROM (
    SELECT tid, team_name, SUM(home_goals) AS total_goals
    FROM `Match`
    INNER JOIN Team T ON `Match`.home_tid = T.tid
    WHERE `Match`.date_time BETWEEN '2019-01-01' AND '2020-01-01'
    GROUP BY team_name

    UNION

    SELECT tid, team_name, SUM(away_goals) AS total_goals
    FROM `Match`
    INNER JOIN Team T ON `Match`.away_tid = T.tid
    WHERE `Match`.date_time BETWEEN '2019-01-01' AND '2020-01-01'
    GROUP BY team_name
) as goals

GROUP BY goals.team_name;

-- OUTPUT:
-- +-----+---------------------+------------------------+
-- | tid | team_name           | SUM(goals.total_goals) |
-- +-----+---------------------+------------------------+
-- |   9 | AC Milan            |                      6 |
-- |   5 | Arsenal             |                      4 |
-- |   8 | Bayern München      |                      1 |
-- |   4 | Chelsea             |                      2 |
-- |   1 | FC Barcelona        |                      0 |
-- |  10 | Juventus            |                      7 |
-- |   6 | Liverpool           |                      2 |
-- |   3 | Manchester United   |                      1 |
-- |   7 | Paris Saint-Germain |                      4 |
-- |   2 | Real Madrid         |                      2 |
-- +-----+---------------------+------------------------+

-- Find the names and IDs of the players who have never scored any goal.
SELECT full_name, Player.pid
FROM Player
INNER JOIN played_in ON played_in.pid = player.pid
WHERE played_in.goals = 0;

-- OUTPUT:
-- +-------------------+-----+
-- | full_name         | pid |
-- +-------------------+-----+
-- | Harry Maguire     |   3 |
-- | Manuel Neuer      |   8 |
-- | Alessio Romagnoli |   9 |
-- | Giorgio Chiellini |  10 |
-- +-------------------+-----+

-- For each player, find the total number of goals they scored. List the player names and IDs along with the number of goals.
SELECT full_name, player.pid, SUM(played_in.goals) as total_goals
FROM player
INNER JOIN played_in ON player.pid = played_in.pid
WHERE player.pid = played_in.pid
GROUP BY full_name;

-- OUTPUT:
-- +---------------------------+-----+-------------+
-- | full_name                 | pid | total_goals |
-- +---------------------------+-----+-------------+
-- | Alessio Romagnoli         |   9 |           0 |
-- | César Azpilicueta         |   4 |           1 |
-- | Giorgio Chiellini         |  10 |           0 |
-- | Harry Maguire             |   3 |           0 |
-- | Jordan Henderson          |   6 |           2 |
-- | Lionel Messi              |   1 |           3 |
-- | Manuel Neuer              |   8 |           0 |
-- | Pierre-Emerick Aubameyang |   5 |           2 |
-- | Sergio Ramos              |   2 |           1 |
-- | Thiago Silva              |   7 |           1 |
-- +---------------------------+-----+-------------+