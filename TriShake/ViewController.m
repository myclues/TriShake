
//copyright corinn pope


#import "ViewController.h"
#import "workoutList.h"
#import "MyWorkoutList.h"

#define kTypeComponent 0
#define kDifficultyComponent 1
#define kDurationComponent 2


@interface ViewController (){
    NSMutableArray *rowOneItems;
    NSMutableArray *rowTwoItems;
    NSMutableArray *rowThreeItems;
}
@end

@implementation ViewController
@synthesize pickerView;
@synthesize rowOneItems;
@synthesize rowTwoItems;
@synthesize rowThreeItems;
@synthesize workoutTypeLabel;
@synthesize workouts;
@synthesize workoutDurationLabel;
@synthesize workoutDifficultyLabel;
@synthesize workoutDescriptionLabel;

- (void)viewDidLoad
{
    
    MyWorkoutList * myworkouts =[[MyWorkoutList alloc] init];
    self.workouts = [myworkouts getMyWorkout];

    //shrink picker view
    pickerView.transform = CGAffineTransformMakeScale(.8, 0.8);
    
    [super viewDidLoad];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    pickerView.opaque = NO;

    //set up arrays
    
    rowOneItems = [[NSMutableArray alloc] initWithObjects:@"Bike",@"Run",@"Swim",nil];
    rowTwoItems = [[NSMutableArray alloc] initWithObjects:@"Easy",@"Medium",@"Hard",nil];
    rowThreeItems = [[NSMutableArray alloc] initWithObjects:@"<30 mins", @"30-60 mins", @">60 mins", nil];
    
}

- (void)viewDidUnload
{
    [self setPickerView:nil];
    [self setWorkoutTypeLabel:nil];
    [self setWorkoutDifficultyLabel:nil];
    [self setWorkoutDurationLabel:nil];
    [super viewDidUnload];
    }
    


#pragma mark - Picker Methods -
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
    
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 1) 
        return [self.rowTwoItems count];
        else if (component == 2)
            return [self.rowThreeItems count];
        else
            return [self.rowOneItems count];
    }
    
    
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 1)
        return[rowTwoItems objectAtIndex:row];
    else if(component == 2)
        return [rowThreeItems objectAtIndex:row];
    else
        return [rowOneItems objectAtIndex:row];

}


//was trying to change label here, moved to 'findWorkout' action
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
	   inComponent:(NSInteger)component {
    
    //log/see  which row is selected in each component
    if(component ==1) {
          return NSLog(@"Selected Difficulty: %@",[rowTwoItems objectAtIndex:row]);
    }
    else if(component ==2) {
    return NSLog(@"Selected Duration: %@",[rowThreeItems objectAtIndex:row]);
    }
    else{
        NSLog(@"Selected Type: %@",[rowOneItems objectAtIndex:row]);
    }
}

- (IBAction)findWorkout:(id)sender {
    //set labels to show what the user picked
    NSInteger rowOne = [pickerView selectedRowInComponent:kTypeComponent];
    self.workoutTypeLabel.text = [rowOneItems objectAtIndex:rowOne];
    
    NSInteger rowTwo = [pickerView selectedRowInComponent:kDifficultyComponent];
    self.workoutDifficultyLabel.text = [rowTwoItems objectAtIndex:rowTwo];
    
    NSInteger rowThree = [pickerView selectedRowInComponent:kDurationComponent];
    self.workoutDurationLabel.text = [rowThreeItems objectAtIndex:rowThree];
    
   // NSMutableArray *workoutArray;
    //self.workoutDescriptionLabel.text = [workoutArray componentsJoinedByString:@" "];
    
            sqlite3_stmt *pickerStatement;
    
            NSInteger getTypeSelected = [pickerView selectedRowInComponent:kTypeComponent];
            NSString *typeSQL = [rowOneItems objectAtIndex:getTypeSelected];
    
            NSInteger getDifficultySelected = [pickerView selectedRowInComponent:kDifficultyComponent];
            NSString *difficultySQL = [rowTwoItems objectAtIndex:getDifficultySelected];
    
            NSInteger getDurationSelected = [pickerView selectedRowInComponent:kDifficultyComponent];
            NSString *durationSQL = [rowTwoItems objectAtIndex:getDurationSelected];
    
            NSString *createSQL = [NSString stringWithFormat: @"SELECT description FROM workoutTbl WHERE type LIKE '%%%@%%' AND difficulty LIKE '%%%@%%' AND duration LIKE '%%%@%%'", typeSQL, difficultySQL, durationSQL];
    
    
    
    //show description- test for now (2/7)
       workoutList *aWorkout = (workoutList *) [self.workouts objectAtIndex:rowTwo];
       [self.workoutDescriptionLabel setText:aWorkout.description];

//    }
}

@end