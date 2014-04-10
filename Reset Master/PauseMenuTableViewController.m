//
//  PauseMenuTableViewController.m
//  Reset Master
//
//  Created by Minh Luu on 4/9/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "PauseMenuTableViewController.h"

@interface PauseMenuTableViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *resumeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *quitCell;

@end

@implementation PauseMenuTableViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == self.resumeCell) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else if (cell == self.quitCell) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
