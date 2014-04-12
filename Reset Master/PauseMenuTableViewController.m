//
//  PauseMenuTableViewController.m
//  Reset Master
//
//  Created by Minh Luu on 4/9/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "PauseMenuTableViewController.h"

@interface PauseMenuTableViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableViewCell *resumeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *quitCell;

@end

@implementation PauseMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"woodbg@2x.jpg"]];
    self.tableView.backgroundColor = background;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == self.resumeCell) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if (cell == self.quitCell) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?" message:nil delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alert show];
        

    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) { // User clicked "Yes"
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
