//
//  SetGameModel.h
//  Set Free
//
//  Created by Minh Luu on 4/1/13.
//  Copyright (c) 2013 Minh Luu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCard.h"

@protocol SetGameModelDelegate <NSObject>

- (void)removeCellAtIndexPaths:(NSArray *)indexPaths;
- (void)insertCellAtIndexPaths:(NSArray *)indexPaths;
- (void)incorrectMatch;
- (void)correctMatch;
@end

@interface SetGameModel : NSObject

@property (nonatomic, weak) id <SetGameModelDelegate> delegate;
@property (nonatomic, readonly) int score;

- (SetCard *)cardAtIndex:(int)index;
- (void)selectCardAtIndex:(int)index;
- (int)numOfCardsInPlay;
- (void)drawThreeCards;
- (int)cardsLeft;
- (NSArray *)foundSets;
- (NSArray *)hasSet;

@end
