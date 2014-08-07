//
//  TMDDetailViewController.m
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDDetailViewController.h"

@interface TMDDetailViewController ()
- (void)configureView;

@end

@implementation TMDDetailViewController

#pragma mark - Managing the detail item

- (void)setToDoItem:(id)newToDoItem
{
    if (_toDoItem != newToDoItem) {
        _toDoItem = newToDoItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
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
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
