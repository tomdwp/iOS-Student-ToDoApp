//
//  TMDToDoItem.h
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDToDoItem : NSObject <NSCoding>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detailedDescription;
@property (strong, nonatomic) NSNumber *priority;
@property (nonatomic, getter = isComplete) BOOL complete;
@property (strong, nonatomic, readonly) NSDate *createDate;
@property (strong, nonatomic) NSDate *dueDate;

- (instancetype)initWithTitle:(NSString *)title;

- (instancetype)initWithTitle:(NSString *)title
                  description:(NSString *)desc
                     priority:(NSNumber *)priority
                      dueDate:(NSDate *)dueDate;

@end
