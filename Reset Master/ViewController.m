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

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) SetGameModel *model;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController

- (SetGameModel *)model
{
    if (!_model)
    {
        _model = [[SetGameModel alloc] init];
        _model.delegate = self;
    }
    return _model;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.model numOfCardsInPlay];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Card Cell" forIndexPath:indexPath];
    SetCard *setCard = [self.model cardAtIndex:indexPath.item];
    cell.cardView.setCard = setCard;
    return cell;
}

@end
