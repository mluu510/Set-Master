//
//  SetTableViewCell.m
//  Reset Master
//
//  Created by Minh Luu on 4/11/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "SetTableViewCell.h"

@interface SetTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *card1;
@property (weak, nonatomic) IBOutlet UIView *card2;
@property (weak, nonatomic) IBOutlet UIView *card3;

@end

@implementation SetTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
