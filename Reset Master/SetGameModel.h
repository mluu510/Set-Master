//
//  SetGameModel.h
//  Set Free
//
//  Created by Minh Luu on 4/1/13.
//  Copyright (c) 2013 Minh Luu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCard.h"

typedef enum {
    EASY,
    HARD
} GameMode;

@protocol SetGameModelDelegate <NSObject>

- (void)removeCellAtIndexPaths:(NSArray *)indexPaths;
- (void)insertCellAtIndexPaths:(NSArray *)indexPaths;
- (void)incorrectMatch;
- (void)correctMatch;

@end

@interface SetGameModel : NSObject

@property (nonatomic, weak) id <SetGameModelDelegate> delegate;
@property (nonatomic, readonly) int score;
@property (nonatomic) GameMode gameMode;

- (void)drawThreeCards;

- (SetCard *)cardAtIndex:(int)index;
- (void)selectCardAtIndex:(int)index;

- (int)numPlayCards;
- (int)cardsLeft;

- (BOOL)hasSet;

@end
