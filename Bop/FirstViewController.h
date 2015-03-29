//
//  FirstViewController.h
//  Bop
//
//  Created by Ali Eskandari on 3/28/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *ComposeButton;
@property (weak, nonatomic) IBOutlet UITableView *table;
- (IBAction)OnComposePressed:(id)sender;

@end

