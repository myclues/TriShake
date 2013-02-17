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


#define kTypeComponent 0
#define kDifficultyComponent 1
#define kDurationComponent 2


@implementation MyWorkoutList


@synthesize typeSQL = _typeSQL;
@synthesize difficultySQL = _difficultySQL;
@synthesize durationSQL = _durationSQL;
@synthesize pickerView;



-(NSString *)typeSQL
{
    _typeSQL = [[NSString alloc] init];
    NSInteger rowOne = [pickerView selectedRowInComponent:kTypeComponent];
    _typeSQL = [rowOneItems objectAtIndex:rowOne];
    return _typeSQL;
    NSLog(@"type is: %@", _typeSQL);
}
-(NSString *)difficultySQL
{
    _typeSQL = [[NSString alloc] init];
    NSInteger rowOne = [pickerView selectedRowInComponent:kTypeComponent];
    _typeSQL = [rowOneItems objectAtIndex:rowOne];
    return _typeSQL;
}
-(NSString *)durationSQL
{
    _durationSQL = [[NSString alloc] init];
    NSInteger rowThree = [pickerView selectedRowInComponent:kDurationComponent];
    _durationSQL = [rowThreeItems objectAtIndex:rowThree];
    return _durationSQL;
}


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

        //using this sql statement for now because its the only one I can get to work
        const char *sql = "SELECT workoutId, type, difficulty, duration, description FROM workoutTbl";
        
        ///////////////
        sqlite3_stmt *sqlStatement;

        //I would think that the sql statement I actually want to use would would fit somewhere around here
//        NSString *createSQL = [NSString stringWithFormat: @"SELECT description FROM workoutTbl WHERE type LIKE '%@' AND difficulty LIKE '%@' AND duration LIKE '%@'",_typeSQL, _difficultySQL, _durationSQL];
//        const char *sql = [createSQL cStringUsingEncoding:NSASCIIStringEncoding];
//        NSLog(@"%@", [NSString stringWithUTF8String:sql]);
//
        //////////////
        
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
        sqlite3_finalize(sqlStatement);
    }
    @catch (NSException *exception) {
       NSLog(@"An exception occured: %@", [exception reason]);
    }
    @finally {
        sqlite3_close(db);
        return workoutArray;
   

        
    }
    
    
}


- (void) findWorkoutSQL
{
//    NSMutableArray *workoutSQLArray = [[NSMutableArray alloc] init];
//    
//    NSInteger rowOne = [pickerView selectedRowInComponent:kTypeComponent];
//    NSString *typeSQL = [rowOneItems objectAtIndex:rowOne];
//        
//    NSInteger rowTwo = [pickerView selectedRowInComponent:kDifficultyComponent];
//    NSString *difficultySQL = [rowTwoItems objectAtIndex:rowTwo];
//    
//    NSInteger rowThree = [pickerView selectedRowInComponent:kDurationComponent];
//    NSString *durationSQL = [rowThreeItems objectAtIndex:rowThree];
//    
//    NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"workoutList.sqlite"];
//    
//    NSString *createSQL = [NSString stringWithFormat: @"SELECT description FROM workoutTbl WHERE type LIKE '%@' AND difficulty LIKE '%@' AND duration LIKE '%@'", typeSQL, difficultySQL, durationSQL];
//    const char *sql = [createSQL cStringUsingEncoding:NSASCIIStringEncoding];
//    NSLog(@"my sql statement is %@", [NSString stringWithUTF8String:sql]);
//    
//    sqlite3_stmt *workoutStatement;
//    
//    if (sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK){
//        
//        if (sqlite3_prepare_v2(db, sql, -1, &workoutStatement, NULL) == SQLITE_OK)
//        {
//            
//            if (sqlite3_step(workoutStatement) == SQLITE_ROW)
//            {
//                workoutList *MyWorkout = [[workoutList alloc]init];
//                MyWorkout.workoutId = sqlite3_column_int(workoutStatement, 0);
//                MyWorkout.type = [NSString stringWithUTF8String:(char *) sqlite3_column_text(workoutStatement,1)];
//                MyWorkout.difficulty = [NSString stringWithUTF8String:(char *) sqlite3_column_text(workoutStatement, 2)];
//                MyWorkout.duration = [NSString stringWithUTF8String:(char *) sqlite3_column_text(workoutStatement, 3)];
//                MyWorkout.description = [NSString stringWithUTF8String:(char *) sqlite3_column_text(workoutStatement, 4)];
//                [workoutSQLArray addObject:MyWorkout];
//                
//            }
//            //sqlite3_finalize(sql);
//            sqlite3_finalize(workoutStatement);
//        }
//        sqlite3_close(db);
//    }
}



@end