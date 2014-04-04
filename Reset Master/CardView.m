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

#define CORNER_RADIUS_RATIO 0.18

- (void)drawRect:(CGRect)rect
{
    [self drawBackgroundWithRect:rect];
    
    [self drawShapes];
}

- (void)drawBackgroundWithRect:(CGRect)rect
{
    CGFloat cornerRadius = rect.size.width * CORNER_RADIUS_RATIO;
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

#define SYMBOL_WIDTH_RATIO 0.18
#define SYMBOL_HEIGHT_RATIO 0.70

- (void)drawShapes
{
    CGRect frame = CGRectMake(0, 0, self.bounds.size.width * SYMBOL_WIDTH_RATIO, self.bounds.size.height * SYMBOL_HEIGHT_RATIO);
    
    UIColor *color = [self setCardColor:self.setCard.color];
    
    ShapeView *shapeView = [ShapeView shapeViewWithFrame:frame andSymbol:self.setCard.symbol andColor:color andShading:self.setCard.shading];
    
    [self addSubview:shapeView];
    
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
        case PURPLE:
            return [UIColor purpleColor];
            break;
        default:
            return nil;
            break;
    }
}
@end
