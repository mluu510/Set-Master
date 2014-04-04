//
//  CardView.h
//  Reset Master
//
//  Created by Minh Luu on 4/3/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCard.h"

@interface CardView : UIView

@property (nonatomic, strong) SetCard *setCard;
@property (nonatomic, getter=isHighlighted) BOOL highlight;

- (void)updateView;

@end
