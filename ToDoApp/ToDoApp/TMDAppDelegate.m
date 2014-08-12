//
//  TMDAppDelegate.m
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDAppDelegate.h"
#import "TMDMasterViewController.h"


NSString* const kToDoAppArchiveFileName = @"TMDToDoApp_archive";

@implementation TMDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    UINavigationController *mainController = (UINavigationController *) self.window.rootViewController;
    TMDMasterViewController *myMasterViewController =  [mainController.viewControllers firstObject];
    
    NSArray *documentsDirectoryOfURLPaths = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    
    
    NSURL *docsPathAsNSURL = [documentsDirectoryOfURLPaths firstObject];
    
    NSURL *docsPathToToDoAppDataAsNSURL = [docsPathAsNSURL URLByAppendingPathComponent:kToDoAppArchiveFileName];
    
    NSData* data = [NSData dataWithContentsOfURL:docsPathToToDoAppDataAsNSURL];
    
    if (data) {
        myMasterViewController.toDoCollection = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    
    
    id defaultDaysInFutureForDueDate = [userDefaults objectForKey:@"TMDToDoApp.defaultTimeInFutureForDueDate"];
    
    if (!defaultDaysInFutureForDueDate) {
        NSLog(@"TMDToDoApp.defaultTimeInFutureForDueDate not found in NSUserDefaults.  Resetting to 14");
        [userDefaults setInteger:14 forKey:@"TMDToDoApp.defaultTimeInFutureForDueDate"];
    }
    //NSInteger theHighScore = [defaults integerForKey:@"HighScore"];
    
    NSLog(@"defaultDaysInFutureForDueDate is:  %@", defaultDaysInFutureForDueDate);
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive called");
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    UINavigationController *mainController = (UINavigationController *) self.window.rootViewController;
    TMDMasterViewController *myMasterViewController =  [mainController.viewControllers firstObject];
    
    
//    NSArray *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSLog(@"documentsDirectory:  %@", documentsDirectory);
//    
//    NSString *docsPath = [documentsDirectory lastObject];
//    
//    docsPath = [docsPath stringByAppendingString:@"/"];
//
//    
//    NSString *archivePathForToDoApp = [docsPath stringByAppendingString:kToDoAppArchiveFileName];
//    
    
    NSArray *documentsDirectoryOfURLPaths = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    
    
    NSURL *docsPathAsNSURL = [documentsDirectoryOfURLPaths firstObject];
    
    NSURL *docsPathToToDoAppDataAsNSURL = [docsPathAsNSURL URLByAppendingPathComponent:kToDoAppArchiveFileName];

    
    NSLog(@"applicationWillResignActive: path to save data to: %@", docsPathToToDoAppDataAsNSURL);
    
    
    NSData* dataToBeSaved = [NSKeyedArchiver archivedDataWithRootObject:myMasterViewController.toDoCollection];
    
    //[dataToBeSaved writeToFile:archivePathForToDoApp atomically:YES];
    
    [dataToBeSaved writeToURL:docsPathToToDoAppDataAsNSURL atomically:YES];
    
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground called ...");
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.


}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
