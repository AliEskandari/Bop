//
//  SongCell.h
//  Bop
//
//  Created by James Wills on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCSwipeTableViewCell.h"

@interface SongCell : MCSwipeTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
