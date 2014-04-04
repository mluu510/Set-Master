//
//  ViewController.m
//  Reset Master
//
//  Created by Minh Luu on 4/2/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "ViewController.h"
#import "CardView.h"
#import "SetCard.h"
#import "SetGameModel.h"
#import "CardCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, SetGameModelDelegate>

@property (nonatomic, strong) SetGameModel *model;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController

- (void)correctMatch {
    
}

- (void)incorrectMatch {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.model = [[SetGameModel alloc] init];
    self.model.delegate = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.model numPlayCards];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Card Cell" forIndexPath:indexPath];
    SetCard *setCard = [self.model cardAtIndex:indexPath.item];
    cell.cardView.setCard = setCard;
    return cell;
}

#define COLLECTION_VIEW_MARGIN 8
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(COLLECTION_VIEW_MARGIN, COLLECTION_VIEW_MARGIN, COLLECTION_VIEW_MARGIN + 44, COLLECTION_VIEW_MARGIN);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.model selectCardAtIndex:indexPath.item];
}

- (void)removeCellAtIndexPaths:(NSArray *)indexPaths {
    [self.collectionView deleteItemsAtIndexPaths:indexPaths];
}

- (void)insertCellAtIndexPaths:(NSArray *)indexPaths {
    [self.collectionView insertItemsAtIndexPaths:indexPaths];
}

@end
