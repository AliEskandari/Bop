//
//  Video.m
//  Bop
//
//  Created by Ali Eskandari on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import "Video.h"

@implementation Video
+ (Video *)videoWithTitle:(NSString *)title thumbnailURL:(NSURL *)thumbnailURL {
    Video *newVideo = [[self alloc] init];
    newVideo.title = title;
    newVideo.thumbnailURL = thumbnailURL;

    return newVideo;
}
@end
