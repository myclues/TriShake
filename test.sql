DROP TABLE IF EXISTS "workoutTbl";
CREATE TABLE "workoutTbl" ("workoutId" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL , "type" TEXT, "difficulty" TEXT, "duration" TEXT, "description" TEXT);
INSERT INTO "workoutTbl" VALUES('1','bike','easy','30-60','spin easy for 45 minutes');