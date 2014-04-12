//
//  FooterCell.m
//  Reset Master
//
//  Created by Minh Luu on 4/11/14.
//  Copyright (c) 2014 Minh Luu. All rights reserved.
//

#import "FooterCell.h"

@implementation FooterCell

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"%@", change.description);
}

@end
