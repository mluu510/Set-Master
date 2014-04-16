//
//  SetTableViewCell.h
//  Reset Master
//
//  Created by Minh Luu on 4/11/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

@interface SetTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *set;
@property (weak, nonatomic) IBOutlet CardView *card1;
@property (weak, nonatomic) IBOutlet CardView *card2;
@property (weak, nonatomic) IBOutlet CardView *card3;


@end
