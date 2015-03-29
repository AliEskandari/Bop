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
#import "BaseTableViewController.h"

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *CancelButton;
- (IBAction)OnCancelPressed:(id)sender;

@property (nonatomic, copy) NSArray *videos;

@end

#endif
