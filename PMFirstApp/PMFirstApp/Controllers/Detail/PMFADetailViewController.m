//
//  PMFADetail2ViewController.m
//  PMFirstApp
//
//  Created by Stefano Zanetti on 30/05/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMFADetailViewController.h"

@interface PMFADetailViewController ()

@end

@implementation PMFADetailViewController

#pragma mark -
#pragma mark Properties

@synthesize detailLabel		= _detailLabel;
@synthesize detailString	= _detailString;
@synthesize delegate		= _delegate;

#pragma mark -
#pragma mark View life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
	if (self) {
		// Custom initialization
	}
    
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil detail:(NSString *)detail
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
	if (self) {
		self.detailString = detail;
	}
    
	return self;
}

- (IBAction)confirmButtonPressed:(id)sender
{
	if ((_delegate) && ([_delegate respondsToSelector:@selector(didCorfimName:)])) {
		[_delegate didCorfimName:_detailString];
	}
    
	[self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
	self.title = @"Detail";
    
	self.detailLabel.text = self.detailString;
    
	// Do any additional setup after loading the view from its nib.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationPortrait;
}

#pragma mark -
#pragma mark Memory management

- (void)viewDidUnload
{
	self.detailLabel	= nil;
	self.detailString	= nil;
	self.delegate		= nil;
    
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc
{
	[_detailLabel release];
	[_detailString release];
    
	_delegate = nil;
    
	[super dealloc];
}

@end