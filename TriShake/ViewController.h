//
//  ViewController.h
//  TriShake
//
//  Created by Corinn Pope on 1/28/13.
//  Copyright (c) 2013 Corinn Pope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSMutableArray *workouts;
        
}

@property(nonatomic,retain) NSMutableArray *workouts;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic )NSMutableArray *rowOneItems;
@property (strong, nonatomic )NSMutableArray *rowTwoItems;
@property (strong, nonatomic )NSMutableArray *rowThreeItems;
//@property (strong, nonatomic) IBOutlet UITextView *workoutResults;
@property (strong, nonatomic) IBOutlet UILabel *workoutResults;

- (IBAction)findWorkout:(id)sender;

@end
