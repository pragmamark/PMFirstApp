//
//  PMFACustomCell.m
//  PMFirstApp
//
//  Created by Stefano Zanetti on 07/06/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMFACustomCell.h"

@implementation PMFACustomCell

@synthesize titleLabel = _titleLabel;
@synthesize cellImageView = _cellImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [_titleLabel release];
    [_cellImageView release];
    
    [super dealloc];
}

- (void)setupCellWithTitle:(NSString *)title andImage:(NSString *)image
{
    self.titleLabel.text = title;
    self.cellImageView.image = [UIImage imageNamed:image];
}

@end
