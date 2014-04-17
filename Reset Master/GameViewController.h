//
//  ViewController.h
//  Reset Master
//
//  Created by Minh Luu on 4/2/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetGameModel.h"

@protocol SetGameControllerDelegate <NSObject>

- (void)updateTime:(NSDate *)newDate;

@end

@interface GameViewController : UIViewController

@property (nonatomic, weak) id <SetGameControllerDelegate> delegate;
@property (nonatomic) GameMode mode;

@end
