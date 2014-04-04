//
//  SetCardView.m
//  Set Free
//
//  Created by Minh Luu on 3/26/13.
//  Copyright (c) 2013 Minh Luu. All rights reserved.
//

#import "SetCardView.h"


@implementation SetCardView

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

#define DEGREES_TO_RADIANS(degrees) ((M_PI * degrees)/ 180)
#define CARD_CORNER_RADIUS_RATIO 0.10
#define SYMBOL_WIDTH_RATIO 0.18
#define SYMBOL_HEIGHT_RATIO 0.70
#define SYMBOL_SPACING 5.0

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGRect bgRect = CGRectMake(self.bounds.origin.x+1.0, self.bounds.origin.y+1.0, self.bounds.size.width-2.0, self.bounds.size.height-2.0);
    
    // Card background
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bgRect cornerRadius:self.bounds.size.width*CARD_CORNER_RADIUS_RATIO];
    
    if (self.setCard.isSelected) {
        [[UIColor lightGrayColor] setFill];
        [path fill];
        [[UIColor grayColor] setStroke];
        [path stroke];
    } else {
        [[UIColor whiteColor] setFill];
        [path fill];
    }


    [self drawSymbols];
}

- (void)drawSymbols
{
    
    switch (self.setCard.color) {
        case RED:
            [[UIColor redColor] set];
            break;
        case GREEN:
            [[UIColor greenColor] set];
            break;
        case PURPLE:
            [[UIColor purpleColor] set];
            break;
        default:
            break;
    }
    
    // Calculate size of each symbols
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGSize symbolSize = CGSizeMake(self.bounds.size.width*SYMBOL_WIDTH_RATIO, self.bounds.size.height*SYMBOL_HEIGHT_RATIO);
    
    CGRect centerSymbolRect = CGRectMake(center.x-symbolSize.width/2, center.y-symbolSize.height/2, symbolSize.width, symbolSize.height);

    // Calculate symbol position based on number of symbols
    switch (self.setCard.number) {
        case 1:
            [self drawSymbolIntoRect:centerSymbolRect];
            break;
        case 2:
            [self drawSymbolIntoRect:CGRectMake(center.x-SYMBOL_SPACING/2-symbolSize.width, centerSymbolRect.origin.y, symbolSize.width, symbolSize.height)];
            [self drawSymbolIntoRect:CGRectMake(center.x+SYMBOL_SPACING/2, centerSymbolRect.origin.y, symbolSize.width, symbolSize.height)];
            break;
        case 3:
            [self drawSymbolIntoRect:centerSymbolRect];
            CGRect newLeftSymbol = CGRectMake(centerSymbolRect.origin.x-symbolSize.width-SYMBOL_SPACING, centerSymbolRect.origin.y, symbolSize.width, symbolSize.height);
            [self drawSymbolIntoRect:newLeftSymbol];
            CGRect newRightSymbol = CGRectMake(centerSymbolRect.origin.x+symbolSize.width+SYMBOL_SPACING, centerSymbolRect.origin.y, symbolSize.width, symbolSize.height);
            [self drawSymbolIntoRect:newRightSymbol];
        default:
            break;
    }
}

- (void)drawSymbolIntoRect:(CGRect)aRect
{
    switch (self.setCard.symbol) {
        case OVAL:
            [self drawPillIntoRect:aRect];
            break;
        case DIAMOND:
            [self drawDiamondIntoRect:aRect];
            break;
        case SQUGGLE:
            [self drawSquiggleIntoRect:aRect];
            break;
        default:
            break;
    }
}

- (UIImage *)patternImage
{
    // Used to draw the stripe pattern for the symbols
    CGSize patternSize = CGSizeMake(1.0, 5.0);
    UIGraphicsBeginImageContextWithOptions(patternSize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    switch (self.setCard.color) {
        case RED:
            [[UIColor redColor] set];
            break;
        case GREEN:
            [[UIColor greenColor] set];
            break;
        case PURPLE:
            [[UIColor purpleColor] set];
            
        default:
            break;
    }
    
    CGContextMoveToPoint(context, 0.0, 5.0);
    CGContextAddLineToPoint(context, 1.0, 5.0);
    CGContextSetLineWidth(context, 3.0);
    CGContextStrokePath(context);
    
    UIImage *patternImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return patternImage;
}

- (void)shadeSymbolWithPath:(UIBezierPath *)aPath
{
    switch (self.setCard.shading) {
        case STRIPED:
        {
            UIImage *patternImage = [self patternImage];
            [[UIColor colorWithPatternImage:patternImage] setFill];
            [aPath fill];
        }
            break;
        case SOLID:
            [aPath fill];
            break;
        default:
            break;
    }
}

- (void)drawDiamondIntoRect:(CGRect)aRect
{
    UIBezierPath *diamondPath = [UIBezierPath bezierPath];
    diamondPath.lineWidth = 2.0;
    [diamondPath moveToPoint:CGPointMake(aRect.origin.x + aRect.size.width/2, aRect.origin.y)];
    [diamondPath addLineToPoint:CGPointMake(aRect.origin.x, aRect.origin.y + aRect.size.height/2)];
    [diamondPath addLineToPoint:CGPointMake(aRect.origin.x + aRect.size.width/2, aRect.origin.y + aRect.size.height)];
    [diamondPath addLineToPoint:CGPointMake(aRect.origin.x +aRect.size.width, aRect.origin.y + aRect.size.height/2)];
    [diamondPath addLineToPoint:CGPointMake(aRect.origin.x + aRect.size.width/2, aRect.origin.y)];
    [diamondPath closePath];
    
    [self shadeSymbolWithPath:diamondPath];
    
    [diamondPath stroke];
    
}

- (void)drawPillIntoRect:(CGRect)aRect
{
    CGSize symbolSize = CGSizeMake(aRect.size.width, aRect.size.height);
    UIBezierPath *pillPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(aRect.origin.x+symbolSize.width/2, aRect.origin.y+symbolSize.width/2) radius:symbolSize.width/2 startAngle:0.0 endAngle:DEGREES_TO_RADIANS(180.0) clockwise:NO];
    pillPath.lineWidth = 2.0;
    [pillPath addLineToPoint:CGPointMake(aRect.origin.x, aRect.origin.y+symbolSize.height-symbolSize.width/2)];
    [pillPath addArcWithCenter:CGPointMake(aRect.origin.x+symbolSize.width/2, aRect.origin.y+symbolSize.height-symbolSize.width/2) radius:symbolSize.width/2 startAngle:DEGREES_TO_RADIANS(180.0) endAngle:0 clockwise:NO];
    [pillPath addLineToPoint:CGPointMake(aRect.origin.x+symbolSize.width, aRect.origin.y+symbolSize.width/2)];
    [pillPath closePath];
    
    [self shadeSymbolWithPath:pillPath];
    
    [pillPath stroke];
}

- (void)drawSquiggleIntoRect:(CGRect)aRect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 2.0;
    [path moveToPoint:CGPointMake(aRect.origin.x + aRect.size.width*0.10, aRect.origin.y + aRect.size.height*0.20)];
    
    [path addCurveToPoint:CGPointMake(aRect.origin.x + aRect.size.width*0.10, aRect.origin.y + aRect.size.height*0.80)
            controlPoint1:CGPointMake(aRect.origin.x + aRect.size.width*0.10 - 7.0, aRect.origin.y + aRect.size.height/2)
            controlPoint2:CGPointMake(aRect.origin.x + aRect.size.width*0.10 + 7.0, aRect.origin.y + aRect.size.height/2)];
    
    [path addCurveToPoint:CGPointMake(aRect.origin.x + aRect.size.width*0.90, aRect.origin.y + aRect.size.height*0.80)
            controlPoint1:CGPointMake(aRect.origin.x, aRect.origin.y + aRect.size.height)
            controlPoint2:CGPointMake(aRect.origin.x + aRect.size.width/2, aRect.origin.y + aRect.size.height)];
    
    [path addCurveToPoint:CGPointMake(aRect.origin.x + aRect.size.width*0.90, aRect.origin.y + aRect.size.height*0.20)
            controlPoint1:CGPointMake(aRect.origin.x + aRect.size.width*0.90 + 7.0, aRect.origin.y +aRect.size.height/2)
            controlPoint2:CGPointMake(aRect.origin.x + aRect.size.width*0.90 - 7.0, aRect.origin.y +aRect.size.height/2)];
    
    [path addCurveToPoint:CGPointMake(aRect.origin.x + aRect.size.width*0.10, aRect.origin.y + aRect.size.height*0.20)
            controlPoint1:CGPointMake(aRect.origin.x + aRect.size.width, aRect.origin.y)
            controlPoint2:CGPointMake(aRect.origin.x + aRect.size.width/2, aRect.origin.y)];
    
    [self shadeSymbolWithPath:path];
    
    [path stroke];
}
@end
