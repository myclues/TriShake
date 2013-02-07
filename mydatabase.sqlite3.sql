BEGIN TRANSACTION;
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE workoutTbl (workoutId integer PRIMARY KEY, type text, difficulty text, duration text, description text);
INSERT INTO workoutTbl VALUES(1,'Bike','Easy','30-60','spin easy for 45 minutes');
COMMIT;
