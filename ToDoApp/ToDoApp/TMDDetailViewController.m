//
//  TMDDetailViewController.m
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDDetailViewController.h"

@interface TMDDetailViewController ()
- (void)updateUI;

@end

@implementation TMDDetailViewController

#pragma mark - Managing the detail item

- (void)setToDoItem:(id)newToDoItem
{
    if (_toDoItem != newToDoItem) {
        _toDoItem = newToDoItem;
        
        // Update the view.
        [self updateUI];
    }
}

- (void)updateUI
{
    // Update the user interface for the detail item.

    if (self.toDoItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        
        self.toDoTitleTextField.text = self.toDoItem.title;
        self.toDoDescriptionTextField.text = self.toDoItem.detailedDescription;
        self.toDoPrioritySegmentControl.selectedSegmentIndex = self.toDoItem.priority.integerValue;
        self.toDoCompleteSwitch.on = self.toDoItem.complete;
        self.toDoHasDueDateSwitch.on = self.toDoItem.dueDate == nil? NO : YES;
        self.toDoDueDatePicker.hidden = self.toDoItem.dueDate == nil? YES : NO;
        
        if (self.toDoItem.dueDate != nil) {
            self.toDoDueDatePicker.date = self.toDoItem.dueDate;
        }
    } else {
        
        //adding a new to-do item, don't want date spinner to appear unless they have enabled a due date
        if (self.toDoHasDueDateSwitch.isOn == NO) {
            self.toDoDueDatePicker.hidden = YES;
        }
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self updateUI];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear called... \n self.toDoItem = %@", self.toDoItem);
    
    if (self.toDoItem) {
        
        // the title is the only 'required' field for a To-Do Item, so checking that it's not blank or nil
        if (![self.toDoTitleTextField.text isEqualToString:@""] && (self.toDoTitleTextField.text != nil)) {
            self.toDoItem.title = self.toDoTitleTextField.text;
        }
        self.toDoItem.detailedDescription = self.toDoDescriptionTextField.text;
        self.toDoItem.priority = @(self.toDoPrioritySegmentControl.selectedSegmentIndex);
        self.toDoItem.complete = self.toDoCompleteSwitch.on;
        
        if (self.toDoHasDueDateSwitch.on) {
            self.toDoItem.dueDate = self.toDoDueDatePicker.date;
        } else {
            // if dueDate switch is 'off', we want to clear the dueDate in the toDoItem object
            self.toDoItem.dueDate = nil;
        }
        
        self.toDoHasDueDateSwitch.on = self.toDoItem.dueDate == nil? NO : YES;
        self.toDoDueDatePicker.hidden = self.toDoItem.dueDate == nil? YES : NO;
        
        if (self.toDoItem.dueDate != nil) {
            self.toDoDueDatePicker.date = self.toDoItem.dueDate;
        }
    } else {
        
        // in this case, we need to create a new to-do item
        
        NSLog(@"ParentViewController:  %@", self.parentViewController.title);
        
        //need to check that atleast a title has been entered
        if (![self.toDoTitleTextField.text isEqualToString:@""] && (self.toDoTitleTextField.text != nil)) {
            
            NSDate *newDueDate = nil;
            if (self.toDoHasDueDateSwitch.on) {
                newDueDate = self.toDoDueDatePicker.date;
            }
            
            TMDMasterViewController *masterViewController = [self.navigationController.viewControllers firstObject];
            
//            NSLog(@"ParentViewController is: %@", [self.parentViewController class]);
//            NSLog(@"PresentingViewController is: %@", [self.presentingViewController class]);
//            NSLog(@"PresentedViewController is: %@", [self.presentedViewController class]);
            
            [masterViewController addToDoItemWithTitle:self.toDoTitleTextField.text
                                        detailedDescription:self.toDoDescriptionTextField.text
                                                   priority:@(self.toDoPrioritySegmentControl.selectedSegmentIndex)
                                                   complete:self.toDoCompleteSwitch.on
                                                    dueDate:newDueDate ];
        }
        
    }
    
    
    
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear called and disappearing....");
    [super viewDidDisappear:animated];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dueDateSwitchChanged:(UISwitch *)sender
{
    if (sender.isOn) {
        self.toDoDueDatePicker.hidden = NO;
    } else {
        self.toDoDueDatePicker.hidden = YES;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.toDoTitleTextField resignFirstResponder];
    [self.toDoDescriptionTextField resignFirstResponder];
}

@end
