//
//  MyWorkoutList.m
//  TriShake
//
//  Created by Corinn Pope on 1/28/13.
//  Copyright (c) 2013 Corinn Pope. All rights reserved.
//

#import "MyWorkoutList.h"
#import "workoutList.h"
#import <Foundation/Foundation.h>
#import <sqlite3.h>


@implementation MyWorkoutList

- (NSMutableArray *) getMyWorkout{

    
    NSMutableArray *workoutArray = [[NSMutableArray alloc] init];
    @try {
        //define path
            
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"TRIDB.db3"];
        
        
            NSLog(@"Db path is %@",dbPath);
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
       // [fileMgr copyItemAtPath:dbPath toPath:self.databasePath error:nil];
        if(!success)
       {
            
          NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        
        if
            //(!(sqlite3_open_v2(dbPath, sql, -1, &sqlStatement, SQLITE_OPEN_READONLY)))
           (!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK))
            NSLog(@"error with message '%s'.", sqlite3_errmsg(db));
        
        //{
            
         // sqlite3_close(db);
        //NSLog(@"Failed to open database with message '%s'.", sqlite3_errmsg(db));
       // }
        
        const char *sql = "SELECT workoutId, type, difficulty, duration, description FROM workoutTbl";
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK) NSLog(@"connect to table OK");
            else NSLog(@"connect to table FALSE");

            
       {
        NSLog(@"%s Prepare failure '%s' (%1d)", __FUNCTION__, sqlite3_errmsg(db), sqlite3_errcode(db));
        }
        
        //...
        while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
           
            workoutList *MyWorkout = [[workoutList alloc]init];
            MyWorkout.workoutId = sqlite3_column_int(sqlStatement, 0);
          MyWorkout.type = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
           MyWorkout.difficulty = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
            MyWorkout.duration = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
            MyWorkout.description = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 4)];
           [workoutArray addObject:MyWorkout];
       }
    }
    @catch (NSException *exception) {
       NSLog(@"An exception occured: %@", [exception reason]);
    }
    @finally {
        return workoutArray;
    }
    
    
}


@end