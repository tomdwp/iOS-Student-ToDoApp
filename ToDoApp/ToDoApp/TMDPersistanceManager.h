//
//  TMDPersistanceManager.h
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-11.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TMDToDoItemCollection;

@interface TMDPersistanceManager : NSObject

+ (TMDToDoItemCollection *)loadToDoData;
+ (void)saveToDoData:(TMDToDoItemCollection *)toDoCollectionToSave;


@end
