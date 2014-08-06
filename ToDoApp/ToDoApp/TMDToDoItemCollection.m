//
//  TMDToDoItemCollection.m
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDToDoItemCollection.h"

@interface TMDToDoItemCollection ()

@property (strong, nonatomic) NSMutableArray *toDoItems;

@property (strong, nonatomic) NSMutableDictionary *toDoItemsDictionary;



@end


@implementation TMDToDoItemCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        _toDoItems = [[NSMutableArray alloc] init];
        _applicationName = @"To-Do App";
        
        
        // hard code some items to start out
        [_toDoItems addObject: [[TMDToDoItem alloc] initWithTitle:@"buy milk"]];
        [_toDoItems addObject: [[TMDToDoItem alloc] initWithTitle:@"do laundry"]];
        [_toDoItems addObject: [[TMDToDoItem alloc] initWithTitle:@"water plants"]];
    }
    return self;
}


- (NSUInteger)size
{
    return [self.toDoItems count];
}

- (TMDToDoItem *)itemAtIndex:(NSUInteger)index
{
    if (index >= [self.toDoItems count]) {
        return nil;
    } else {
        return [self.toDoItems objectAtIndex:index];
    }
}


@end
