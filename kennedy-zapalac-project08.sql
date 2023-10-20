sqlite:////anvil/projects/tdm/data/lahman/lahman.db 

-- Question 1
SELECT tbl_name FROM sqlite_master WHERE type='table';

-- Question 2
SELECT * FROM people LIMIT 5;
SELECT * FROM batting LIMIT 5;
SELECT * FROM fielding LIMIT 5;
SELECT * FROM managers LIMIT 5;
SELECT * FROM teams LIMIT 5;
SELECT * FROM salaries LIMIT 5;
SELECT COUNT(*) FROM people;
SELECT COUNT(*) FROM batting;
SELECT COUNT(*) FROM fielding;
SELECT COUNT(*) FROM managers;
SELECT COUNT(*) FROM teams;
SELECT COUNT(*) FROM salaries;

-- Question 3
SELECT * FROM people  WHERE nameFirst = 'Mike' AND nameLast = 'Trout' LIMIT 5;

-- Question 4
SELECT playerID, teamID, HR, yearID FROM batting WHERE playerID ='troutmi01';
SELECT playerID, teamID, HR FROM batting WHERE playerID ='troutmi01' AND yearID = '2011';

--  Question 5
SELECT * FROM people WHERE nameFirst = 'Juan' AND nameLast = 'Soto' LIMIT 5;
SELECT playerID, teamID, HR, yearID FROM batting WHERE playerID = 'sotoju01' AND yearID = '2022' LIMIT 5;
SELECT p.nameLast, p.nameFirst, p.weight, p.height, p.birthYear, b.HR, b.teamID, b.yearID 
FROM batting AS b JOIN people AS p 
ON b.playerID = p.playerID 
WHERE p.playerID = 'sotoju01' AND b.yearID = '2022';