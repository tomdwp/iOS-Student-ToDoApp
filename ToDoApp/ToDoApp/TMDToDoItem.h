//
//  TMDToDoItem.h
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDToDoItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detailedDescription;
@property (strong, nonatomic) NSNumber *priority;
@property (nonatomic, getter = isComplete) BOOL complete;
@property (strong, nonatomic) NSDate *dueDate;

@end
