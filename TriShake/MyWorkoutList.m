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
        
        
        //main.workoutTbl and workoutTbl both work
        const char *sql = "SELECT workoutId, type, difficulty, duration, description FROM workoutTbl";
        sqlite3_stmt *sqlStatement;

        
        ////////////////////////////////////////////////////////////////////
        //I feel like I have to put my UIPickerView Specific SQL statement here????
        //sqlite3_stmt *pickerStatement;
        //const char *pickerSQL = "
        
        //SELECT description
        //FROM workoutTbl WHERE
        
        //thinking out loud
        //component one (kTypeComponent)- row one is equal to bike, row two is equal to run, row three is equal to swim
        
        //type is equal to the selected row from the first component (kTypeComponent)
        //NSInteger getDescriptionFromType = [pickerView selectedRowInComponent:kTypeComponent];
                //AND
        
        //component two (kDifficultyComponent)- row one is equal to easy, row two is equal to medium, row three is equal to hard
        ////NSInteger getDescriptionFromDifficulty = [pickerView selectedRowInComponent:kDifficultyComponent];
                //AND
        
        //component three (kDurationComponent)- row one is equal to <30 minutes, row two is 30-60 minutes, row three is >60 minutes
        // NSInteger getDescriptionFromDuration = [pickerView selectedRowInComponent:kDurationComponent];
        //";
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