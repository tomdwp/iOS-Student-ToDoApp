//
//  TMDToDoItemCollection.h
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDToDoItem.h"

@interface TMDToDoItemCollection : NSObject

@property (strong, nonatomic, readonly) NSMutableArray *toDoItems;
@property (strong, nonatomic) NSString *applicationName;

- (NSUInteger)size;
- (TMDToDoItem *)itemAtIndex:(NSUInteger)index;

@end
