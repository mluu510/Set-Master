//
//  SetCard.m
//  Set Free
//
//  Created by Minh Luu on 4/1/13.
//  Copyright (c) 2013 Minh Luu. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (id)initWithSymbol:(Symbol)aSymbol color:(Color)aColor shading:(Shading)aShading number:(int)aNumber {
    if (self = [super init]) {
        self.symbol = aSymbol;
        self.color = aColor;
        self.shading = aShading;
        self.number = aNumber;
        self.select = NO;
    }
    return self;
}
@end
