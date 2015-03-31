//
//  Video.h
//  Bop
//
//  Created by Ali Eskandari on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSURL *thumbnailURL;
@property (nonatomic, copy) NSString *duration;

+ (Video *)videoWithTitle:(NSString *)title thumbnailURL:(NSURL *) thumbnailURL duration:(NSString *) duration;

@end
