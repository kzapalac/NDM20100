sql sqlite:////anvil/projects/tdm/data/lahman/lahman.db

-- Question 1
SELECT * FROM seriespost WHERE yearID = 2022 AND round = 'WS';
SELECT 
    ROUND(CAST(SUM(HR) AS REAL)/SUM(H), 2) AS hr_rate, 
    ROUND(CAST(SUM(RBI) AS REAL)/SUM(H), 2) AS rbi_rate 
FROM 
    batting 
WHERE 
    yearID = 2022 AND teamID = 'HOU'; 

-- Question 2
SELECT
    b.playerID,
    p.nameFirst,
    p.nameLast,
    b.RBI
FROM
    batting AS b
JOIN
    people AS p
ON
    b.playerID = p.playerID
WHERE
    teamID = 'HOU' AND yearID = 2022
ORDER BY
    b.RBI ASC;
SELECT
    b.playerID,
    p.nameFirst,
    p.nameLast,
    b.RBI
FROM
    batting AS b
JOIN
    people AS p
ON
    b.playerID = p.playerID
WHERE
    teamID = 'HOU' AND yearID = 2022
ORDER BY
    b.RBI DESC;
SELECT
    b.playerID,
    p.nameFirst,
    p.nameLast,
    b.RBI
FROM
    batting AS b
JOIN
    people AS p
ON
    b.playerID = p.playerID
WHERE
    teamID = 'HOU' AND yearID = 2022
ORDER BY
    b.RBI DESC
LIMIT 1;

-- Question 3
SELECT COUNT(*) FROM allstarfull WHERE playerID = 'tuckeky01';
SELECT 
    playerID,
    COUNT(*) AS attendance 
FROM 
    allstarfull 
GROUP BY 
    playerID 
ORDER BY
    attendance DESC
LIMIT 1;
SELECT
    playerID,
    nameFirst,
    nameLast
FROM
    people
WHERE 
    playerID = 'mayswi01';

-- Question 4
SELECT
    playerID,
    AVG(salary) as avg_salary
FROM
    salaries
GROUP BY
    playerID
ORDER BY
    avg_salary DESC
LIMIT 100;

-- Question 5
SELECT
    name,
    AVG(HR) as avg_hr
FROM 
    teams
GROUP BY
    name
ORDER BY
    avg_hr DESC
LIMIT 1;