//
//  SecondViewController.h
//  Bop
//
//  Created by Ali Eskandari on 3/28/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"
@import AVFoundation;

@interface SecondViewController : UIViewController<YTPlayerViewDelegate>

@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;


@end

