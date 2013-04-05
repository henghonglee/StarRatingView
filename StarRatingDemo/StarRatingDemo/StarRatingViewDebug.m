//
//  StarRatingViewDebug.m
//  StarRatingDemo
//
//  Created by HengHong on 5/4/13.
//  Copyright (c) 2013 Fixel Labs Pte. Ltd. All rights reserved.
//

#import "StarRatingViewDebug.h"

@implementation StarRatingViewDebug

- (id)initWithFrame:(CGRect)frame andRating:(int)rating withLabel:(BOOL)label animated:(BOOL)animated
{
    self = [super initWithFrame:frame andRating:rating withLabel:label animated:animated];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        // Initialization code
    }
    if (label) {
        self.label.backgroundColor = [UIColor magentaColor];
        self.label.textColor = [UIColor whiteColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
