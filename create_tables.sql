CREATE SCHEMA soccer;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `Match`;
CREATE TABLE `Match` (
    mid INT NOT NULL PRIMARY KEY,
    date_time DATETIME NOT NULL,
    stadium VARCHAR(30) NOT NULL,
    home_goals INT NOT NULL,
    away_goals INT NOT NULL,

    home_tid INT NOT NULL,
    CONSTRAINT fk_match_home_tid FOREIGN KEY (home_tid) REFERENCES Team(tid),
    away_tid INT NOT NULL,
    CONSTRAINT fk_match_away_tid FOREIGN KEY (away_tid) REFERENCES Team(tid),

    CONSTRAINT CHK_match_home_away CHECK (home_tid<>away_tid)
);

DROP TABLE IF EXISTS Team;
CREATE TABLE Team (
    tid INT NOT NULL PRIMARY KEY,
    team_name VARCHAR(40) NOT NULL,
    city VARCHAR(30) NOT NULL,

    captain_id INT UNIQUE,
    CONSTRAINT fk_team_pid FOREIGN KEY (captain_id) REFERENCES Player(pid)
);

DROP TABLE IF EXISTS Player;
CREATE TABLE Player (
    pid INT NOT NULL PRIMARY KEY ,
    full_name VARCHAR(40) NOT NULL,
    position VARCHAR(20) NOT NULL,
    dob DATE NOT NULL,
    start_date DATE NOT NULL,

    current_tid INT NOT NULL,
    CONSTRAINT fk_player_tid FOREIGN KEY (current_tid) REFERENCES Team(tid)
);

DROP TABLE IF EXISTS played_in;
CREATE TABLE played_in (
    goals INT NOT NULL,
    minutes INT NOT NULL,

    tid INT NOT NULL,
    CONSTRAINT fk_pi_tid FOREIGN KEY (tid) REFERENCES Team(tid),
    mid INT NOT NULL,
    CONSTRAINT fk_pi_mid FOREIGN KEY (mid) REFERENCES `Match`(mid),
    pid INT NOT NULL,
    CONSTRAINT fk_pi_pid FOREIGN KEY (pid) REFERENCES Player(pid),

    PRIMARY KEY(tid, mid, pid),
    UNIQUE(mid, pid)
);

DROP TABLE IF EXISTS previous_teams;
CREATE TABLE previous_teams (
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    tid INT NOT NULL,
    CONSTRAINT fk_pt_tid FOREIGN KEY (tid) REFERENCES Team(tid),
    pid INT NOT NULL,
    CONSTRAINT fk_pt_pid FOREIGN KEY (pid) REFERENCES Player(pid),

    PRIMARY KEY(tid, pid)
);

SET FOREIGN_KEY_CHECKS = 1;