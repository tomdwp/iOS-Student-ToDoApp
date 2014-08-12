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

static NSString *const kToDoCreateDateKey = @"To Do Create Date Key";
static NSString *const kToDoDueDateKey = @"To Do Due Date Key";
static NSString *const kToDoTitleKey = @"To Do Title Key";
static NSString *const kToDoDetailedDescriptionKey = @"To Do Detailed Description Key";
static NSString *const kToDoPriorityKey = @"To Do Priority Key";
static NSString *const kToDoCompleteKey = @"To Do Complete Key";

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

- (NSString *)description
{
    return [NSString stringWithFormat:@"To-Do Item: Title: [%@]  Detail: [%@] Priority: [%@] DueDate: [%@]", self.title, self.detailedDescription, self.priority, self.dueDate];
}


#pragma mark - NSCoding methods

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.title forKey:kToDoTitleKey];
    [coder encodeObject:self.detailedDescription forKey:kToDoDetailedDescriptionKey];
    [coder encodeObject:self.priority forKey:kToDoPriorityKey];
    [coder encodeBool:self.complete forKey:kToDoCompleteKey];
    [coder encodeObject:self.createDate forKey:kToDoCreateDateKey];
    [coder encodeObject:self.dueDate forKey:kToDoDueDateKey];
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self) {
        _title = [coder decodeObjectForKey:kToDoTitleKey];
        _detailedDescription = [coder decodeObjectForKey:kToDoDetailedDescriptionKey];
        _priority = [coder decodeObjectForKey:kToDoPriorityKey];
        _complete = [coder decodeBoolForKey:kToDoCompleteKey];
        _createDate = [coder decodeObjectForKey:kToDoCreateDateKey];
        _dueDate = [coder decodeObjectForKey:kToDoDueDateKey];
    }
    return self;
}


@end
