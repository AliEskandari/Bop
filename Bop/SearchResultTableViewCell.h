//
//  SearchResultTableViewCell.h
//  Bop
//
//  Created by Ali Eskandari on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *videoThumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@end
