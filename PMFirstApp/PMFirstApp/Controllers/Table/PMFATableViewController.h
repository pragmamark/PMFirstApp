//
//  PMFATableViewController.h
//  PMFirstApp
//
//  Created by Stefano Zanetti on 07/06/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMFATableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_elements;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *elements;

@end
