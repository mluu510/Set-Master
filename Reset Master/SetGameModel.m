//
//  SetGameModel.m
//  Set Free
//
//  Created by Minh Luu on 4/1/13.
//  Copyright (c) 2013 Minh Luu. All rights reserved.
//

#import "SetGameModel.h"

@interface SetGameModel()

@property (nonatomic, readwrite) int score;
@property (nonatomic, strong) NSMutableArray *deck;
@property (nonatomic, strong) NSMutableArray *playCards;
@property (nonatomic, strong) NSMutableArray *selectedCards;
@property (nonatomic, strong) NSMutableArray *sets;

@end

@implementation SetGameModel

- (int)numPlayCards {
    return self.playCards.count;
}
- (int)cardsLeft {
    return self.deck.count;
}

- (id)init {
    if (self = [super init]) {
        self.deck = [@[] mutableCopy];
        self.playCards = [@[] mutableCopy];
        self.selectedCards = [@[] mutableCopy];
        self.score = 0;
        
        [self buildDeck];
        [self shuffleDeck];
        [self cardAtIndex:11];
    }
    return self;
}

- (void)buildDeck {
    for (Color color = RED; color <= BLUE; color++)
        for (Shading shading = OPEN; shading <= SOLID; shading++)
            for (Symbol symbol = SQUARE; symbol <= TRIANGLE; symbol++)
                for (int i = 1; i <= 3; i++) {
                    Shading shading2 = self.gameMode == EASY ? STRIPED : shading;
                    SetCard *setCard = [[SetCard alloc] initWithSymbol:symbol color:color shading:shading2 number:i];
                    [self.deck addObject:setCard];
                }
}

- (void)shuffleDeck {
    for (int i=0; i<1000; i++) {
        int randA;
        int randB;
        
        do {
            randA = arc4random() % self.deck.count;
            randB = arc4random() % self.deck.count;
        } while (randA == randB);
        
        [self.deck exchangeObjectAtIndex:randA withObjectAtIndex:randB];
    }
}

// Make sure there is always 12 cards
- (SetCard *)cardAtIndex:(int)index {
    while (self.playCards.count <= index) {
        if (self.deck.lastObject) {
            [self.playCards addObject:self.deck.lastObject];
            [self.deck removeLastObject];
        } else {
//            NSLog(@"WARNING: deck depleted!");
            return nil;
        }
    }
    return self.playCards.count > index ? [self.playCards objectAtIndex:index] : nil;
}


#define BONUS_POINT 3

- (void)selectCardAtIndex:(int)index {
    SetCard *setCard = [self.playCards objectAtIndex:index];
    
    if (!setCard.isSelected) {
        setCard.select = YES;
        [self.selectedCards addObject:setCard];
    } else {
        setCard.select = NO;
        [self.selectedCards removeObject:setCard];
    }
    
    [self checkForSet];
    [self checkForEndGame];
}

#define MAX_SELECTION 3
- (void)checkForSet {
    if (self.selectedCards.count == MAX_SELECTION) {
        if ([self isSet:self.selectedCards]) {
            
            // Build index paths to remove from collection view
            NSMutableArray *indexPaths = [@[] mutableCopy];
            for (SetCard *setCard in self.selectedCards) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:[self.playCards indexOfObject:setCard] inSection:0];
                [indexPaths addObject:indexPath];
            }
            
            // Remove set from cardsInPlay
            [self.playCards removeObjectsInArray:self.selectedCards];
            [self.delegate removeCellAtIndexPaths:indexPaths];
            
            // Add set to sets array
            [self.sets addObject:[self.selectedCards copy]];
            
            // Draw more cards if less than 12
            if (self.playCards.count < 12)
                [self drawThreeCards];
            [self.delegate correctMatch];
        } else {
            [self.delegate incorrectMatch];
        }
        
        // Unselect all cards
        for (SetCard *setCard in self.selectedCards) {
            setCard.select = NO;
        }
        [self.selectedCards removeAllObjects];
    }
}

- (void)checkForEndGame {
    if (self.deck.count == 0 && self.playCards.count == 0)
    [self showScore];
}

- (void)showScore {
    NSLog(@"GAME OVER!");
}

- (BOOL)isSet:(NSArray *)setCards {
    NSMutableArray *sets = [@[] mutableCopy];
    
    for (int i=0; i<4; i++)
        [sets addObject:[NSMutableSet set]];
    
    // Creating sets based on card properties
    for (SetCard *setCard in setCards) {
        [[sets objectAtIndex:0] addObject:@(setCard.symbol)];
        [[sets objectAtIndex:1] addObject:@(setCard.color)];
        [[sets objectAtIndex:2] addObject:@(setCard.shading)];
        [[sets objectAtIndex:3] addObject:@(setCard.number)];
    }
    
    BOOL isSet = YES;
    
    // If set count is 1, the set contains all same property. If set count is 3, the set contains all unique property
    for (NSMutableSet *set in sets)
        if (!(set.count == 1 || set.count == 3))
            isSet = NO;
    return isSet;
}

- (void)drawThreeCards {
    if ([self cardAtIndex:self.playCards.count + 2]) {
        
    NSArray *indexPaths = @[[NSIndexPath indexPathForItem:self.playCards.count - 3 inSection:0],
                            [NSIndexPath indexPathForItem:self.playCards.count - 2 inSection:0],
                            [NSIndexPath indexPathForItem:self.playCards.count - 1 inSection:0]];
    
    [self.delegate insertCellAtIndexPaths:indexPaths];
    }
}

- (BOOL)hasSet {
    if (self.playCards.count < 3)
        return NO;
    
    NSMutableArray *foundSets = [@[] mutableCopy];
    
    for (int i = 0; i<self.playCards.count - 2; i++)
        for (int j = i + 1; j < self.playCards.count - 1; j++)
            for (int k = j + 1; k < self.playCards.count; k++) {
                
                // Build a set to test
                NSArray *test = @[[self.playCards objectAtIndex:i], [self.playCards objectAtIndex:j], [self.playCards objectAtIndex:k]];
                if ([self isSet:test]) {
                    /* ENABLE CHEAT HERE */
                    NSLog(@"Set found @ %d, %d, %d.", i+1, j+1, k+1);
                    [foundSets addObject:test];
                }
            }
    
    if (foundSets.count == 0 && self.deck.count == 0) {
        // GAME OVER
        [self showScore];
    } else if (foundSets.count == 0)
        return NO;
    
	return YES;
}

@end