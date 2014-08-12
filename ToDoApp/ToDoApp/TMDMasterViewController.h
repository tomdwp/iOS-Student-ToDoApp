//
//  TMDMasterViewController.h
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDToDoItemCollection.h"
#import "TMDMasterTableViewCell.h"

@interface TMDMasterViewController : UITableViewController


@property (strong, nonatomic) TMDToDoItemCollection *toDoCollection;

- (void)addToDoItemWithTitle:(NSString *)titleText
         detailedDescription:(NSString *)detailedDescriptionText
                    priority:(NSNumber *)newPriority
                    complete:(BOOL)completionStatus
                     dueDate:(NSDate *)newDueDate;

@end
