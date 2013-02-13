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
#import "ViewController.h"


@implementation MyWorkoutList

- (NSMutableArray *) getMyWorkout{
    //sqlite3 *db;
    
    NSMutableArray *workoutArray = [[NSMutableArray alloc] init];
    @try {
        NSFileManager *fileMgr = [NSFileManager defaultManager];
       NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"workoutList.sqlite"];
        
        NSLog(@"Db path is %@",dbPath);
        BOOL success = [fileMgr fileExistsAtPath:dbPath];        
        if(!success){
          NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        
        if
        (!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK))
        NSLog(@"error with message '%s'.", sqlite3_errmsg(db));

        const char *sql = "SELECT workoutId, type, difficulty, duration, description FROM workoutTbl";
        sqlite3_stmt *sqlStatement;
        ///////////////////////////////////
        //SQL statement for Picker View////
        //////////////////////////////////
        //sqlite3_stmt *pickerStatement;
//        NSString *typeSQL;
//        NSString *difficultySQL;
//        NSString *durationSQL;

//        
//        NSString *createSQL = [NSString stringWithFormat: @"SELECT description FROM workoutTbl WHERE type LIKE '%%%@%%' AND difficulty LIKE '%%%@%%' AND duration LIKE '%%%@%%'", typeSQL, difficultySQL, durationSQL];
//        const char *cString = [createSQL cStringUsingEncoding:NSASCIIStringEncoding];
        ////////////////////////////////////////////////////////////////////
        
        if (sqlite3_prepare(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK) {
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