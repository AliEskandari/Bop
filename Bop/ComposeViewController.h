//
//  ComposeViewController.h
//  Bop
//
//  Created by Ali Eskandari on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#ifndef Bop_ComposeViewController_h
#define Bop_ComposeViewController_h

#import <UIKit/UIKit.h>
#import "PostTableViewCell.h"
#import "Video.h"
#import "GTLYouTube.h"

@interface ComposeViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *CancelButton;
@property (nonatomic, copy) Video *video;

- (void)configureCell:(PostTableViewCell *)cell forVideo:(Video *)video;
- (IBAction)OnCancelPressed:(id)sender;

@end

#endif
