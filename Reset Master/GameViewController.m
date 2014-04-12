//
//  ViewController.m
//  Reset Master
//
//  Created by Minh Luu on 4/2/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "GameViewController.h"
#import "CardView.h"
#import "SetCard.h"
#import "CardCell.h"
#import <AVFoundation/AVFoundation.h>

@interface GameViewController () <UICollectionViewDataSource, UICollectionViewDelegate, SetGameModelDelegate>

@property (nonatomic, strong) SetGameModel *model;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) AVAudioPlayer *selectSound;
@property (nonatomic, strong) AVAudioPlayer *successSound;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation GameViewController

- (void)correctMatch {
    [self.successSound play];
}

- (void)incorrectMatch {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    NSLog(@"Vibrated");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.hidesBackButton = YES;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.model = [[SetGameModel alloc] initWithGameMode:self.mode];
    self.model.delegate = self;
    
    self.startTime = [NSDate date];
    self.formatter = [[NSDateFormatter alloc] init];
    self.formatter.dateFormat = NSDateFormatterNoStyle;
    self.formatter.timeStyle = NSDateFormatterShortStyle;
    
    NSURL *selectURL = [[NSBundle mainBundle] URLForResource:@"select4" withExtension:@"mp3"];
    self.selectSound = [[AVAudioPlayer alloc] initWithContentsOfURL:selectURL error:nil];
    
    NSURL *successURL = [[NSBundle mainBundle] URLForResource:@"success2" withExtension:@"m4a"];
    self.successSound = [[AVAudioPlayer alloc] initWithContentsOfURL:successURL error:nil];
    

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}

- (void)viewWillAppear:(BOOL)animated {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)updateTime {
    NSInteger diff = -(NSInteger)[self.startTime timeIntervalSinceNow];
    NSInteger seconds = diff % 60;
    NSInteger minutes = (diff / 60) % 60;
    self.title = [NSString stringWithFormat:@"%02ld:%02ld", (long)minutes, (long)seconds];
}

#pragma Collection View Data Source & Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.model numPlayCards];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Card Cell" forIndexPath:indexPath];
    SetCard *setCard = [self.model cardAtIndex:indexPath.item];
    cell.cardView.setCard = setCard;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.model selectCardAtIndex:indexPath.item];
    [self.selectSound play];
    
}

- (void)removeCellAtIndexPaths:(NSArray *)indexPaths {
    [self.collectionView deleteItemsAtIndexPaths:indexPaths];
}

- (void)insertCellAtIndexPaths:(NSArray *)indexPaths {
    [self.collectionView insertItemsAtIndexPaths:indexPaths];
}

#define COLLECTION_VIEW_MARGIN 8
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(COLLECTION_VIEW_MARGIN, COLLECTION_VIEW_MARGIN, COLLECTION_VIEW_MARGIN + 44, COLLECTION_VIEW_MARGIN);
}

@end
