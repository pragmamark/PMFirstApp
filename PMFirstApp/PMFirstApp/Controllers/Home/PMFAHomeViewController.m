//
//  PMFAViewController.m
//  PMFirstApp
//
//  Created by Stefano Zanetti on 30/05/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMFAHomeViewController.h"
#import "PMFAMasterViewController.h"
#import "PMFAModalViewController.h"

@interface PMFAHomeViewController ()

@end

@implementation PMFAHomeViewController

#pragma mark -
#pragma mark Properties

@synthesize nameLabel = _nameLabel;

#pragma mark -
#pragma mark View life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Home"; 
    _modalTransitionType = 0;
    
    UIImageView *pragmaMarkImageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pragma_mark.png"]] autorelease];
    
    pragmaMarkImageView.contentMode = UIViewContentModeScaleAspectFit;
    pragmaMarkImageView.frame = CGRectMake(10, self.view.bounds.size.height - 100, 300, 50);
        
    [self.view addSubview:pragmaMarkImageView];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark Memory management

- (void)viewDidUnload
{
    self.nameLabel = nil;
    
    [super viewDidUnload];    
    // Release any retained subviews of the main view.
}

- (void)dealloc
{    
    [_nameLabel release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark IBActions

- (IBAction)modalButtonPressed:(id)sender
{
    PMFAModalViewController *modalController = [[[PMFAModalViewController alloc] initWithNibName:@"PMFAModalViewController" bundle:nil] autorelease];
    
//    UIModalTransitionStyle:
//
//    UIModalTransitionStyleCoverVertical = 0,
//    UIModalTransitionStyleFlipHorizontal,
//    UIModalTransitionStyleCrossDissolve,
//    UIModalTransitionStylePartialCurl,
    
    [modalController setModalTransitionStyle:_modalTransitionType];
    
    _modalTransitionType = (_modalTransitionType == 3) ? 0 : _modalTransitionType + 1;
    
    [self presentModalViewController:modalController animated:YES];
}

- (IBAction)masterButtonPressed:(id)sender
{
    PMFAMasterViewController *masterController = [[[PMFAMasterViewController alloc] initWithNibName:@"PMFAMasterViewController" bundle:nil] autorelease];
    masterController.delegate = self;
    
    [self.navigationController pushViewController:masterController animated:YES];
}

#pragma mark -
#pragma mark PMFADetailViewControllerDelegate

- (void)didCorfimName:(NSString *)name
{
    self.nameLabel.text = name;
}



@end
