//
//  PMFADetail1ViewController.h
//  PMFirstApp
//
//  Created by Stefano Zanetti on 30/05/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMFADetailViewControllerDelegate.h"

@interface PMFAMasterViewController : UIViewController<UITextFieldDelegate, PMFADetailViewControllerDelegate, UIAlertViewDelegate>
{
    UITextField *_inputTextField;
    id<PMFADetailViewControllerDelegate> _delegate;
}

@property (nonatomic, retain) IBOutlet UITextField *inputTextField;
@property (nonatomic, assign) id<PMFADetailViewControllerDelegate> delegate;

- (IBAction)detailButtonPressed:(id)sender;

@end
