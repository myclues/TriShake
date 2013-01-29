//
//  MyWorkoutList.h
//  TriShake
//
//  Created by Corinn Pope on 1/28/13.
//  Copyright (c) 2013 Corinn Pope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface MyWorkoutList : NSObject{
    sqlite3 *db;
}

- (NSMutableArray *) getMyWorkout;

@end
