//
//  BaseTableViewController.h
//  Bop
//
//  Created by Ali Eskandari on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Video;

extern NSString *const kCellIdentifier;

@interface BaseTableViewController : UITableViewController

- (void)configureCell:(UITableViewCell *)cell forVideo:(Video *)video;

@end
