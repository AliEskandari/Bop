//
//  FirstViewController.h
//  Bop
//
//  Created by Ali Eskandari on 3/28/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *ComposeButton;
- (IBAction)OnComposePressed:(id)sender;

@end

