//
//  TMDDetailViewController.h
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDToDoItem.h"

@interface TMDDetailViewController : UIViewController

@property (weak, nonatomic) TMDToDoItem *toDoItem;

@property (weak, nonatomic) IBOutlet UITextField *toDoTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *toDoDescriptionTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *toDoPrioritySegmentControl;
@property (weak, nonatomic) IBOutlet UISwitch *toDoCompleteSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *toDoHasDueDateSwitch;
@property (weak, nonatomic) IBOutlet UIDatePicker *toDoDueDatePicker;

- (IBAction)dueDateSwitchChanged:(UISwitch *)sender;


@end
