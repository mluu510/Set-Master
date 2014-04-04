//
//  CardView.m
//  Reset Master
//
//  Created by Minh Luu on 4/3/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "CardView.h"
#import "ShapeView.h"

@implementation CardView

- (void)setSetCard:(SetCard *)setCard
{
    if (_setCard != setCard) {
        _setCard = setCard;
        [self setNeedsDisplay];
    }
}

- (void)setHighlight:(BOOL)highlight
{
    if (_highlight != highlight) {
        _highlight = highlight;
        [self setNeedsDisplay];
    }
}

- (void)updateView
{
    [self setNeedsDisplay];
}

#define CORNER_RADIUS_RATIO 0.10

- (void)drawRect:(CGRect)rect
{
    [self drawBackgroundWithRect:rect];
    
    [self drawShapes];
}

- (void)drawBackgroundWithRect:(CGRect)rect
{
    CGFloat minLength = MIN(rect.size.width, rect.size.height);
    CGFloat cornerRadius = minLength * CORNER_RADIUS_RATIO;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    
    if (self.setCard.isSelected) {
        [[UIColor lightGrayColor] setFill];
        [path fill];
        [[UIColor grayColor] setStroke];
        [path stroke];
    } else {
        [[UIColor whiteColor] setFill];
        [path fill];
    }
}

#define SYMBOL_LENGTH_RATIO 0.50

- (void)drawShapes
{
    CGFloat minLength = MIN(self.bounds.size.width, self.bounds.size.height);
    CGFloat width = minLength * SYMBOL_LENGTH_RATIO;
    CGRect frame = CGRectMake(0, 0, width, width);
    
    UIColor *color = [self setCardColor:self.setCard.color];
    
    ShapeView *shapeView = [ShapeView shapeViewWithFrame:frame andSymbol:self.setCard.symbol andColor:color andShading:self.setCard.shading];
    shapeView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [self addSubview:shapeView];
    
    ShapeView *shapeView2 = [ShapeView shapeViewWithFrame:frame andSymbol:self.setCard.symbol andColor:color andShading:self.setCard.shading];
    shapeView2.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/5);
    [self addSubview:shapeView2];
    
    ShapeView *shapeView3 = [ShapeView shapeViewWithFrame:frame andSymbol:self.setCard.symbol andColor:color andShading:self.setCard.shading];
    shapeView3.center = CGPointMake(self.bounds.size.width/2, 4*self.bounds.size.height/5);
    [self addSubview:shapeView3];
    
    switch (self.setCard.number) {
        case 1:

            break;
        case 2:
            break;
        case 3:
            break;
        default:
            break;
    }
}

- (UIColor *)setCardColor:(Color)color
{
    switch (self.setCard.color) {
        case RED:
            return [UIColor redColor];
            break;
        case GREEN:
            return [UIColor greenColor];
            break;
        case BLUE:
            return [UIColor purpleColor];
            break;
        default:
            return nil;
            break;
    }
}
@end
