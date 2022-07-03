CREATE TABLE Basketball_Personnel (
    id char(64),
    basketballPersonnelName char(64) not null,
     age int,
    dateJoined DATE,
    PRIMARY KEY (id)
 );

CREATE TABLE Team (
    id char(64),
    teamName char(64) not null,
    postalCode char(64),
    PRIMARY KEY (id)
);

CREATE TABLE TeamInfo (
    postal_code char(64),
    city char(64),
    teamState char(64),
     PRIMARY KEY (postal_code)
);

 CREATE TABLE Player (
     pid char(64),
    nationality char(64),
    position char(64) not null,
    height int,
    ranking int not null,
    tid char(64) not null,
    PRIMARY KEY (pid),
    FOREIGN KEY (pid) REFERENCES Basketball_Personnel(id),
    FOREIGN KEY (tid) REFERENCES Team(id)
);

CREATE TABLE Coach (
    cid char(64),
    numberOfGamesCoached int,
    coachStartDate date not null,
    PRIMARY KEY (cid),
    FOREIGN KEY (cid) REFERENCES Basketball_Personnel(id)
);

CREATE TABLE Stadium (
    stadiumName char(64),
    city char(64),
    country char(64),
    PRIMARY KEY (stadiumName, city)
);


CREATE TABLE Game (
    referee char(64),
    winner char(64),
    sName char(64),
    sCity char(64),
    gameDateTime date,
    PRIMARY KEY (sName, sCity, gameDateTime),
    FOREIGN KEY (sName, sCity) REFERENCES Stadium(stadiumName, city)
);

CREATE TABLE Plays (
    pid char(64),
    sName char(64),
    sCity char(64),
    gDateTime date,
    totalPoints int,
    threePoints int,
    assists int,
    rebounds int,
    blocks int,
    PRIMARY KEY (pid, sName, sCity, gDateTime),
    FOREIGN KEY (pid) REFERENCES Basketball_Personnel(id),
    FOREIGN KEY (sName, sCity) REFERENCES Stadium(stadiumName, city),
    FOREIGN KEY (sName, sCity, gDateTime) REFERENCES Game(sName, sCity, gameDateTime)
);


CREATE TABLE Bettor (
    id char(64),
    bettorName char(64),
    totalAccountBalance float not null,
    bettorLevel char(64),
    PRIMARY KEY (id)
);


CREATE TABLE Bets (
    sName char(64),
    sCity char(64),
    gDateTime date,
    bid char(64),
    betAmount float not null,
    bidDate date,
    win BIT,
    winRatio float,
    PRIMARY KEY (sName, sCity, gDateTime, bid),
    FOREIGN KEY (sName, sCity, gDateTime) REFERENCES Game(sName, sCity, gameDateTime),
    FOREIGN KEY (bid) REFERENCES Bettor(id),
);


CREATE TABLE BetsWinAmount (
    betAmount float,
    win BIT,
    winRatio float,
    winAmount float,
    PRIMARY KEY (betAmount, win, winRatio)
);


CREATE TABLE Wallet (
    creditCardNumber char(16),
    walletExpiryDate date not null,
    CVV int not null,
    nameOnCard char(64) not null,
    bid char(64) not null,
    PRIMARY KEY (creditCardNumber),
    FOREIGN KEY (bid) REFERENCES Bettor(id)
);



CREATE TABLE Transactions (
    id char(64),
    reason char(64) not null,
    transactionDate date not null,
    amount float not null,
    bid char(64) not null,
    PRIMARY KEY (id),
    FOREIGN KEY (bid) REFERENCES Bettor(id)
);



--addition into player
INSERT INTO Player (pid, nationality, position, height, ranking, tid)
    VALUES ('GRA', 'USA', 'Guard', 193, 7, 'MIB');
INSERT INTO Player (pid, nationality, position, height, ranking, tid)
    VALUES ('PRA', 'Nigeria', 'Forward', 203, 5, 'TOR');
INSERT INTO Player (pid, nationality, position, height, ranking, tid)
    VALUES ('STA', 'New Zealand', 'Center', 211, 4, 'MEG');
INSERT INTO Player (pid, nationality, position, height, ranking, tid)
    VALUES ('BAA', 'USA', 'Center Forward', 206, 13, 'MIH');
INSERT INTO Player (pid, nationality, position, height, ranking, tid)
    VALUES ('JAA', 'USA', 'Center', 2008, 31, 'CLC');
INSERT INTO Player (pid, nationality, position, height, ranking, tid)
    VALUES ('LEJ', 'USA', 'Forward', 2060, 56, 'LAL');

--addition into team
INSERT INTO Team (id, teamName, postalCode)
    VALUES ('MIB', 'Milwaukee Bucks', '10000');
INSERT INTO Team (id, teamName, postalCode)
    VALUES ('TOR', 'Toronto Raptors', '10001');
INSERT INTO Team (id, teamName, postalCode)
    VALUES ('MEG', 'Memphis Grizzlies', '10002');
INSERT INTO Team (id, teamName, postalCode)
    VALUES ('MIH', 'Miami Heat', '10003');
INSERT INTO Team (id, teamName, postalCode)
    VALUES ('CLC', 'Cleveland Cavaliers', '10004');
INSERT INTO Team (id, teamName, postalCode)
    VALUES ('LAL', 'Los Angeles Lakers', '10005');

--addition into TeamInfo
INSERT INTO TeamInfo (postal_code, city, teamState)
    VALUES ('10000', 'Milwaukee', 'Wisconsin');
INSERT INTO TeamInfo (postal_code, city, teamState)
    VALUES ('10001', 'Toronto', 'Ontario');
INSERT INTO TeamInfo (postal_code, city, teamState)
    VALUES ('10002', 'Memphiz', 'Tennessee');
INSERT INTO TeamInfo (postal_code, city, teamState)
    VALUES ('10003', 'Miami', 'Florida');
INSERT INTO TeamInfo (postal_code, city, teamState)
    VALUES ('10004', 'Cleveland', 'Ohio');
INSERT INTO TeamInfo (postal_code, city, teamState)
    VALUES ('10005', 'Los Angeles', 'California');

--addition into stadium
INSERT INTO Stadium (stadiumName, city, country)
    VALUES ('Madison Square Garden', 'New York', 'USA');
INSERT INTO Stadium (stadiumName, city, country)
    VALUES ('Bell Centre', 'Quebec', 'Canada');
INSERT INTO Stadium (stadiumName, city, country)
    VALUES ('John Cain Arena', 'Melbourne', 'Australia');
INSERT INTO Stadium (stadiumName, city, country)
    VALUES ('FTX Arena', 'Miami', 'USA');
INSERT INTO Stadium (stadiumName, city, country)
    VALUES ('Wells Fargo Center', 'Philadelphia', 'USA');
INSERT INTO Stadium (stadiumName, city, country)
    VALUES ('Wide World of Sports Complex', 'Kissimmee', 'USA');

--addition to Coach
INSERT INTO Coach (cid, numberOfGamesCoached, coachStartDate)
    VALUES ('JBB', 390, '2020-02-19');
INSERT INTO Coach (cid, numberOfGamesCoached, coachStartDate)
    VALUES ('ERS', 1113, '2008-04-12');
INSERT INTO Coach (cid, numberOfGamesCoached, coachStartDate)
    VALUES ('TAJ', 227, '2019-06-11');
INSERT INTO Coach (cid, numberOfGamesCoached, coachStartDate)
    VALUES ('NIN', 308, '2018-06-14');
INSERT INTO Coach (cid, numberOfGamesCoached, coachStartDate)
    VALUES ('MIB', 719, '2018-05-17');

--addition to basketball_personnel
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('JBB', 'JB Bickerstaff', 43, '2020-02-19');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('ERS', 'Erik Spoelstra', 51, '2008-04-12');
INSERT INTO Basketball_Personnel(id, basketballPersonnelName, age, dateJoined)
    VALUES ('TAJ', 'Taylor Jenkins', 37, '2019-06-11');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('NIN', 'Nick Nurse', 54, '2018-06-14');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('MIB', 'Mike Budenholzer', 52, '2018-05-17');
INSERT INTO Basketball_Personnel(id, basketballPersonnelName, age, dateJoined)
    VALUES ('GRA', 'Grayson Allen', 26, '2018-1-21');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('PRA', 'Precious Achiuwa', 22 , '2020-01-20');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('STA', 'Steven Adams', 28, '2013-01-12');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('BAA', 'Bam Adebayo', 24, '2017-01-14');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('JAA', 'Jarrett Allen', 24, '2017-01-22');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('JOC', 'Joey Crawford', 70, '1977-04-13');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('LAH', 'Lauren Holtkamp', 41, '2000-12-21');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('TOB', 'Tony Brothers', 57, '1994-06-28');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('ZAZ', 'Zack Zarba', 47, '2004-10-04');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('BIK', 'Bill Kennedy', 55, '1995-05-05');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('KEM', 'Ken Mauer', 67, '1989-05-30');
INSERT INTO Basketball_Personnel (id, basketballPersonnelName, age, dateJoined)
    VALUES ('LEJ', 'LeBron James', 37, '2003-05-15');

--addition to game
INSERT INTO Game (referee, winner, sName, sCity, gameDateTime)
    VALUES ('Joey Crawford', 'LAL', 'Wide World of Sports Complex', 'Kissimmee', '2020-09-30');
INSERT INTO Game (referee, winner, sName, sCity, gameDateTime)
    VALUES ('Lauren Holtkamp', 'MIH', 'Wells Fargo Center', 'Philadelphia', '2019-08-22');
INSERT INTO Game (referee, winner, sName, sCity, gameDateTime)
    VALUES ('Tony Brothers', 'TOR', 'Bell Centre', 'Quebec', '2021-11-21');
INSERT INTO Game (referee, winner, sName, sCity, gameDateTime)
    VALUES ('Zach Zarba', 'MEG', 'Madison Square Garden', 'New York', '2022-04-12');
INSERT INTO Game (referee, winner, sName, sCity, gameDateTime)
    VALUES ('Bill Kennedy', 'CLC', 'FTX Arena', 'Miami', '2020-09-15');
INSERT INTO Game (referee, winner, sName, sCity, gameDateTime)
    VALUES ('Ken Mauer', 'MIB', 'John Cain Arena', 'Melbourne', '2021-08-08');

-- addition to wallet
INSERT INTO Wallet (creditCardNumber, walletExpiryDate, CVV, nameOnCard, bid)
    VALUES ('1111111111111111', '2025-01-07', 111, 'Ryan Crasta', 'RYCR');
INSERT INTO Wallet (creditCardNumber, walletExpiryDate, CVV, nameOnCard, bid)
    VALUES ('2222222222222222', '2024-12-31', 222, 'Sahil Mehra', 'SAME');
INSERT INTO Wallet (creditCardNumber, walletExpiryDate, CVV, nameOnCard, bid)
    VALUES ('3333333333333333', '2028-10-17', 333, 'Tom S Sunil', 'TOSU');
INSERT INTO Wallet (creditCardNumber, walletExpiryDate, CVV, nameOnCard, bid)
    VALUES ('4444444444444444', '2023-05-27', 444, 'Al Ali Fahd', 'ALFA');
INSERT INTO Wallet (creditCardNumber, walletExpiryDate, CVV, nameOnCard, bid)
    VALUES ('5555555555555555', '2024-09-17', 555, 'Kris M Read', 'KRRE');
    
--addition to plays
INSERT INTO Plays (pid, sName, sCity, gDateTime, totalPoints, threePoints, assists, rebounds, blocks)
    VALUES ('LEJ', 'Wide World of Sports Complex', 'Kissimmee', '2020-09-30', 24, 2, 5, 7, 1);
INSERT INTO Plays (pid, sName, sCity, gDateTime, totalPoints, threePoints, assists, rebounds, blocks)
    VALUES ('BAA', 'Wells Fargo Center', 'Philadelphia', '2019-08-22', 12, 1, 13, 5, 0);
INSERT INTO Plays (pid, sName, sCity, gDateTime, totalPoints, threePoints, assists, rebounds, blocks)
    VALUES ('PRA', 'Bell Centre', 'Quebec', '2021-11-21', 26, 6, 0, 6, 4);
INSERT INTO Plays (pid, sName, sCity, gDateTime, totalPoints, threePoints, assists, rebounds, blocks)
    VALUES ('STA', 'Madison Square Garden', 'New York', '2022-04-12', 18, 4, 4, 5, 0);
INSERT INTO Plays (pid, sName, sCity, gDateTime, totalPoints, threePoints, assists, rebounds, blocks)
    VALUES ('JAA', 'FTX Arena', 'Miami', '2020-09-15' , 21, 5, 3, 1, 0);

--addition to bettor
INSERT INTO Bettor (id, bettorName, totalAccountBalance, bettorLevel)
    VALUES ('RYCR', 'Ryan Castra', 135000 , '3');
INSERT INTO Bettor (id, bettorName, totalAccountBalance, bettorLevel)
    VALUES ('SAME', 'Sahil Mehra', 154000 , '4');
INSERT INTO Bettor (id, bettorName, totalAccountBalance, bettorLevel)
    VALUES ('TOSU', 'Tom S Sunil', 68950, '2');
INSERT INTO Bettor (id, bettorName, totalAccountBalance, bettorLevel)
    VALUES ('ALFA', 'Al Ali Fahd', 545000, '1');
INSERT INTO Bettor (id, bettorName, totalAccountBalance, bettorLevel)
    VALUES ('KRRE', 'Kris M Read', 132990, '3');

--addition to bets
INSERT INTO Bets (sName, sCity, gDateTime, bid, betAmount, bidDate, win, winRatio)
    VALUES ('Wide World of Sports Complex', 'Kissimmee', '2020-09-30', 'RYCR', 5000 , '2020-09-30', 1 , 0.732 );
INSERT INTO Bets (sName, sCity, gDateTime, bid, betAmount, bidDate, win, winRatio)
    VALUES ('Wells Fargo Center', 'Philadelphia', '2019-08-22', 'SAME', 6000 , '2019-08-22', 1, 0.603);
INSERT INTO Bets (sName, sCity, gDateTime, bid, betAmount, bidDate, win, winRatio)
    VALUES ('Bell Centre', 'Quebec', '2021-11-21', 'TOSU', 2500 , '2021-11-21', 0, 0.736);
INSERT INTO Bets (sName, sCity, gDateTime, bid, betAmount, bidDate, win, winRatio)
    VALUES ('Madison Square Garden', 'New York', '2022-04-12', 'ALFA', 3200 , '2022-04-12', 0, 0.528);
INSERT INTO Bets (sName, sCity, gDateTime, bid, betAmount, bidDate, win, winRatio)
    VALUES ('FTX Arena', 'Miami', '2020-09-15', 'KRRE', 3600 , '2020-09-15', 1, 0.610);

--addition to betsWinAmount
INSERT INTO BetsWinAmount (betAmount, win, winRatio, winAmount)
    VALUES ( 5000 , 1, 0.732, 8660);
INSERT INTO BetsWinAmount (betAmount, win, winRatio, winAmount)
    VALUES ( 6000 , 1, 0.603, 9600);
INSERT INTO BetsWinAmount (betAmount, win, winRatio, winAmount)
    VALUES ( 2500 , 0, 0.736, 0);
INSERT INTO BetsWinAmount (betAmount, win, winRatio, winAmount)
    VALUES ( 3200 , 0, 0.528, 0);
INSERT INTO BetsWinAmount (betAmount, win, winRatio, winAmount)
    VALUES ( 3600 , 1, 0.610, 5800);

-- addition to transactoins
INSERT INTO transactions (id, reason, transactionDate, amount, bid)
    VALUES ('ASD22', 'bet amount', '2020-09-30', 5000, 'RYCR');
INSERT INTO transactions (id, reason, transactionDate, amount, bid)
    VALUES ('ASD23', 'bet won', '2020-09-30', 8600, 'RYCR');
INSERT INTO transactions (id, reason, transactionDate, amount, bid)
    VALUES ('GRG53', 'bet amount', '2019-08-22', 6000, 'SAME');
INSERT INTO transactions (id, reason, transactionDate, amount, bid)
    VALUES ('GRG54', 'bet won', '2019-08-22', 9600, 'SAME');
INSERT INTO transactions (id, reason, transactionDate, amount, bid)
    VALUES ('GHK64', 'bet amount', '2021-11-21', 2500, 'TOSU');
INSERT INTO transactions (id, reason, transactionDate, amount, bid)
    VALUES ('IUY09', 'bet amount', '2022-04-12', 3200, 'ALFA');
INSERT INTO transactions (id, reason, transactionDate, amount, bid)
    VALUES ('YTP55', 'bet amount', '2020-09-15', 3600, 'KRRE');
INSERT INTO transactions (id, reason, transactionDate, amount, bid)
    VALUES ('YTP56', 'bet won', '2020-09-15', 5800, 'KRRE');


SELECT * FROM Basketball_Personnel;
SELECT * FROM Bets;
SELECT * FROM BetsWinAmount;
SELECT * FROM Bettor;
SELECT * FROM Game;
SELECT * FROM Player;
SELECT * FROM Plays;
SELECT * FROM Stadium;
SELECT * FROM Team;
SELECT * FROM TeamInfo;
SELECT * FROM Transactions;
SELECT * FROM Wallet;
