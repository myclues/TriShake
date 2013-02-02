
//copyright corinn pope


#import "ViewController.h"
#import "workoutList.h"
#import "MyWorkoutList.h"

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
@synthesize workoutResults;
@synthesize workouts;

- (void)viewDidLoad
{
    
    MyWorkoutList * myworkouts =[[MyWorkoutList alloc] init];
    self.workouts = [myworkouts getMyWorkout];
    //blahhhhh this line isn't working
    //[self.workoutResults setText:((workoutList *) [self.workouts objectAtIndex:0]).description];
    
    //shrink picker view
    pickerView.transform = CGAffineTransformMakeScale(.8, 0.8);
    
    //tried this as well, but this ain't workin right
   // pickerView.frame = CGRectMake(0, 0, 120, 80);
  
    
    //set up arrays
    
    [super viewDidLoad];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    pickerView.opaque = NO;
    
    rowOneItems = [[NSMutableArray alloc] initWithObjects:@"Bike",@"Run",@"Swim",nil];
    rowTwoItems = [[NSMutableArray alloc] initWithObjects:@"Easy",@"Medium",@"Hard",nil];
    rowThreeItems = [[NSMutableArray alloc] initWithObjects:@"<30 mins", @"30-60 mins", @">60 mins", nil];
    
}
- (void)viewDidUnload
{
    [self setPickerView:nil];
        [self setWorkoutResults:nil];
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
    //or use this
    //return rowOneItems.count;
    //return rowTwoItems.count;
   // return rowThreeItems.count;
//}
    
    
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 1)
        return[rowTwoItems objectAtIndex:row];
    else if(component == 2)
        return [rowThreeItems objectAtIndex:row];
    else
        return [rowOneItems objectAtIndex:row];
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
	   inComponent:(NSInteger)component {
    
    //log which row is selected in each component
    if(component ==1) {
    return NSLog(@"Selected Difficulty: %@",[rowTwoItems objectAtIndex:row]);
    }
    else if(component ==2) {
    return NSLog(@"Selected Duration: %@",[rowThreeItems objectAtIndex:row]);
    }
    else{
        NSLog(@"Selected Type: %@",[rowOneItems objectAtIndex:row]);
    }
    
  //define chosen items
    NSString *chosenType;// = [rowOneItems objectAtIndex:row];
    NSString *chosenDifficulty;// = [rowTwoItems objectAtIndex:row];
    NSString *chosenDuration;// = [rowThreeItems objectAtIndex:row];

    
    if (component ==0) {
         chosenDifficulty = ([rowTwoItems objectAtIndex:row]);
    }
    if(component ==0) {
        chosenDuration = ([rowThreeItems objectAtIndex:row]);
    }
    if (component ==0) {
        chosenType = ([rowOneItems objectAtIndex:row]);
    }
   
    NSString *chosenValues = [NSString stringWithFormat:@"%@, %@, %@", chosenType, chosenDifficulty, chosenDuration];
    
    self.workoutResults.text = chosenValues;
    
    //ViewController *initialView;
  //  initialView=(ViewController *)self.delegate;
    
//    if (component==kAnimalComponent) {
  //      int chosenSound=[pickerView selectedRowInComponent:kSoundComponent];
    //    [initialView displayAnimal:[self.animalNames objectAtIndex:row]
      //                   withSound:[self.animalSounds objectAtIndex:chosenSound]
        //             fromComponent:@"the Animal"];
    //} else {
      //  int chosenAnimal=[pickerView selectedRowInComponent:kAnimalComponent];
        //[initialView displayAnimal:[self.animalNames objectAtIndex:chosenAnimal]
          //               withSound:[self.animalSounds objectAtIndex:row]
            //         fromComponent:@"the Sound"];
    //}
    
}

//added actioin 1/29

- (IBAction)findWorkout:(id)sender {

    
    static NSInteger currentIndex = 0;
    if (++currentIndex == [self.workouts count]) {
        currentIndex=0;
    }else{
        workoutList *aWorkout = (workoutList *) [self.workouts objectAtIndex: currentIndex];
        [self.workoutResults setText:aWorkout.type];
        
    }
}

@end