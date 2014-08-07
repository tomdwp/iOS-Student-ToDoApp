//
//  TMDMasterViewController.m
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDMasterViewController.h"
#import "TMDDetailViewController.h"



@interface TMDMasterViewController ()

@property (strong, nonatomic) TMDToDoItemCollection *toDoCollection;
    
@end

@implementation TMDMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.toDoCollection = [[TMDToDoItemCollection alloc] init];
    self.title = self.toDoCollection.applicationName;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear called on TMDMasterViewController...");
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return [self.toDoCollection groupCount];
        
    } else {
        
        return [self.toDoCollection toDoItemCount];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        // deal with group section
        
        UITableViewCell *groupCell = [tableView dequeueReusableCellWithIdentifier:@"GroupCell" forIndexPath:indexPath];
        
        groupCell.textLabel.text = [self.toDoCollection groupAtIndex:indexPath.row];
        
        return groupCell;
        
    } else {
        
        // deal with to-do item section
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];
        
        cell.textLabel.text = [self.toDoCollection itemAtIndex:indexPath.row].title;
        cell.detailTextLabel.text = [self.toDoCollection itemAtIndex:indexPath.row].detailedDescription;
        
        return cell;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //[_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSLog(@"selected group row");
        
    } else if (indexPath.section == 1) {
        NSLog(@"selected to-do item row");
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        if (indexPath.section == 0) {
            //handle group configuration
            
        } else {
            
            //handle To-Do Item configuration
            
            TMDToDoItem *toDoItemSelected = [self.toDoCollection itemAtIndex:indexPath.row];
            
            [[segue destinationViewController] setToDoItem:toDoItemSelected];
            
        }
        
    }
}

@end
