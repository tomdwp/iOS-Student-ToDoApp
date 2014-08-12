//
//  TMDToDoItemCollection.m
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDToDoItemCollection.h"

NSString *const kToDoItemsArrayKey = @"To Do Items Array Key";
NSString *const kToDoGroupsDictionaryKey = @"To Do Group Dictionary Key";

@interface TMDToDoItemCollection ()

@property (strong, nonatomic) NSMutableArray *toDoItems;

@property (strong, nonatomic) NSMutableDictionary *groupsAndItems;



@end


@implementation TMDToDoItemCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        _toDoItems = [[NSMutableArray alloc] init];
        _groupsAndItems = [[NSMutableDictionary alloc] init];
        _applicationName = @"To-Do App";
        
        
        // hard code some items to start out
//        [_toDoItems addObject: [[TMDToDoItem alloc] initWithTitle:@"buy milk"]];
//        [_toDoItems addObject: [[TMDToDoItem alloc] initWithTitle:@"do laundry"]];
//        [_toDoItems addObject: [[TMDToDoItem alloc] initWithTitle:@"water plants"]];
//        ((TMDToDoItem *)(_toDoItems[1])).detailedDescription = @"do wash with colors and whites";
//        ((TMDToDoItem *)(_toDoItems[1])).priority = @2;
//        ((TMDToDoItem *)(_toDoItems[0])).priority = @3;
//        ((TMDToDoItem *)(_toDoItems[1])).dueDate = [NSDate distantFuture];
        
        _groupsAndItems[@"All"] = [_toDoItems mutableCopy];
        _groupsAndItems[@"Fishing Trip"] = [[NSMutableArray alloc] init];
    }
    return self;
}


- (NSUInteger)toDoItemCount
{
    return [self.toDoItems count];
}

- (NSUInteger)groupCount
{
    return [[self.groupsAndItems allKeys] count];
}

- (TMDToDoItem *)itemAtIndex:(NSUInteger)index
{
    if (index >= [self.toDoItems count]) {
        return nil;
    } else {
        return [self.toDoItems objectAtIndex:index];
    }
}


- (NSString *)groupAtIndex:(NSUInteger)index
{
    if (index >= [[self.groupsAndItems allKeys] count]) {
        return nil;
    } else {
        return [[self.groupsAndItems allKeys] objectAtIndex:index];
    }
}

- (void)addGroup:(NSString *)newGroupName
{
    if ([self.groupsAndItems objectForKey:newGroupName] == nil) {
        [self.groupsAndItems setObject:[[NSMutableArray alloc] init] forKey:newGroupName];
    }
}

- (void)addToDoItemWithTitle:(NSString *)titleText
         detailedDescription:(NSString *)detailedDescriptionText
                    priority:(NSNumber *)newPriority
                    complete:(BOOL)completionStatus
                     dueDate:(NSDate *)newDueDate
{
    TMDToDoItem *newItem = [[TMDToDoItem alloc] initWithTitle:titleText
                                                  description:detailedDescriptionText
                                                     priority:newPriority
                                                      dueDate:newDueDate];
    [self.toDoItems addObject:newItem];
}

#pragma mark - NSCoding methods

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.toDoItems forKey:kToDoItemsArrayKey];
    [coder encodeObject:self.groupsAndItems forKey:kToDoGroupsDictionaryKey];
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self) {
        _toDoItems = [coder decodeObjectForKey:kToDoItemsArrayKey];
        _groupsAndItems = [coder decodeObjectForKey:kToDoGroupsDictionaryKey];
    }
    return self;
}

@end
