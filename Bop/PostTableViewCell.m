//
//  PostTableViewCell.m
//  Bop
//
//  Created by Ali Eskandari on 3/29/15.
//  Copyright (c) 2015 jab. All rights reserved.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.titleLabel.text = @"title";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
