//
//  PMFADetail1ViewController.m
//  PMFirstApp
//
//  Created by Stefano Zanetti on 30/05/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMFAMasterViewController.h"
#import "PMFADetailViewController.h"

@interface PMFAMasterViewController ()

@end

@implementation PMFAMasterViewController

#pragma mark -
#pragma mark Properties

@synthesize inputTextField	= _inputTextField;
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

- (void)viewDidLoad
{
	[super viewDidLoad];
    
	self.title = @"Master";
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationPortrait;
}

#pragma mark -
#pragma mark Memory management

- (void)viewDidUnload
{
	self.inputTextField = nil;
	self.delegate		= nil;
    
	[super viewDidUnload];
	// Release any retained subviews of the main view.
}

- (void)dealloc
{
	[_inputTextField release];
    
	_delegate = nil;
    
	[super dealloc];
}

#pragma mark -
#pragma mark IBActions

- (IBAction)detailButtonPressed:(id)sender
{
    if (_inputTextField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                            message:@"Name is a required field!" 
                                                           delegate:self 
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK", nil];
        [alertView show];
        [alertView release];
        return;
    }
    
    
	PMFADetailViewController *detailController = [[[PMFADetailViewController alloc] initWithNibName:@"PMFADetailViewController"
                                                                                             bundle:nil
                                                                                             detail:_inputTextField.text] autorelease];
	detailController.delegate = self;
    
	detailController.detailLabel.text = _inputTextField.text;
    
	[self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark -
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            
            // Cancel button pressed
            
            break;
        
        case 1:
            
            [_inputTextField becomeFirstResponder];
            
            break;

        default:
            break;
    }
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
    
	return YES;
}

#pragma mark -
#pragma mark PMFADetailViewControllerDelegate

- (void)didCorfimName:(NSString *)name
{
	if ((_delegate) && ([_delegate respondsToSelector:@selector(didCorfimName:)])) {
		[_delegate didCorfimName:name];
	}
}

@end