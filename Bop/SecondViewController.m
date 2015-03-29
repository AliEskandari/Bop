//
//  SecondViewController.m
//  Bop
//
//  Created by Ali Eskandari on 3/28/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *videoId = @"L0MK7qz13bU";
    
    // For a full list of player parameters, see the documentation for the HTML5 player
    // at: https://developers.google.com/youtube/player_parameters?playerVersion=HTML5
    NSDictionary *playerVars = @{
                                 @"controls" : @0,
                                 @"playsinline" : @1,
                                 @"autohide" : @1,
                                 @"showinfo" : @0,
                                 @"modestbranding" : @1
                                 };
    self.playerView.delegate = self;
    [self.playerView loadWithVideoId:videoId playerVars:playerVars];
    [self.playerView pauseVideo];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector: @selector(enteredBackground:)
                                                 name: @"enteredBackgroundEvent"
                                               object: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    switch (state) {
        case kYTPlayerStatePlaying:
            NSLog(@"Started playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            //[self.playerView playVideo];
            break;
        default:
            break;
    }
}

- (void)enteredBackground:(NSNotification * )notification {
    NSLog(@"Entered Background and resuming playback");
    [self.playerView playVideo];
}


@end
