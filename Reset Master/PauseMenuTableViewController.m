//
//  PauseMenuTableViewController.m
//  Reset Master
//
//  Created by Minh Luu on 4/9/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "PauseMenuTableViewController.h"

@interface PauseMenuTableViewController () <UIAlertViewDelegate>


@end

@implementation PauseMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"woodbg@2x.jpg"]];
    self.tableView.backgroundColor = background;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
        case 1:
            return self.sets.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Menu Item"];
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Resume";
                    break;
                case 1:
                    cell.textLabel.text = @"Quit";
                    break;
                default:
                    break;
            }
            return cell;
        }
        case 1: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Set Cell"];
            return cell;
        }
    }
    return nil;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    if (cell == self.resumeCell) {
//        [self.navigationController popViewControllerAnimated:YES];
//    } else if (cell == self.quitCell) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?" message:nil delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
//        [alert show];
//        
//
//    }
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (buttonIndex == 1) { // User clicked "Yes"
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    }
//}

@end
