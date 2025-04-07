-- 1. Constructor Standings Table
CREATE TABLE constructor_standings (
    "Season" INT,
    "Position" INT,
    "Points" FLOAT,
    "Wins" INT,
    "Constructor" VARCHAR,
    "Nationality" VARCHAR,
    PRIMARY KEY ("Season", "Constructor")
);

CREATE TABLE driver_standings (
    "Season" INT,
    "Position" INT,
    "Points" FLOAT,
    "Wins" INT,
    "Driver" VARCHAR,
    "Nationality" VARCHAR,
    "Constructor" VARCHAR,
    PRIMARY KEY ("Season", "Driver"),
    FOREIGN KEY ("Season", "Constructor") REFERENCES constructor_standings("Season", "Constructor")
);

CREATE TABLE qualifying_results (
    "Season" INT,
    "Round" INT,
    "Race" VARCHAR,
    "Circuit" VARCHAR,
    "Driver" VARCHAR,
    "Constructor" VARCHAR,
    "Position" INT,
    "Q1" VARCHAR,
    "Q2" VARCHAR,
    "Q3" VARCHAR,
    PRIMARY KEY ("Season", "Round", "Driver"),
    FOREIGN KEY ("Season", "Constructor") REFERENCES constructor_standings("Season", "Constructor")
);

-- 4. Race Results Table
CREATE TABLE race_results (
    "Season" INT,
    "Round" INT,
    "Race" VARCHAR,
    "Date" DATE,
    "Circuit" VARCHAR,
    "Locality" VARCHAR,
    "Country" VARCHAR,
    "Driver" VARCHAR,
    "Constructor" VARCHAR,
    "Grid" INT,
    "Position" INT,
    "Points" FLOAT,
    "Status" VARCHAR,
    "Time" VARCHAR,
    "Fastest Lap Rank" VARCHAR,
    "Fastest Lap Time" VARCHAR,
    PRIMARY KEY ("Season", "Round", "Driver"),
    FOREIGN KEY ("Season", "Constructor") REFERENCES constructor_standings("Season", "Constructor")
);

-- Top constructors by average points
SELECT "Constructor", AVG("Points") AS avg_points
FROM constructor_standings
GROUP BY "Constructor"
ORDER BY avg_points DESC;

-- Drivers with most race wins
SELECT "Driver", COUNT(*) AS wins
FROM race_results
WHERE "Position" = 1
GROUP BY "Driver"
ORDER BY wins DESC;

SELECT r."Season", r."Driver", r."Constructor", r."Points", ds."Wins"
FROM race_results r
JOIN driver_standings ds
  ON r."Season" = ds."Season" AND r."Driver" = ds."Driver"
LIMIT 10;

