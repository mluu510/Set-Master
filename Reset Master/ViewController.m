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
    SetCard *setCard = [SetCard alloc] initWithSymbol:SQ color:<#(Color)#> shading:<#(Shading)#> number:<#(int)#>
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
