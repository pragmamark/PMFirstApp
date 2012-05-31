//
//  PMFADetail2ViewController.h
//  PMFirstApp
//
//  Created by Stefano Zanetti on 30/05/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMFADetailViewControllerDelegate.h"

@interface PMFADetailViewController : UIViewController
{
	UILabel		*_detailLabel;
	NSString	*_detailString;
    
    id<PMFADetailViewControllerDelegate> _delegate;
}

@property (nonatomic, retain) IBOutlet UILabel	*detailLabel;
@property (nonatomic, copy) NSString			*detailString;

@property (nonatomic, assign) id<PMFADetailViewControllerDelegate> delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil detail:(NSString *)detail;

- (IBAction)confirmButtonPressed:(id)sender;

@end