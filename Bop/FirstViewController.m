//
//  FirstViewController.m
//  Bop
//
//  Created by Ali Eskandari on 3/28/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import "FirstViewController.h"
#import "SongCell.h"
#import <Parse/Parse.h>

@interface FirstViewController ()
@end

NSString *const tableCellNibName = @"SongCell";
NSString *const cellID = @"SongCellID";

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // we use a nib which contains the cell's view and this class as the files owner
    [self.tableView registerNib:[UINib nibWithNibName:tableCellNibName bundle:nil] forCellReuseIdentifier:cellID];
    
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}

// This is where you set the cell's data
- (void)tableView:(UITableView *)tableView willDisplayCell:(SongCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.title.text = @"YTTitle";
}

// This returns the custom SongCell object
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SongCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:tableCellNibName bundle:nil] forCellReuseIdentifier:cellID];
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnComposePressed:(id)sender {
    [self performSegueWithIdentifier:@"ComposeSegue" sender:self];
}
@end
