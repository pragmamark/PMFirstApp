//
//  PMFACustomCell.h
//  PMFirstApp
//
//  Created by Stefano Zanetti on 07/06/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMFACustomCell : UITableViewCell
{
    UILabel *_titleLabel;
    UIImageView *_cellImageView;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UIImageView *cellImageView;

- (void)setupCellWithTitle:(NSString *)title andImage:(NSString *)image;

@end
