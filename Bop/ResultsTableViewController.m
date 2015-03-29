//
//  ResultsTableViewController.m
//  Bop
//
//  Created by Ali Eskandari on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

/*
 Abstract:
 The table view controller responsible for displaying the filtered videos as the user types in the search field.
 */

#import "ResultsTableViewController.h"
#import "SearchResultTableViewCell.h"
#import "Video.h"

NSString *const kSearchResultTableViewCellIdentifier = @"rCellID";
NSString *const kSearchResultTableViewCellNibName = @"SearchResultTableViewCell";

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // we use a nib which contains the cell's view and this class as the files owner
    [self.tableView registerNib:[UINib nibWithNibName:kSearchResultTableViewCellNibName bundle:nil] forCellReuseIdentifier:kSearchResultTableViewCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredVideos.count;
}

- (SearchResultTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchResultTableViewCell *cell = (SearchResultTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:kSearchResultTableViewCellIdentifier];
    
    GTLYouTubeSearchResult *result = self.filteredVideos[indexPath.row];
    NSURL *url = [[NSURL alloc] initWithString:result.snippet.thumbnails.defaultProperty.url];
    Video *video = [Video videoWithTitle:result.snippet.title thumbnailURL:url];
    
    [self configureCell:cell forVideo:video];

    return cell;
}

- (void)configureCell:(SearchResultTableViewCell *)cell forVideo:(Video *)video {
    cell.titleLabel.text = video.title;
    cell.videoThumbnailImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL: video.thumbnailURL]];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
