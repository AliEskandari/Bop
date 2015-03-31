//
//  ResultsTableViewController.m
//  Bop
//
//  Created by Ali Eskandari on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

/*
 Abstract:
 The table view controller responsible for displaying the video results as the user types in the search field.
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
    
    self.videos = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataDource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.youtubeSearchResults.count;
}

- (SearchResultTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchResultTableViewCell   *cell   = (SearchResultTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier: kSearchResultTableViewCellIdentifier];
    GTLYouTubeSearchResult      *result = self.youtubeSearchResults[indexPath.row];
    Video                       *video  = nil;
    
    // Grab video object from array if already made
    if ([self.videos count] > indexPath.row) {
        video = self.videos[indexPath.row];
    }
    // Create new video object
    else {
        video = [Video videoWithTitle: result.snippet.title
                         thumbnailURL: [[NSURL alloc] initWithString:result.snippet.thumbnails.defaultProperty.url]
                             duration: nil];
    
        [self.videos insertObject:video atIndex:indexPath.row];
        
        // Create a service object for executing queries
        GTLServiceYouTube *service = self.youTubeService;
        
        // Create a query
        GTLQueryYouTube *query = [GTLQueryYouTube queryForVideosListWithPart:@"contentDetails"];
        query.identifier = [[result.JSON objectForKey:@"id"] objectForKey:@"videoId"];
        query.maxResults = 1;
        query.fields = @"items/contentDetails";
        
        // Execute query
        [service executeQuery:query
            completionHandler:^(GTLServiceTicket *ticket,
                                id object,
                                NSError *error) {
                if (error == nil) {
                    
                    GTLYouTubeVideoListResponse *detalhe = object;
                    
                    NSMutableDictionary *responseJSON = detalhe.JSON;
                    NSArray *tempArray = [responseJSON objectForKey:@"items"];
                    NSMutableDictionary *items = tempArray[0];
                    NSMutableDictionary *contentDetails = [items objectForKey:@"contentDetails"];
                    
                    NSString *duration = [[NSString alloc] initWithFormat:@"%@",[contentDetails objectForKey:@"duration"]];
                    
                    
                    ((Video *)[self.videos objectAtIndex:indexPath.row]).duration = [self formatDurationFromString:duration];
                    cell.durationLabel.text = [self formatDurationFromString:duration];
                }
                else {
                    NSLog(@"%@", error.description);
                }
            }];
    }
    
    [self configureCell:cell forVideo:video];
    return cell;
}

#pragma mark - Helper Methods

- (void)configureCell:(SearchResultTableViewCell *)cell forVideo:(Video *)video {
    cell.titleLabel.text = video.title;
    cell.videoThumbnailImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL: video.thumbnailURL]];
    cell.durationLabel.text = video.duration;
}

- (NSString *)getVideoIdFromURL: (NSURL *) url {
    
    NSString *searchedString = [url absoluteString];
    NSRange   searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = @"//i.ytimg.com/vi/(.*)/default.jpg";
    NSError  *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
    NSArray* matches = [regex matchesInString:searchedString options:0 range: searchedRange];
    NSTextCheckingResult* match = matches[0];
    NSRange group1 = [match rangeAtIndex:1];
    NSString *videoId = [searchedString substringWithRange:group1];

    return videoId;
}

- (NSString *)formatDurationFromString: (NSString *) string {
    NSString *searchedString = string;
    NSRange   searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = @"PT(?:(\\d*)H)?(?:(\\d*)M)?(?:(\\d*)S)?";
    NSError  *error = nil;
    
    NSString *hours = @"";
    NSString *minutes = @"";
    NSString *seconds = @"";
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
    NSArray* matches = [regex matchesInString:searchedString options:0 range: searchedRange];

    NSTextCheckingResult* match = matches[0];
    
    NSRange group1 = [match rangeAtIndex:1];
    if (group1.length != 0) {
        hours = [searchedString substringWithRange:group1];
    }
    
    NSRange group2 = [match rangeAtIndex:2];
    if (group2.length != 0) {
        minutes =[searchedString substringWithRange:group2];
    }
    
    NSRange group3 = [match rangeAtIndex:3];
    if (group3.length != 0) {
        seconds = [searchedString substringWithRange:group3];
    }
    
    return [NSString stringWithFormat:@"%@, %@:%@:%@",string,hours,minutes,seconds];
}

#pragma mark - GTLServiceYouTube

// Get a service object
//
// A "service" object handles networking tasks.  Service objects
// contain user authentication information as well as networking
// state information such as cookies set by the server in response
// to queries.
- (GTLServiceYouTube *)youTubeService {
    static GTLServiceYouTube *service;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[GTLServiceYouTube alloc] init];
        
        // Have the service object set tickets to fetch consecutive pages
        // of the feed so we do not need to manually fetch them.
        //service.shouldFetchNextPages = YES;
        
        // Have the service object set tickets to retry temporary error conditions
        // automatically.
        service.retryEnabled = YES;
        
        // Services which do not require sign-in may need an API key from the
        // API Console
        service.APIKey = @"AIzaSyAPGx5PbhdoO2QTR16yZHgMj-Q2vqO8W1M";
        
    });
    return service;
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
