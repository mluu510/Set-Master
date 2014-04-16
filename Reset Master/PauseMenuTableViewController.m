//
//  PauseMenuTableViewController.m
//  Reset Master
//
//  Created by Minh Luu on 4/9/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "PauseMenuTableViewController.h"
#import "SetTableViewCell.h"

@interface PauseMenuTableViewController () <UIAlertViewDelegate>


@end

@implementation PauseMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"woodbg@2x.jpg"]];
    self.tableView.backgroundView = background;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return @"Found Sets";
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(0, 20, 320, 20);
    myLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    myLabel.textColor = [UIColor whiteColor];
    myLabel.textAlignment = NSTextAlignmentCenter;
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    UIView *headerView = [[UIView alloc] init];
    [headerView addSubview:myLabel];
    
    return headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        // Resume and Quit button
        case 0:
            return 2;
        // Set Cell Count
        case 1:
            return self.sets.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        //
        // Resume and Quit button
        //
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
            
        //
        // Set Cell
        //
        case 1: {
            SetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Set Cell"];
            NSArray *set = [self.sets objectAtIndex:indexPath.row];
            cell.card1.setCard = set[0];
            cell.card2.setCard = set[1];
            cell.card3.setCard = set[2];
            return cell;
        }
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 44;
        case 1:
            return 130;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [self.navigationController popViewControllerAnimated:YES];
                break;
            case 1: {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?" message:nil delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
                [alert show];
            }
            default:
                break;
        }
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) { // User clicked "Yes"
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
