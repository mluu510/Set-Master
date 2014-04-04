//
//  SetCard.h
//  Set Free
//
//  Created by Minh Luu on 4/1/13.
//  Copyright (c) 2013 Minh Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SQUARE,
    CIRCLE,
    TRIANGLE
} Symbol;

typedef enum {
    RED,
    GREEN,
    BLUE
} Color;

typedef enum {
    OPEN,
    STRIPED,
    SOLID
} Shading;

@interface SetCard : NSObject

@property (nonatomic) Symbol symbol;
@property (nonatomic) Color color;
@property (nonatomic) Shading shading;
@property (nonatomic) int number;
@property (nonatomic, getter=isSelected) BOOL select;

- (id)initWithSymbol:(Symbol)aSymbol color:(Color)aColor shading:(Shading)aShading number:(int)aNumber;

@end
