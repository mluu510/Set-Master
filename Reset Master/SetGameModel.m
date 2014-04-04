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
@property (nonatomic, strong) NSMutableArray *cardsInPlay;
@property (nonatomic, strong) NSMutableArray *selectedCards;
@property (nonatomic, strong) NSMutableArray *sets;

@end

@implementation SetGameModel

- (id)init {
    if (self = [super init]) {
        self.deck = [@[] mutableCopy];
        self.cardsInPlay = [@[] mutableCopy];
        self.selectedCards = [@[] mutableCopy];
        self.score = 0;
        
        // Create the deck
        for (Color color = RED; color <= BLUE; color++)
            for (Shading shading = OPEN; shading <= SOLID; shading++)
                for (Symbol symbol = SQUARE; symbol <= TRIANGLE; symbol++)
                    for (int i = 1; i <= 3; i++) {
                        SetCard *setCard = [[SetCard alloc] initWithSymbol:symbol color:color shading:shading number:i];
                        [self.deck addObject:setCard];
                    }
        
        [self shuffleDeck];
        [self cardAtIndex:11];
    }
    return self;
}

- (void)shuffleDeck
{
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
- (SetCard *)cardAtIndex:(int)index
{
    while (self.cardsInPlay.count <= index) {
        if (self.deck.lastObject) {
            [self.cardsInPlay addObject:self.deck.lastObject];
            [self.deck removeLastObject];
        } else {
            NSLog(@"WARNING: deck depleted!");
            return nil;
        }
    }
    return self.cardsInPlay.count > index ? [self.cardsInPlay objectAtIndex:index] : nil;
}


#define BONUS_POINT 3

- (void)selectCardAtIndex:(int)index {
    SetCard *setCard = [self.cardsInPlay objectAtIndex:index];
    
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
            // Remove set from cardsInPlay
            [self.cardsInPlay removeObjectsInArray:self.selectedCards];
            
            // Build index paths to remove from collection view
            NSMutableArray *indexPaths = [@[] mutableCopy];
            for (SetCard *setCard in self.selectedCards) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:[self.cardsInPlay indexOfObject:setCard] inSection:0];
                [indexPaths addObject:indexPath];
            }
            [self.delegate removeCellAtIndexPaths:indexPaths];
            
            // Add set to sets array
            [self.sets addObject:[self.selectedCards copy]];
            
            if (self.cardsInPlay.count < 12)
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

- (void)checkForEndGame
{
    if (self.deck.count == 0 && self.cardsInPlay.count == 0)
    [self showScore];
}

- (void)showScore
{
    NSLog(@"GAME OVER!");
}

- (BOOL)isSet:(NSArray *)setCards
{
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
    if ([self cardAtIndex:self.cardsInPlay.count + 2]) {
        
    NSArray *indexPaths = @[[NSIndexPath indexPathForItem:self.cardsInPlay.count - 3 inSection:0],
                            [NSIndexPath indexPathForItem:self.cardsInPlay.count - 2 inSection:0],
                            [NSIndexPath indexPathForItem:self.cardsInPlay.count - 1 inSection:0]];
    
    [self.delegate insertCellAtIndexPaths:indexPaths];
    }
}

- (NSArray *)hasSet {
    if (self.cardsInPlay.count < 3)
        return nil;
    
    NSMutableArray *foundSets = [@[] mutableCopy];
    
    for (int i = 0; i<self.cardsInPlay.count - 2; i++)
        for (int j = i + 1; j < self.cardsInPlay.count - 1; j++)
            for (int k = j + 1; k < self.cardsInPlay.count; k++) {
                
                // Build a set to test
                NSArray *test = @[[self.cardsInPlay objectAtIndex:i], [self.cardsInPlay objectAtIndex:j], [self.cardsInPlay objectAtIndex:k]];
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
        return nil;
    
    self.score--;
	return foundSets;
}

@end
