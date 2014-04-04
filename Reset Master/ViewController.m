//
//  ViewController.m
//  Reset Master
//
//  Created by Minh Luu on 4/2/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "ViewController.h"
#import "CardView.h"
#import "SetCard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CardView *cardView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SetCard *setCard = [[SetCard alloc] initWithSymbol:TRIANGLE color:GREEN shading:STRIPED number:1];
    self.cardView.setCard = setCard;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
