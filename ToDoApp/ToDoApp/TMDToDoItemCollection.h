//
//  TMDToDoItemCollection.h
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDToDoItem.h"

@interface TMDToDoItemCollection : NSObject <NSCoding>

@property (strong, nonatomic, readonly) NSMutableArray *toDoItems;
@property (strong, nonatomic) NSString *applicationName;

- (NSUInteger)toDoItemCount;
- (NSUInteger)groupCount;
- (TMDToDoItem *)itemAtIndex:(NSUInteger)index;
- (NSString *)groupAtIndex:(NSUInteger)index;

- (void)addToDoItemWithTitle:(NSString *)titleText
         detailedDescription:(NSString *)detailedDescriptionText
                    priority:(NSNumber *)newPriority
                    complete:(BOOL)completionStatus
                     dueDate:(NSDate *)newDueDate;


@end
