//
//  PMFATableViewController.m
//  PMFirstApp
//
//  Created by Stefano Zanetti on 07/06/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMFATableViewController.h"
#import "PMFADetailViewController.h"
#import "PMFACustomCell.h"

@interface PMFATableViewController ()

@end

@implementation PMFATableViewController

#pragma mark -
#pragma mark Properties

@synthesize tableView	= _tableView;
@synthesize elements	= _elements;

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
    
	self.title = @"TableView";
    
	NSArray *elements = [NSArray arrayWithObjects:@"Objective-C",
                         @"UIViewController",
                         @"UITabBarController",
                         @"UINavigationController",
                         @"UITableView",
                         @"UITableViewCell",
                         nil];
    
	self.elements = elements;
	// Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    
	[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationPortrait;
}

#pragma mark -
#pragma mark Memory management

- (void)viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc
{
	[_tableView release];
	[_elements release];
	[super dealloc];
}

#pragma mark -
#pragma mark UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_elements count];
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *cellIdentifier = @"CustomCell";
    
	//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    PMFACustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
	if (cell == nil) {
		//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PMFACustomCell" owner:self options:nil] objectAtIndex:0];
	}
    
	//cell.textLabel.text = [_elements objectAtIndex:indexPath.row];
    [cell setupCellWithTitle:[_elements objectAtIndex:indexPath.row] andImage:@"pragma_mark.png"];
    
	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	PMFADetailViewController *detailController = [[PMFADetailViewController alloc] initWithNibName :@"PMFADetailViewController"
                                                                                             bundle:nil
                                                                                             detail:[_elements objectAtIndex:indexPath.row]];
    
	[self.navigationController pushViewController:detailController animated:YES];
	[detailController release];
}

@end