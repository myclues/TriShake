
//copyright corinn pope


#import "ViewController.h"
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    pickerView.opaque = NO;
    
    rowOneItems = [[NSMutableArray alloc] initWithObjects:@"Bike",@"Run",@"Swim",@"Crosstrain" ,nil];
    rowTwoItems = [[NSMutableArray alloc] initWithObjects:@"Easy",@"Medium",@"Hard",nil];
    rowThreeItems = [[NSMutableArray alloc] initWithObjects:@"<30 mins", @"30-60 mins", @">60 mins", nil];
    
}
- (void)viewDidUnload
{
    [self setPickerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
#pragma mark - Picker Methods -
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return rowOneItems.count;
    return rowTwoItems.count;
    return rowThreeItems.count;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 1)
        return[rowTwoItems objectAtIndex:row];
    else if(component == 2)
        return [rowThreeItems objectAtIndex:row];
    else
        return [rowOneItems objectAtIndex:row];
   
 
}


@end