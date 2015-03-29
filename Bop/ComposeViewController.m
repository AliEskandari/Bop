//
//  ComposeViewController.m
//  Bop
//
//  Created by Ali Eskandari on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import "ComposeViewController.h"
#import <Parse/Parse.h>

@interface ComposeViewController ()
@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    //    testObject[@"foo"] = @"bar";
    //    [testObject saveInBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnCancelPressed:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end