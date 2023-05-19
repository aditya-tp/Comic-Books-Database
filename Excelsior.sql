
/* Please execute all the queries in the below order for all the procedural elements to work and also use a delimiter to execute them*/

CREATE DATABASE excelsior;
USE excelsior;

CREATE TABLE users(
userID INT NOT NULL AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
password VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
dateJoined DATE NOT NULL,
PRIMARY KEY(userID)
);

CREATE TABLE comics(
comicID INT NOT NULL AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
year VARCHAR(4) NOT NULL,
genre VARCHAR(30) NOT NULL,
type VARCHAR(10) NOT NULL,
PRIMARY KEY(comicID)
);

CREATE TABLE publishers(
publisherID INT NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
PRIMARY KEY(publisherID)
);

CREATE TABLE writers(
writerID INT NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
PRIMARY KEY(writerID)
);

CREATE TABLE issue(
issueID INT NOT NULL AUTO_INCREMENT,
comicID INT NOT NULL,
issueNumber INT NOT NULL,
edition INT,
PRIMARY KEY(issueID),
FOREIGN KEY(comicID) REFERENCES comics(comicID) ON DELETE CASCADE
);

CREATE TABLE comicsDetails(
comicID INT NOT NULL,
publisherID INT NOT NULL,
writerID INT NOT NULL,
issueID INT NOT NULL,
issueName VARCHAR(30),
description TEXT,
mainCharacter VARCHAR(30) NOT NULL,
FOREIGN KEY(comicID) REFERENCES comics(comicID) ON DELETE CASCADE,
FOREIGN KEY(publisherID) REFERENCES publishers(publisherID) ON DELETE CASCADE,
FOREIGN KEY(writerID) REFERENCES writers(writerID) ON DELETE CASCADE,
FOREIGN KEY(issueID) REFERENCES issue(issueID) ON DELETE CASCADE
);

CREATE TABLE grades(
gradeID INT NOT NULL AUTO_INCREMENT,
gradeNumber DECIMAL(10,1) NOT NULL,
symbol VARCHAR(50) NOT NULL,
PRIMARY KEY(gradeID)
);


CREATE TABLE pricing(
comicID INT NOT NULL,
issueID INT NOT NULL,
gradeID INT NOT NULL,
speciality VARCHAR(5) NOT NULL,
stock INT NOT NULL,
costPrice DECIMAL(10,2) NOT NULL,
price DECIMAL(10,2),
FOREIGN KEY(comicID) REFERENCES comics(comicID) ON DELETE CASCADE,
FOREIGN KEY(issueID) REFERENCES issue(issueID) ON DELETE CASCADE,
FOREIGN KEY(gradeID) REFERENCES grades(gradeID) ON DELETE CASCADE
);


CREATE TABLE orders(
orderID INT NOT NULL AUTO_INCREMENT,
userID INT NOT NULL,
orderDate TIMESTAMP NOT NULL,
status VARCHAR(20) NOT NULL,
PRIMARY KEY(orderID),
FOREIGN KEY(userID) REFERENCES users(userID) ON DELETE CASCADE
);

CREATE TABLE orderItems(
orderItemID INT NOT NULL AUTO_INCREMENT,
orderID INT NOT NULL,
comicID INT NOT NULL,
issueID INT NOT NULL,
gradeID INT NOT NULL,
quantity INT NOT NULL,
subtotal DECIMAL(10,2),
PRIMARY KEY(orderItemID),
FOREIGN KEY(orderID) REFERENCES orders(orderID) ON DELETE CASCADE,
FOREIGN KEY(comicID) REFERENCES comics(comicID) ON DELETE CASCADE,
FOREIGN KEY(issueID) REFERENCES issue(issueID) ON DELETE CASCADE,
FOREIGN KEY(gradeID) REFERENCES grades(gradeID) ON DELETE CASCADE
);

CREATE TABLE salesInfo(
salesID INT NOT NULL AUTO_INCREMENT,
orderID INT NOT NULL,
subtotal DECIMAL(10,2),
tax DECIMAL(10,2),
orderTotal DECIMAL(10,2),
PRIMARY KEY(salesID),
FOREIGN KEY(orderID) REFERENCES orders(orderID) ON DELETE CASCADE
);

INSERT INTO users(username,email,password,dateJoined)
VALUES
('emilybrown', 'emily.brown@example.com', 'mySecretPass', '2022-05-08'),
('davidlee', 'david.lee@example.com', 'P@ssword123', '2022-05-08'),
('sarahjohnson', 'sarah.johnson@example.com', 's3cur3p@ss', '2022-05-08'),
('michaeladams', 'michael.adams@example.com', 'myPa$$word', '2022-05-08'),
('katewilson', 'kate.wilson@example.com', 'pa$$w0rd!', '2022-05-08');

INSERT INTO comics(title,year,genre,type)
VALUES
('007 JAMES BOND FOR YOUR EYES ONLY PB',1981,'Spy Fiction','comic'),
('SPIDER MAN',1963,'Action','graphic'),
('AVENGERS',2016,'Action','graphic'),
('FANTASTIC FOUR',2013,'Super Hero','graphic'),
('ALL NEW X-MEN',2015,'Super Hero','graphic'),
('BATMAN ADVENTURES',2003,'Super Hero','graphic'),
('FLASH',2011,'Super Hero','graphic'),
('SUPERMAN: FOR THE ANIMALS',2000,'Super Hero','comic'),
('WONDER WOMAN',1942,'Super Hero','graphic'),
('JUSTICE LEAGUE OF AMERICA',2006,'Super Hero','graphic'),
('MADROX',2005,'Super Hero','comic');



INSERT INTO publishers(name)
VALUES
("Marvel Comics"),
("DC Comics");

INSERT INTO writers(name)
VALUES
("Ian Fleming"),
("Stan Lee"),
('Mark Waid'),
('Matt Fraction'),
('Dennis Hallum'),
('Dan Slott'),
('Francis Manapul'),
('Mark Millar'),
('Robert Kanigher'),
('Brad Meltzer'),
('Peter Allen David');

INSERT INTO issue(comicID,issueNumber,edition)
VALUES
(1,1,1),
(2,1,NULL),
(2,2,NULL),
(2,3,NULL),
(2,4,NULL),
(3,1,NULL),
(3,2,NULL),
(3,3,NULL),
(3,4,NULL),
(4,1,NULL),
(4,2,NULL),
(4,3,NULL),
(4,4,NULL),
(5,1,NULL),
(5,2,NULL),
(5,3,NULL),
(5,4,NULL),
(6,1,NULL),
(6,2,NULL),
(6,3,NULL),
(6,4,NULL),
(7,1,NULL),
(7,2,NULL),
(7,3,NULL),
(7,4,NULL),
(8,1,NULL),
(9,100,NULL),
(9,102,NULL),
(9,103,NULL),
(10,1,NULL),
(10,2,NULL),
(10,3,NULL),
(11,1,NULL);



INSERT INTO comicsDetails(comicID,publisherID,writerID,issueID,issueName,description,mainCharacter)
VALUES
(1,1,1,1,NULL,'Here we find sudden emergencies and beautiful girls who aren’t quite what they seem - the stock-in-trade of James Bond. When 007 is on the case there’s only one thing you can be sure of, that the result will be thrilling. Whether he’s dealing with the assassination of a Cuban thug in America, the destruction of an international heroin ring, or sudden death in the Seychelles, Bond gets the job done. In his own suave and unmistakable style!','James Bond'),
(1,1,3,1,NULL,'Here we find sudden emergencies and beautiful girls who aren’t quite what they seem - the stock-in-trade of James Bond. When 007 is on the case there’s only one thing you can be sure of, that the result will be thrilling. Whether he’s dealing with the assassination of a Cuban thug in America, the destruction of an international heroin ring, or sudden death in the Seychelles, Bond gets the job done. In his own suave and unmistakable style!','James Bond'),

(2,1,2,2,NULL,"The FIRST issue of Amazing Spider-Man! The amazing Spider-Man swings into his very first starring series, fresh off of his debut in the pages of Amazing Fantasy #15. In one of his earliest adventures following Uncle Ben's death, Spider-Man must save a crew of astronauts aboard a malfunctioning space ship! Then, Spider-Man tries to join the Fantastic Four and then runs afoul of the Chameleon!",'Spider Man'),
(2,1,2,3,NULL,"Spider-Man catches Charlie and his two pals robbing a warehouse. Surprising them with his Spider Signal light, he quickly overcomes them and webs them up for the police.","Spider Man"),
(2,1,2,4,NULL,"It is late in the evening at the offices of Osborn Industries. The only people present are the five individuals that Norman Osborn he gathered to take place in the ceremony called the Gathering of Five.","Spider Man"),
(2,1,2,5,NULL,"Back at Osborn Industries, Norman Osborn catches Mattie Franklin reading a magazine about Spider-Man and demands to know what she is doing. Mattie explains that she thinks Spider-Man is cool, something older people wouldn't understand.","Spider Man"),

(3,1,3,6,'COMICXPOSE','The time has come! Their ranks shattered by Civil War, their spirits weighted down by a toll both personal and spiritual, Earth?s Mightiest Heroes must find the resolve to stand united one final time against their greatest foe! Captain America! Thor! The Vision! The Wasp! Spider-Man Hercules! When the dust settles, not a one of these valiant heroes will make it to the final page alive! This is KANG WAR ONE!','Captain America'),
(3,1,3,7,'BIANCHI','KANG WAR TWO! The Vision is hell-bent on revenge against Kang and if the Avengers can?t hold the synthezoid back, all of history is in jeopardy!','Captain America'),
(3,1,3,8,'TEDESCO','Kang War Three ends in a most unexpected manner! The Firewall of Time has been shattered ? and now the Avengers are faced with the dangers it held back!','Captain America'),
(3,1,3,9,'JUSKO','Kang War IV" begins! The Avengers turn the tables on one of their oldest foes by adopting one of his tactics, leaving Kang nowhere to run and nowhere to hide...except in the timestream itself!','Captain America'),

(4,1,4,10,NULL,'Franklin wakes up from a nightmare and calls for his mother, however, she is not in the Baxter Building and his cries only summon the "Mombots". However, these would-be caretakers are insufficient as the boy wants his mother.','Mister Fantastic'),
(4,1,4,11,'KUBERT','On an alien world, the team encounters a thousand-year-old prophecy: Is the Invisible Woman a long-awaited intergalactic messiah?','Mister Fantastic'),
(4,1,4,12,NULL,"The Fantastic Four cross time and space to deal with the Council of Dooms, but Mr. Fantastic's sickness has spread to the others - and someone may be behind this plague!",'Mister Fantastic'),
(4,1,4,13,'VARIANT',"This story states that Reed moved into Marygay's home while Sue Storm was in her late teens. This refutes previous recountings in Fantastic Four #291 and Fantastic Four #543 that state that Sue was only 12 years old when she first met Reed.",'Mister Fantastic'),

(5,1,5,14,NULL,'Hated and feared more than ever, the world is a dangerous place for mutants. As the few remaining X-MEN retreat into seclusion, a handful of mutant teenagers refuse to allow their destiny to be decided for them. CYCLOPS. BEAST. ICEMAN. ANGEL. THE ALL-NEW WOLVERINE. KID APOCALYPSE. OYA. Stepping out of the shadows of their predecessors, the ALL-NEW X-MEN are striking out on their own, determined to write their own futures!','Cyclops'),
(5,1,5,15,'LEE','Hated and feared more than ever, the world is a dangerous place for mutants. As the few remaining X-MEN retreat into seclusion, a handful of mutant teenagers refuse to allow their destiny to be decided for them. CYCLOPS. BEAST. ICEMAN. ANGEL. THE ALL-NEW WOLVERINE. KID APOCALYPSE. OYA. Stepping out of the shadows of their predecessors, the ALL-NEW X-MEN are striking out on their own, determined to write their own futures!','Cyclops'),
(5,1,5,16,'FERRY',"The Fantastic Four cross time and space to deal with the Council of Dooms, but Mr. Fantastic's sickness has spread to the others - and someone may be behind this plague!",'Mister Fantastic'),
(5,1,5,17,'LIM'," Reunited at last, the All-New X-Men hit the road on a mission to write their own futures and be the heroes they believe mutantkind needs most.",'Deadpool'),

(6,2,6,18,NULL,"This insult must stop! No more blurring the lines! No more vigilantes! Law and order! That's how I run things! This is my town now! My town!",'Batman'),
(6,2,6,19,NULL,"Riddled with bullets?!? That was supposed to be me! Don't you get it?!? That would have been the ultimate exit for me! What happens to me now? I slip in the bathtub or get hit by a bus someday?!?",'Batman'),
(6,2,6,20,NULL,"I broke you out of that two-bit prison they stuck you in... For this?!? Flowers and love poems?",'Batman'),
(6,2,6,21,NULL,"Murder... is a gift?!",'Batman'),

(7,2,7,22,NULL,"Life is locomotion... if you're not moving, you're not living. But there comes a time when you've got to stop running away from things... and you've got to start running towards something, you've got to forge ahead.",'The Flash'),
(7,2,7,23,NULL,"It's amazing. I can see everything before it happens. I can weigh every possible outcome. I can make the right choice. I can do something about it. Before anyone even notices.",'The Flash'),
(7,2,7,24,NULL,"That was my first and last experience with coffee. Man, I could use a cup right now. Because what I'm about to attempt... is a miracle.",'The Flash'),
(7,2,7,25,NULL," No matter what price I have to pay. I won't stop running. I'm THE FLASH... This is what I do.",'The Flash'),

(8,2,8,26,NULL,"You know I can't ignore people in trouble. ",'Superman'),

(9,2,9,27,NULL,"Steve Trevor and Wonder Woman spend the day watching a number of professional athletes compete, and are amazed at their skill. At the end of their date, Steve Trevor points out that Wonder Woman is the greatest general athlete in the world and wonders how exciting it would be to see Wonder Woman compete against herself. ",'Wonder Woman'),
(9,2,9,28,NULL,"Steve Trevor picks up Wonder Woman to take her out on a date for her birthday. When he picks her up in his jeep they drive off to their destination and along the way she kisses him.",'Wonder Woman'),
(9,2,9,29,NULL,"Now you know why the Wonder Woman album is empty! ",'Wonder Woman'),

(10,2,10,30,'4TH PRINT',"I know those looks. You're putting the band back together, aren't you? Hold on, I'll get my bow. ",'Wonder Woman'),
(10,2,10,31,NULL,"One, I've done nothing wrong. Two, if you must know, and as my appearance can attest, I've long ago attained the immortality serum. Indeed, in this case, the only thing I want for myself...is to finally die.",'Batman'),
(10,2,10,32,NULL," Find yourself, John Smith. And there...you will find others like you.",'Wonder Woman'),

(11,1,11,33,NULL,"Jamie Madrox, stabbed, staggering off a bus. Jamie Madrox, setting up a detective agency in the heart of Mutant Town. Jamie Madrox, a peaceful Shaolin priest. Which is the real Jamie Madrox? In this noir-esque thriller of a limited series, it's possible that even Madrox doesn't know anymore.",'Multiple Man');


INSERT INTO grades(gradeNumber,symbol)
VALUES
(10.0,'MINT (MT)'),
(9.9,'MINT (MT)'),
(9.8,'NEAR MINT/MINT (NM/MT)'),
(9.7,'NEAR MINT (NM)'),
(9.6,'NEAR MINT (NM)'),
(9.5,'NEAR MINT (NM)'),
(9.4,'NEAR MINT (NM)'),
(9.3,'NEAR MINT (NM)'),
(9.2,'NEAR MINT (NM)'),
(9.0,'VERY FINE/NEAR MINT (VF/NM)'),
(8.5,'VERY FINE (VF)'),
(8.4,'VERY FINE (VF)'),
(8.3,'VERY FINE (VF)'),
(8.2,'VERY FINE (VF)'),
(8.1,'VERY FINE (VF)'),
(8.0,'VERY FINE (VF)'),
(7.9,'VERY FINE (VF)'),
(7.8,'VERY FINE (VF)'),
(7.7,'VERY FINE (VF)'),
(7.6,'VERY FINE (VF)'),
(7.5,'VERY FINE (VF)'),
(7.0,'FINE/VERY FINE (FN/VF)'),
(6.5,'FINE (FN)'),
(6.4,'FINE (FN)'),
(6.3,'FINE (FN)'),
(6.2,'FINE (FN)'),
(6.1,'FINE (FN)'),
(6.0,'FINE (FN)'),
(5.9,'FINE (FN)'),
(5.8,'FINE (FN)'),
(5.7,'FINE (FN)'),
(5.6,'FINE (FN)'),
(5.5,'FINE (FN)'),
(5.0,'VERY GOOD/FINE (VG/FN)'),
(4.5,'VERY GOOD (VG)'),
(4.4,'VERY GOOD (VG)'),
(4.3,'VERY GOOD (VG)'),
(4.2,'VERY GOOD (VG)'),
(4.1,'VERY GOOD (VG)'),
(4.0,'VERY GOOD (VG)'),
(3.9,'VERY GOOD (VG)'),
(3.8,'VERY GOOD (VG)'),
(3.7,'VERY GOOD (VG)'),
(3.6,'VERY GOOD (VG)'),
(3.5,'VERY GOOD (VG)'),
(3.0,'GOOD/VERY GOOD (GD/VG)'),
(2.5,'GOOD (GD)'),
(2.4,'GOOD (GD)'),
(2.3,'GOOD (GD)'),
(2.2,'GOOD (GD)'),
(2.1,'GOOD (GD)'),
(2.0,'GOOD (GD)'),
(1.9,'GOOD (GD)'),
(1.8,'GOOD (GD)'),
(1.5,'FAIR/GOOD (FR/GD)'),
(1.0,'FAIR (FR)'),
(0.5,'POOR (PR)');

/* 1. Trigger to compute the selling price of the comics based on the cost price. The selling price is set to be 125% of the cost price. */

CREATE TRIGGER set_selling_price
BEFORE INSERT ON pricing
FOR EACH ROW
BEGIN
    IF NEW.price IS NULL THEN
        SET NEW.price = NEW.costPrice * 1.25;
    END IF;
END;


INSERT INTO pricing(comicID,issueID,gradeID,speciality,stock,costPrice)
VALUES
(1,1,56,'No',100,15.00),
(1,1,47,'No',90,30.00),
(1,1,35,'No',75,45.00),
(1,1,28,'No',86,60.00),
(1,1,21,'No',105,68.00),
(1,1,4,'No',25,75.00),
(1,1,4,'No',5,75.00),
(2,2,23,'No',10,200000.00),
(2,2,4,'No',14,130.00),
(2,3,47,'No',1,8320.00),
(2,4,12,'Yes',56,98.00),
(2,4,4,'No',72,130.00),
(2,5,37,'Yes',91,10400.00),
(3,6,21,'No',55,53.00),
(3,7,4,'No',48,93.00),
(3,8,11,'Yes',7,66.00),
(3,8,5,'No',19,80.00),
(3,9,9,'No',28,27.00),
(4,10,47,'No',33,4.00),
(4,10,35,'No',41,5.00),
(4,10,23,'No',53,6.25),
(4,10,11,'Yes',12,9.00),
(4,10,4,'No',21,12.00),
(4,11,5,'No',29,136.00),
(4,12,47,'No',150,4.25),
(4,12,43,'No',255,6.50),
(4,12,23,'No',69,10.25),
(4,12,12,'No',82,14.50),
(4,12,6,'Yes',98,18.00),
(4,13,11,'No',49,105.00),
(4,13,4,'No',12,136.00),
(5,14,35,'No',0,10.50),
(5,14,28,'No',79,17.50),
(5,14,16,'No',61,27.00),
(5,14,7,'No',52,34.00),
(5,15,6,'No',44,80.00),
(5,16,23,'No',32,44.00),
(5,16,11,'No',27,66.00),
(5,16,4,'Yes',97,80.00),
(5,17,33,'No',11,17.50),
(5,17,21,'No',24,27.00),
(5,17,9,'Yes',36,30.00),
(6,18,11,'No',103,67.00),
(6,18,5,'No',10,88.00),
(6,19,25,'No',19,17.50),
(6,19,20,'No',100,27.00),
(6,19,7,'Yes',18,32.00),
(6,20,45,'Yes',5,42.00),
(6,21,30,'No',149,17.50),
(6,21,8,'No',17,35.00),
(7,22,24,'No',99,31.00),
(7,22,21,'No',103,47.00),
(7,22,5,'Yes',101,55.00),
(7,23,43,'No',16,5.00),
(7,23,33,'No',68,7.00),
(7,23,16,'No',78,10.50),
(7,23,5,'No',87,13.00),
(7,24,29,'No',81,8.75),
(7,24,17,'No',75,13.50),
(7,24,4,'No',81,17.00),
(7,25,35,'No',96,5.00),
(7,25,30,'No',108,6.00),
(7,25,21,'No',42,7.50),
(7,25,5,'Yes',100,10.00),
(8,26,35,'No',2,5.00),
(8,26,30,'No',37,6.00),
(8,26,21,'No',86,7.50),
(8,26,5,'Yes',44,10.00),
(9,27,37,'Yes',48,3072.00),
(9,28,47,'No',50,858.00),
(9,29,50,'No',70,858.00),
(9,29,42,'No',60,1879.00),
(10,30,5,'No',0,105.00),
(10,31,54,'No',55,5.25),
(10,31,38,'No',62,8.00),
(10,31,27,'No',66,13.50),
(10,31,20,'No',11,20.00),
(10,31,9,'No',10,24.00),
(10,32,54,'No',72,5.25),
(10,32,38,'No',64,8.00),
(10,32,27,'No',53,13.50),
(10,32,20,'No',26,20.00),
(10,32,9,'No',24,24.00),
(11,33,39,'No',50,36.00);



/* 2. Trigger to update the selling price when the cost price is updated */

CREATE TRIGGER update_selling_price
BEFORE UPDATE ON pricing
FOR EACH ROW
BEGIN
    IF NEW.costPrice <> OLD.costPrice THEN
        SET NEW.price = NEW.costPrice * 1.25;
    END IF;
END;

/* An example query to check if the update trigger works after the update */

UPDATE pricing
SET costPrice = 14.00 
WHERE comicID = 1 AND gradeID = 56;

SELECT * FROM pricing WHERE comicID = 1 AND gradeID = 56;

/* PL/SQL - Procedures and Functions */

/* 1. Procedure to place an order which inserts data into orders, orderItems, salesInfo table and updates stock information */

CREATE PROCEDURE place_order(

  IN user_id INT,
  IN comic_ids VARCHAR(100),
  IN issue_ids VARCHAR(100),
  IN grade_ids VARCHAR(100),
  IN quantities VARCHAR(100)
)
BEGIN
  DECLARE price_1 DECIMAL(10,2);
  DECLARE tax DECIMAL(10,2);
  DECLARE total_cost DECIMAL(10,2);
  DECLARE sub_total DECIMAL(10,2); 
  DECLARE tax_sales DECIMAL(10,2); 
  DECLARE total_sub DECIMAL(10,2);  
  -- Insert the order
  INSERT INTO orders (userID,orderDate,status) VALUES (user_id, NOW(), 'new');
  SET @order_id = LAST_INSERT_ID();
  SET tax=0;
  SET total_cost=0;
  SET tax_sales=0;
  SET total_sub=0;

 
  SET @comic_ids = comic_ids;
  SET @issue_ids = issue_ids;
  SET @grade_ids = grade_ids;
  SET @quantities = quantities;

  WHILE (LENGTH(@comic_ids) > 0 AND LENGTH(@issue_ids) > 0 AND LENGTH(@grade_ids) > 0 AND LENGTH(@quantities) > 0) DO
    SET @comma_pos = INSTR(@comic_ids, ',');
    SET @comic_id = IF(@comma_pos = 0, @comic_ids, SUBSTR(@comic_ids, 1, @comma_pos - 1));
    SET @comic_ids = IF(@comma_pos = 0, '', SUBSTR(@comic_ids, @comma_pos + 1));
    
    SET @comma_pos = INSTR(@issue_ids, ',');
    SET @issue_id = IF(@comma_pos = 0, @issue_ids, SUBSTR(@issue_ids, 1, @comma_pos - 1));
    SET @issue_ids = IF(@comma_pos = 0, '', SUBSTR(@issue_ids, @comma_pos + 1));

    SET @comma_pos = INSTR(@grade_ids, ',');
    SET @grade_id = IF(@comma_pos = 0, @grade_ids, SUBSTR(@grade_ids, 1, @comma_pos - 1));
    SET @grade_ids = IF(@comma_pos = 0, '', SUBSTR(@grade_ids, @comma_pos + 1));

    SET @comma_pos = INSTR(@quantities, ',');
    SET @quantity = IF(@comma_pos = 0, @quantities, SUBSTR(@quantities, 1, @comma_pos - 1));
    SET @quantities = IF(@comma_pos = 0, '', SUBSTR(@quantities, @comma_pos + 1));
    
    
    INSERT INTO orderItems (orderID,comicID,issueID,gradeID,quantity) VALUES (@order_id,@comic_id,@issue_id,@grade_id,@quantity);

    SELECT price INTO price_1 FROM pricing WHERE comicID = @comic_id AND issueID = @issue_id AND gradeID = @grade_id;
    
    UPDATE orderItems
    SET subtotal = @quantity * price_1
    WHERE comicID = @comic_id and gradeID=@grade_id and issueID = @issue_id;

    SELECT subtotal INTO sub_total FROM orderItems WHERE orderID = @order_id and gradeID=@grade_id and issueID = @issue_id;

    UPDATE pricing
    SET stock = stock - @quantity
    WHERE comicID = @comic_id and gradeID=@grade_id and issueID = @issue_id;
    SET tax = sub_total * 0.1;
    SET tax_sales = tax_sales+sub_total * 0.1;

  SET total_cost = (total_cost)+(sub_total + tax);
  SET total_sub = total_sub+@quantity*price_1;
  END WHILE;
  SELECT CONCAT("Order ID: ",@order_id," Order Total: $ ", total_cost) AS message;
  INSERT INTO salesInfo(orderID,subtotal,tax,orderTotal) VALUES (@order_id,total_sub,tax_sales,total_cost);
  UPDATE orderItems SET orderID = @order_id WHERE orderID IS NULL;
END;


CALL place_order(1,'1,3','1,6','56,21','2,4');
CALL place_order(2,'2,4,7','3,10,23','47,35,5','3,1,2');
CALL place_order(3,'3,4,6,8','7,11,19,26','4,5,7,30','1,3,2,4');
CALL place_order(1,'1','1','21','1');
CALL place_order(2,'3,4','8,10','5,4','2,1');
CALL place_order(2,'11','33','39','5');
CALL place_order(4,'9,2,4','28,3,10','47,47,35','3,3,1');
CALL place_order(5,'10,7,6','31,24,21','38,17,8','4,1,2');

SELECT * FROM orders;

/* 2. Procedure to update the order status in the orders table. */

CREATE PROCEDURE update_order (
  IN order_id INT,
  IN new_status VARCHAR(20)
)
BEGIN
    DECLARE order_status VARCHAR(20);
    SELECT status INTO order_status FROM orders WHERE orderID = order_id;
    IF order_status = 'new' AND new_status='processed' THEN
        UPDATE orders SET status = new_status WHERE orderID = order_id;
        SELECT CONCAT("Order ",order_id, " status updated sucessfully.") AS message_1;
    ELSEIF order_status = 'processed' AND new_status='shipped'THEN
        UPDATE orders SET status = new_status WHERE orderID = order_id;
        SELECT CONCAT("Order ",order_id, " status updated sucessfully.") AS message_1;
    ELSEIF order_status = 'shipped' AND new_status='delivered' THEN
        UPDATE orders SET status = new_status WHERE orderID = order_id;
        SELECT CONCAT("Order ",order_id, " status updated sucessfully.") AS message_1;
    ELSE
    SELECT CONCAT('Order ', order_id, ' is already processed, cannot revert back.') AS message_2;
    END IF;
END;

CALL update_order(1,'processed');
CALL update_order(1,'shipped');
CALL update_order(1,'delivered');
CALL update_order(1,'new');

SELECT * FROM orders;

/* 3. Function to cancel the order, update the status and update the stock */

CREATE FUNCTION cancel_order(order_id INT) RETURNS VARCHAR(20)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE order_status VARCHAR(20);
    
    SELECT status INTO order_status FROM orders WHERE orderID = order_id;
    
    IF order_status = 'cancelled' THEN
        RETURN "Failed";
    ELSEIF order_status = 'shipped' THEN
        RETURN "Failed";
    ELSEIF order_status = 'delivered' THEN
        RETURN "Failed";
    ELSE
        UPDATE orders SET status = 'cancelled' WHERE orderID = order_id;
        DELETE FROM salesInfo WHERE orderID=order_id;
        UPDATE pricing p
        JOIN orderItems oi ON p.comicID = oi.comicID
        SET p.stock = p.stock + oi.quantity
        WHERE oi.orderID = order_id;
        RETURN "Success";
    END IF;
END; 

SELECT cancel_order(1);
SELECT cancel_order(2);

SELECT * FROM orders;

/* Views */

/* 1. View to fetch all the comics and display the prices of all the grades */

CREATE OR REPLACE VIEW all_comics AS
SELECT c.comicID,c.title,c.year,i.issueNumber,g.symbol,CONCAT('$',p.price) AS price
FROM comics c 
INNER JOIN pricing p on c.comicID=p.comicID
INNER JOIN issue i on p.comicID=i.comicID and i.issueID=p.issueID
INNER JOIN grades g on g.gradeID=p.gradeID
ORDER BY c.comicID;

SELECT * FROM all_comics;

/* 2. View to fetch all the Marvel Comics */

CREATE OR REPLACE VIEW marvel_comics AS
SELECT DISTINCT a.title,a.year
FROM all_comics a
JOIN comicsDetails cd on cd.comicID=a.comicID 
JOIN publishers p ON p.publisherID=cd.publisherID
WHERE p.name='Marvel Comics'
ORDER BY a.title;

SELECT * FROM marvel_comics;

/* 3. View to fetch all the DC Comics */

CREATE OR REPLACE VIEW dc_comics AS
SELECT DISTINCT a.title,a.year
FROM all_comics a
JOIN comicsDetails cd on cd.comicID=a.comicID 
JOIN publishers p ON p.publisherID=cd.publisherID
WHERE p.name='DC Comics'
ORDER BY a.title;

SELECT * FROM dc_comics;

/* 4. View to display all the products ordered by a particular user */

CREATE OR REPLACE VIEW orders_by_user AS
SELECT DISTINCT o.userID,u.username,o.orderID,c.title,c.year,i.issueNumber,oi.quantity,oi.subtotal
FROM orders o
JOIN orderItems oi ON o.orderID = oi.orderID
JOIN pricing p ON oi.comicID = p.comicID AND oi.gradeID = p.gradeID AND oi.issueID = p.issueID
JOIN users u ON u.userID = o.userID
JOIN comics c ON c.comicID = oi.comicID
JOIN issue i on p.comicID=i.comicID and i.issueID=p.issueID
ORDER BY u.username;

SELECT * FROM orders_by_user;

/* 5. View to display the top 5 best selling comics */

CREATE OR REPLACE VIEW top_selling AS 
SELECT oi.comicID,c.title, SUM(oi.quantity) AS total_sold
FROM orderItems oi
JOIN  comics c ON c.comicID = oi.comicID
GROUP BY oi.comicID
ORDER BY total_sold DESC
LIMIT 5;

SELECT * FROM top_selling;

/* 6. View to display most popular comic book writers based on number of issues sold */

CREATE OR REPLACE VIEW popular_comic_book_writers AS
SELECT w.name, c.comicID, c.title, SUM(oi.quantity) as total_sold
FROM comics c
JOIN orderItems oi ON c.comicID = oi.comicID 
JOIN comicsDetails cd ON cd.comicID = oi.comicID 
JOIN writers w ON w.writerID = cd.writerID
GROUP BY w.name,c.comicID,c.title
ORDER BY total_sold DESC;

SELECT * FROM popular_comic_book_writers;

/* Queries */

/* 1. Query to get the total value of the inventory (comics) */

SELECT CONCAT("$ ",SUM(stock * price)) as total_value
FROM pricing;

/* 2. Query to get all the products that are out of stock */

SELECT p.comicID, p.issueID,c.title,p.gradeID
FROM pricing p
LEFT JOIN comics c ON p.comicID = c.comicID
WHERE p.stock IS NULL OR p.stock = 0;

/* 3. Query to list all the comics sold in the last 30 days*/

SELECT c.title,oi.comicID,oi.gradeID,SUM(oi.quantity) as total_sold
FROM orderItems oi
JOIN comics c ON oi.comicID = c.comicID
JOIN orders o ON o.orderID = oi.orderID
WHERE o.orderDate >= DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY c.comicID,oi.gradeID
ORDER BY total_sold DESC
LIMIT 10;

/* 4. Query to fetch Spider man comics where issue number is less than 150 and quality >=mint and price less than 200.00*/

SELECT c.title,c.year,i.issueNumber,g.symbol,CONCAT('$ ',p.price) as price
FROM comics c
JOIN pricing p on p.comicID = c.comicID
JOIN issue i on i.issueID = p.issueID AND c.comicID = i.comicID
JOIN grades g on p.gradeID = g.gradeID
WHERE c.title = 'SPIDER MAN'
AND i.issueNumber < 150
AND g.gradeNumber <= (SELECT min(gradeNumber) from grades where symbol='MINT (MT)')
AND p.price <= 200.00;


/* 5. How many FANTASTIC FOUR books can be bought where the quality is greater than very good and issue before 100 and can be bought as a group for $100 or less in total */

SELECT COUNT(*) as books_that_can_be_bought, CONCAT("$ ",SUM(p.price)) as total
FROM comics c
JOIN pricing p on p.comicID = c.comicID
JOIN issue i on i.issueID = p.issueID
JOIN grades g on p.gradeID = g.gradeID
WHERE c.title = 'FANTASTIC FOUR'
AND i.issueNumber < 100
AND g.gradeNumber <= (SELECT min(gradeNumber) from grades where symbol='VERY GOOD (VG)')
HAVING SUM(p.price)<100;

/* 6. Query to get the number of orders and revenue by customer for a specified date range */


SELECT u.username, COUNT(o.orderID) AS total_orders, CONCAT("$ ",SUM(oi.subtotal)) AS revenue
FROM users u
JOIN orders o ON u.userID = o.userID
JOIN orderItems oi ON o.orderID = oi.orderID 
WHERE o.orderDate BETWEEN '2023-01-01' AND '2023-06-30'
GROUP BY u.userID;

/* 7. Query to find the comics that are bought together */

SELECT CONCAT(c1.title, ' and ', c2.title) AS combo, COUNT(*) AS frequency
FROM orderItems oi1
JOIN orderItems oi2 ON oi1.orderId = oi2.orderId AND oi1.comicID < oi2.comicID
JOIN comics c1 ON oi1.comicID = c1.comicID
JOIN comics c2 ON oi2.comicID = c2.comicID
GROUP BY c1.title, c2.title
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC;

/* 8. Query to list out all the comics with a speciality like signed by writer etc. */

SELECT c.title, i.issueNumber
FROM comics c
JOIN issue i ON i.comicID = c.comicID
JOIN pricing p ON p.comicID = i.comicID and i.issueID = p.issueID
WHERE p.speciality = "Yes";


