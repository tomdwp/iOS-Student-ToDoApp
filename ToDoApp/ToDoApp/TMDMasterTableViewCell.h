//
//  TMDMasterTableViewCell.h
//  ToDoApp
//
//  Created by Tom Daggett on 2014-08-06.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMDMasterTableViewCell : UITableViewCell




@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *toDoPriorityTextField;





@end
