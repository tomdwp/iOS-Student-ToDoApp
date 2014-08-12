//
//  TMDPersistanceManager.m
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-11.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDPersistanceManager.h"
#import "TMDToDoItemCollection.h"

@implementation TMDPersistanceManager


static NSString *const kToDoAppArchiveFileName = @"TMDToDoApp_archive";


+ (TMDToDoItemCollection *)loadToDoData
{
    
    NSURL *docsPathToToDoAppDataAsNSURL = [[TMDPersistanceManager getNSURLToDocumentsDirectoryForApp] URLByAppendingPathComponent:kToDoAppArchiveFileName];
    
    NSData* data = [NSData dataWithContentsOfURL:docsPathToToDoAppDataAsNSURL];
    
    TMDToDoItemCollection *toDoItemCollectionFromFile = nil;
    
    if (data) {
        
        // TODO:  add try/catch to catch exception when data is corrupt
        
        toDoItemCollectionFromFile = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    } else {
        toDoItemCollectionFromFile = [[TMDToDoItemCollection alloc] init];
    }
    
    return toDoItemCollectionFromFile;
}


+ (void)saveToDoData:(TMDToDoItemCollection *)toDoCollectionToSave
{
    
    NSURL *docsPathToToDoAppDataAsNSURL = [[TMDPersistanceManager getNSURLToDocumentsDirectoryForApp] URLByAppendingPathComponent:kToDoAppArchiveFileName];
    
    
    NSLog(@"applicationWillResignActive: path to save data to: %@", docsPathToToDoAppDataAsNSURL);
    
    
    NSData* dataToBeSaved = [NSKeyedArchiver archivedDataWithRootObject:toDoCollectionToSave];
    
    [dataToBeSaved writeToURL:docsPathToToDoAppDataAsNSURL atomically:YES];
}

+ (NSURL *)getNSURLToDocumentsDirectoryForApp
{
    NSArray *documentsDirectoryOfURLPaths = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    
    return (NSURL *)[documentsDirectoryOfURLPaths firstObject];
}

@end
