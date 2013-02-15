//
//  ViewController.h
//  TriShake
//
//  Created by Corinn Pope on 1/28/13.
//  Copyright (c) 2013 Corinn Pope. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyWorkoutList;

@interface ViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSMutableArray *workouts;
    //2/14 add global NSStrings
    NSString *typeSQL;
    NSString *difficultySQL;
    NSString *durationSQL;
        
}
//2/14 add gloabl SQL NSStrings
@property(nonatomic,retain) NSMutableArray *workouts;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic )NSMutableArray *rowOneItems;
@property (strong, nonatomic )NSMutableArray *rowTwoItems;
@property (strong, nonatomic )NSMutableArray *rowThreeItems;
@property (strong, nonatomic) IBOutlet UILabel *workoutTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *workoutDifficultyLabel;
@property (strong, nonatomic) IBOutlet UILabel *workoutDurationLabel;
@property (strong, nonatomic) IBOutlet UILabel *workoutDescriptionLabel;


@property (strong,nonatomic) MyWorkoutList *secondClass;


- (IBAction)findWorkout:(id)sender;


@end
