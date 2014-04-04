//
//  ShapeView.m
//  Reset Master
//
//  Created by Minh Luu on 4/3/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView

- (id)initWithFrame:(CGRect)frame andSymbol:(Symbol)symbol andColor:(UIColor *)color andShading:(Shading)shading; {
    self = [super initWithFrame:frame];
    if (self) {
        self.symbol = symbol;
        self.color = color;
        self.shading = shading;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (ShapeView *)shapeViewWithFrame:(CGRect)frame andSymbol:(Symbol)symbol andColor:(UIColor *)color andShading:(Shading)shading {
    return [[ShapeView alloc] initWithFrame:frame andSymbol:symbol andColor:color andShading:shading];
}

- (void)drawRect:(CGRect)rect {
//    self.backgroundColor = [UIColor clearColor];
    UIBezierPath *path = [self pathForShapeForRect:CGRectInset(rect, 2, 2)];
    path.lineWidth = 2;
    [self.color set];
    [path stroke];
    
    [self fillPath:path];
}

- (void)fillPath:(UIBezierPath *)path
{
    switch (self.shading) {
        case OPEN:
            return;
        case STRIPED: {
            UIImage *patternImage = [self patternImage];
            [[UIColor colorWithPatternImage:patternImage] set];
            break;
        }
        case SOLID: {
            [self.color set];
        }
        default:
            break;
    }
    [path fill];
}

- (UIBezierPath *)pathForShapeForRect:(CGRect)rect {
    UIBezierPath *path;
    switch (self.symbol) {
        case SQUARE:
            path = [UIBezierPath bezierPathWithRect:rect];
            break;
        case CIRCLE:
            path = [UIBezierPath bezierPathWithOvalInRect:rect];
            break;
        case TRIANGLE:
            path = [self bezierPathWithTriangleInRect:rect];
            break;
        default:
            break;
    }
    return path;
}

- (UIBezierPath *)bezierPathWithTriangleInRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(   rect.origin.x + rect.size.width/2, rect.origin.y + 0)];
    [path addLineToPoint:CGPointMake(rect.origin.x + 0,                 rect.origin.y + rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width,   rect.origin.y + rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y + 0)];
    [path closePath];
    return path;
}

- (UIImage *)patternImage {
    // Used to draw the stripe pattern for the symbols
    CGSize patternSize = CGSizeMake(1.0, 2.0);
    UIGraphicsBeginImageContextWithOptions(patternSize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.color set];
    
    CGContextMoveToPoint(context, 0.0, 0);
    CGContextAddLineToPoint(context, 1.0, 0);
    
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokePath(context);
    
    UIImage *patternImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return patternImage;
}

@end
