//
//  workoutList.h
//  TriShake
//
//  Created by Corinn Pope on 1/28/13.
//  Copyright (c) 2013 Corinn Pope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface workoutList : NSObject {
    NSString *type;
    NSString *difficulty;
    NSString *duration;
    NSString *description;
    NSInteger Id;
}
@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *difficulty;
@property (nonatomic, retain) NSString *duration;
@property (nonatomic, retain) NSString *description;
@end
