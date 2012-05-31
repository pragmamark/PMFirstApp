//
//  PMFAViewController.h
//  PMFirstApp
//
//  Created by Stefano Zanetti on 30/05/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMFADetailViewControllerDelegate.h"

@interface PMFAHomeViewController : UIViewController<PMFADetailViewControllerDelegate>
{
    int _modalTransitionType;
    
    UILabel *_nameLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *nameLabel;

- (IBAction)modalButtonPressed:(id)sender;
- (IBAction)masterButtonPressed:(id)sender;

@end
