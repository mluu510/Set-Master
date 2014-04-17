//
//  LearnTableViewController.m
//  Reset Master
//
//  Created by Minh Luu on 4/16/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "LearnTableViewController.h"
#import "CardView.h"
#import "SetCard.h"

@interface LearnTableViewController ()
@property (weak, nonatomic) IBOutlet CardView *set1card1View;
@property (weak, nonatomic) IBOutlet CardView *set1card2View;
@property (weak, nonatomic) IBOutlet CardView *set1card3View;

@property (weak, nonatomic) IBOutlet CardView *set2Card1View;
@property (weak, nonatomic) IBOutlet CardView *set2Card2View;
@property (weak, nonatomic) IBOutlet CardView *set2Card3View;

@property (weak, nonatomic) IBOutlet CardView *set3Card1View;
@property (weak, nonatomic) IBOutlet CardView *set3Card2View;
@property (weak, nonatomic) IBOutlet CardView *set3Card3View;

@property (weak, nonatomic) IBOutlet CardView *set4Card1View;
@property (weak, nonatomic) IBOutlet CardView *set4Card2View;
@property (weak, nonatomic) IBOutlet CardView *set4Card3View;

@property (weak, nonatomic) IBOutlet CardView *set5Card1View;
@property (weak, nonatomic) IBOutlet CardView *set5Card2View;
@property (weak, nonatomic) IBOutlet CardView *set5Card3View;

@property (weak, nonatomic) IBOutlet CardView *set6Card1View;
@property (weak, nonatomic) IBOutlet CardView *set6Card2View;
@property (weak, nonatomic) IBOutlet CardView *set6Card3View;

@property (weak, nonatomic) IBOutlet CardView *set7Card1View;
@property (weak, nonatomic) IBOutlet CardView *set7Card2View;
@property (weak, nonatomic) IBOutlet CardView *set7Card3View;

@property (weak, nonatomic) IBOutlet CardView *set8Card1View;
@property (weak, nonatomic) IBOutlet CardView *set8Card2View;
@property (weak, nonatomic) IBOutlet CardView *set8Card3View;
@end

@implementation LearnTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    self.navigationItem.leftBarButtonItem.title = @"Back";
//    NSLog(@"%@", self.navigationItem.leftBarButtonItem.title);
    

    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"woodbg@2x.jpg"]];
    self.tableView.backgroundView = background;
    
    SetCard *set1Card1 = [[SetCard alloc] initWithSymbol:TRIANGLE color:RED shading:SOLID number:1];
    SetCard *set1Card2 = [[SetCard alloc] initWithSymbol:TRIANGLE color:GREEN shading:SOLID number:1];
    SetCard *set1Card3 = [[SetCard alloc] initWithSymbol:TRIANGLE color:BLUE shading:SOLID number:1];
    
    self.set1card1View.setCard = set1Card1;
    self.set1card2View.setCard = set1Card2;
    self.set1card3View.setCard = set1Card3;
    
    
    SetCard *set2Card1 = [[SetCard alloc] initWithSymbol:TRIANGLE color:RED shading:SOLID number:1];
    SetCard *set2Card2 = [[SetCard alloc] initWithSymbol:CIRCLE color:RED shading:SOLID number:1];
    SetCard *set2Card3 = [[SetCard alloc] initWithSymbol:SQUARE color:RED shading:SOLID number:1];
    
    self.set2Card1View.setCard = set2Card1;
    self.set2Card2View.setCard = set2Card2;
    self.set2Card3View.setCard = set2Card3;
    
    SetCard *set3Card1 = [[SetCard alloc] initWithSymbol:CIRCLE color:GREEN shading:SOLID number:1];
    SetCard *set3Card2 = [[SetCard alloc] initWithSymbol:CIRCLE color:GREEN shading:STRIPED number:1];
    SetCard *set3Card3 = [[SetCard alloc] initWithSymbol:CIRCLE color:GREEN shading:OPEN number:1];
    
    self.set3Card1View.setCard = set3Card1;
    self.set3Card2View.setCard = set3Card2;
    self.set3Card3View.setCard = set3Card3;
    
    SetCard *set4Card1 = [[SetCard alloc] initWithSymbol:SQUARE color:BLUE shading:SOLID number:1];
    SetCard *set4Card2 = [[SetCard alloc] initWithSymbol:SQUARE color:BLUE shading:SOLID number:2];
    SetCard *set4Card3 = [[SetCard alloc] initWithSymbol:SQUARE color:BLUE shading:SOLID number:3];
    
    self.set4Card1View.setCard = set4Card1;
    self.set4Card2View.setCard = set4Card2;
    self.set4Card3View.setCard = set4Card3;
    
    SetCard *set5Card1 = [[SetCard alloc] initWithSymbol:CIRCLE color:BLUE shading:OPEN number:1];
    SetCard *set5Card2 = [[SetCard alloc] initWithSymbol:CIRCLE color:RED shading:SOLID number:1];
    SetCard *set5Card3 = [[SetCard alloc] initWithSymbol:CIRCLE color:GREEN shading:STRIPED number:1];
    
    self.set5Card1View.setCard = set5Card1;
    self.set5Card2View.setCard = set5Card2;
    self.set5Card3View.setCard = set5Card3;
    
    SetCard *set6Card1 = [[SetCard alloc] initWithSymbol:CIRCLE color:BLUE shading:STRIPED number:2];
    SetCard *set6Card2 = [[SetCard alloc] initWithSymbol:SQUARE color:RED shading:STRIPED number:2];
    SetCard *set6Card3 = [[SetCard alloc] initWithSymbol:TRIANGLE color:GREEN shading:STRIPED number:2];
    
    self.set6Card1View.setCard = set6Card1;
    self.set6Card2View.setCard = set6Card2;
    self.set6Card3View.setCard = set6Card3;
    
    // 3 differences
    SetCard *set7Card1 = [[SetCard alloc] initWithSymbol:SQUARE color:GREEN shading:OPEN number:3];
    SetCard *set7Card2 = [[SetCard alloc] initWithSymbol:TRIANGLE color:BLUE shading:OPEN number:2];
    SetCard *set7Card3 = [[SetCard alloc] initWithSymbol:CIRCLE color:RED shading:OPEN number:1];
    
    self.set7Card1View.setCard = set7Card1;
    self.set7Card2View.setCard = set7Card2;
    self.set7Card3View.setCard = set7Card3;
    
    // 4 differences
    SetCard *set8Card1 = [[SetCard alloc] initWithSymbol:CIRCLE color:BLUE shading:SOLID number:2];
    SetCard *set8Card2 = [[SetCard alloc] initWithSymbol:SQUARE color:RED shading:STRIPED number:3];
    SetCard *set8Card3 = [[SetCard alloc] initWithSymbol:TRIANGLE color:GREEN shading:OPEN number:1];
    
    self.set8Card1View.setCard = set8Card1;
    self.set8Card2View.setCard = set8Card2;
    self.set8Card3View.setCard = set8Card3;
    
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
