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
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"IOSDB.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        if(!success)
        {
            NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK))
        {
            NSLog(@"An error has occured.");
        }
        const char *sql = "SELECT type, difficulty, duration, description FROM  workoutData";
        sqlite3_stmt *sqlStatement;
        if(sqlite3_prepare(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK)
        {
            NSLog(@"Problem with prepare statement");
        }
        
        //
        while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
            //WineList *MyWine = [[WineList alloc]init];
            workoutList *MyWorkout = [[workoutList alloc]init];
            //MyWorkout.WineId = sqlite3_column_int(sqlStatement, 0);
            //changed from 1 to 0 because not using int
            MyWorkout.type = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,0)];
            //changed from 2 to 1
            MyWorkout.difficulty = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
            //const char *raw = sqlite3_column_blob(sqlStatement, 3);
            //int rawLen = sqlite3_column_bytes(sqlStatement, 3);
            //NSData *data = [NSData dataWithBytes:raw length:rawLen];
            //MyWine.photo = [[UIImage alloc] initWithData:data];
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