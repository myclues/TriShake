DROP TABLE IF EXISTS "workoutTbl";
CREATE TABLE "workoutTbl" ("id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL , "type" VARCHAR, "difficulty" VARCHAR, "duration" VARCHAR, "description" VARCHAR);
INSERT INTO "workoutTbl" VALUES(1,'Bike','Easy','>60','bike 115 min steady and 35 min up-tempo');
INSERT INTO "workoutTbl" VALUES(2,'Bike','Medium','>60','Bike 90 min as 45 min steady, 4 x (5 min Hard, 3 min easy), 13 min steady');
INSERT INTO "workoutTbl" VALUES(3,'Bike','Hard','>60','After a full warm up, do a long ride in zone 2. Try to find a hilly route to ride to continue to build leg strength and overall endurance. You will push in to zone 3-4 for hill climbing. Maintain an average cadence of 85-100 rpms throughout the entire workout. Cool down in zones 1-2.');
INSERT INTO "workoutTbl" VALUES(4,'Bike','Easy','30-60','bike-starting steady, building to up-tempo');
INSERT INTO "workoutTbl" VALUES(5,'Bike','Medium','30-60','Bike-easy with 3 x 30 second accelerations');
INSERT INTO "workoutTbl" VALUES(6,'Bike','Easy','<30','bike-easy, insert 3 x 30 second spin-ups (105+rpm) at light resistance');
INSERT INTO "workoutTbl" VALUES(7,'Bike','Hard','30-60','WU:Spin for 10 minutes in Zone 1
INSERT INTO "workoutTbl" VALUES(8,'Bike','Medium','30-60','WU: 10 minutes easy spinning in Zone 1.
INSERT INTO "workoutTbl" VALUES(9,'Bike','Hard','<30','WU:Spin for 10 minutes in Zone 1
INSERT INTO "workoutTbl" VALUES(10,'Bike','Medium','<30','bike-easy, insert 3 x 30 second spin-ups (105+rpm) at medium resistance');
INSERT INTO "workoutTbl" VALUES(11,'Run','Hard','<30','WU: Run for 10 minutes in Zone 12 building to high Zone 2. During this time complete 4-30 second efforts at slightly slower than 10k pace.
INSERT INTO "workoutTbl" VALUES(12,'Run','Easy','<30','Run easily in zone 1. Try to maintain pace of 22 left foot strikes in 15 seconds.');
INSERT INTO "workoutTbl" VALUES(13,'Run','Medium','<30','WU: Easy Zone 1 run for 15 minutes.
INSERT INTO "workoutTbl" VALUES(14,'Run','Hard','30-60','WU: Run in Zone 1 for 10 minutes
INSERT INTO "workoutTbl" VALUES(15,'Run','Easy','30-60','Run easily in zone 1. Try to maintain pace of 22 left foot strikes in 15 seconds.');
INSERT INTO "workoutTbl" VALUES(16,'Run','Easy','>60','WU:Run in Zone 1 for 15 minutes
INSERT INTO "workoutTbl" VALUES(17,'Run','Medium','30-60','Try to do this on grass.
INSERT INTO "workoutTbl" VALUES(18,'Run','Medium','>60','WU:Run in Zone 1 for 10 minutes
INSERT INTO "workoutTbl" VALUES(19,'Run','Hard','>60','WU: Run in Zone 1 moving up to Zone 2 for 15 minutes
INSERT INTO "workoutTbl" VALUES(20,'Swim','Easy','<30','swim-15 min easy with 3 x 30 second accelerations');
INSERT INTO "workoutTbl" VALUES(21,'Swim','Medium','<30','2000 yards with short, hard intervals');
INSERT INTO "workoutTbl" VALUES(22,'Swim','Hard <30','<30','3 x 25 all out (RI :20) 25 drill. Repeat this sequence 8 times.');
INSERT INTO "workoutTbl" VALUES(23,'Swim','Easy','30-60','WU: 6 x 50 done as 25 scull and 25 distance per stroke. Then 4 x 50 done as 25 swim and 25 drill.
INSERT INTO "workoutTbl" VALUES(24,'Swim','Medium','30-60','WU: 300 Swim, 100 kick, 100 pull
INSERT INTO "workoutTbl" VALUES(25,'Swim','Hard','30-60','WU: 200 easy swim, 4 X 50 done as 25 drill, 25 perfect form.(RI :20)
INSERT INTO "workoutTbl" VALUES(26,'Swim','Easy','>60','WU: 6 x 50 increasing pace slightly each 50.
INSERT INTO "workoutTbl" VALUES(27,'Swim','Medium','>60','Workout (2,100 yards)
INSERT INTO "workoutTbl" VALUES(28,'Swim','Hard','>60','Warm up: 200 swim100 kick200 pull