//
//  ShapeView.h
//  Reset Master
//
//  Created by Minh Luu on 4/3/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCard.h"

@interface ShapeView : UIView

@property (nonatomic) Symbol symbol;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic) Shading shading;

- (id)initWithFrame:(CGRect)frame andSymbol:(Symbol)symbol andColor:(UIColor *)color andShading:(Shading)shading;
+ (ShapeView *)shapeViewWithFrame:(CGRect)frame andSymbol:(Symbol)symbol andColor:(UIColor *)color andShading:(Shading)shading;

@end
