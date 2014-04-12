//
//  MenuViewController.m
//  Reset Master
//
//  Created by Minh Luu on 4/11/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"

@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UIButton *easyButton;
@property (weak, nonatomic) IBOutlet UIButton *hardButton;
@end

@implementation MenuViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    GameViewController *gameVC = segue.destinationViewController;
    if (sender == self.easyButton) {
        gameVC.mode = EASY;
    } else if (sender == self.hardButton) {
        gameVC.mode = HARD;
    }
}

@end
