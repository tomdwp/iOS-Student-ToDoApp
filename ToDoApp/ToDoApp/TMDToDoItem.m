//
//  TMDToDoItem.m
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDToDoItem.h"

@interface TMDToDoItem ()

@property (strong, nonatomic) NSDate *createDate;

@end

@implementation TMDToDoItem


- (instancetype)init
{
    return [self initWithTitle:@""
                   description:nil
                      priority:nil
                       dueDate:nil];
}

- (instancetype)initWithTitle:(NSString *)title
{
    return [self initWithTitle:title
                   description:nil
                      priority:nil
                       dueDate:nil];
}


// designated initializer
- (instancetype)initWithTitle:(NSString *)title
                  description:(NSString *)desc
                     priority:(NSNumber *)priority
                      dueDate:(NSDate *)dueDate
{
    self = [super init];
    
    if (self) {
        _title = title;
        _detailedDescription = desc;
        _priority = priority;
        _complete = NO;
        _dueDate = [dueDate copy];
        _createDate = [[NSDate alloc] init];
        
        
    }
    
    
    return self;
}




@end
