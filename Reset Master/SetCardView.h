//
//  SetCardView.h
//  Set Free
//
//  Created by Minh Luu on 3/26/13.
//  Copyright (c) 2013 Minh Luu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCard.h"

@interface SetCardView : UIView

@property (nonatomic, strong) SetCard *setCard;
@property (nonatomic, getter=isHighlighted) BOOL highlight;

- (void)updateView;

@end
