//
//  StarRatingView.m
//  StarRatingDemo
//
//  Created by HengHong on 5/4/13.
//  Copyright (c) 2013 Fixel Labs Pte. Ltd. All rights reserved.
//

#import "StarRatingView.h"
#define kLeftPadding 5.0f
@implementation StarRatingView
@synthesize timer;
@synthesize kLabelAllowance;
- (id)initWithFrame:(CGRect)frame andRating:(int)rating withLabel:(BOOL)label animated:(BOOL)animated
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor orangeColor];
        _maxrating = rating;
        //*(self.bounds.size.width-frame.size.height-kLabelAllowance);
        self.animated = animated;
        if (self.animated) {
            _rating = 0;
            timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(increaseRating) userInfo:nil repeats:YES];
        }else{
            _rating = _maxrating;
            NSLog(@"setting rating");
        }
        if (label) {
            self.kLabelAllowance = 30.0f;
            self.label = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width-kLabelAllowance , 0,kLabelAllowance, frame.size.height)];
            self.label.font = [UIFont systemFontOfSize:11.0f];
            self.label.text = [NSString stringWithFormat:@"%d%%",rating];
            self.label.textAlignment = NSTextAlignmentRight;
            self.label.textColor = [UIColor whiteColor];
            self.label.backgroundColor = [UIColor clearColor];
            [self addSubview:self.label];
        }else{
            self.kLabelAllowance = 0.0f;
        }
        
    }
    return self;
}


-(void)increaseRating
{
    
    if (_rating<_maxrating) {
        _rating = _rating + 1;
        if (self.label) {
            self.label.text = [NSString stringWithFormat:@"%d%%",self.rating];
        }
        [self setNeedsDisplay];
    }else{
        [timer invalidate];
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIImage* image = [UIImage imageNamed:@"5starsgray.png"];
    CGRect newrect = CGRectMake(kLeftPadding, 0, self.bounds.size.width-kLabelAllowance-kLeftPadding, self.bounds.size.height);
    [image drawInRect:newrect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, newrect, [UIImage imageNamed:@"5starflip.png"].CGImage);
    float barWitdhPercentage = (_rating/100.0f) *  (self.bounds.size.width-kLabelAllowance-kLeftPadding);

    CGContextClipToRect(context, CGRectMake(kLeftPadding, 0, MIN(self.bounds.size.width,barWitdhPercentage), self.bounds.size.height));
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    if (self.userRating < 0.2f) {
        [[UIColor yellowColor] setFill];
    }else{
        [[UIColor greenColor] setFill];
    }
    CGContextFillRect(context, newrect);
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (CGRectContainsPoint(self.bounds, [[[touches allObjects]lastObject] locationInView:self])) {
        
        float xpos = [[[touches allObjects]lastObject] locationInView:self].x - kLeftPadding;
        int star = MIN(4,xpos/((self.bounds.size.width-kLabelAllowance-kLeftPadding)/5.0f));
        if (xpos < kLeftPadding) {
            if (self.userRating == 20.0f) {
                self.userRating = 0.0f;
                if (self.animated) {
                    self.rating = 0;
                    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(increaseRating) userInfo:nil repeats:YES];
                }else{
                    self.rating = self.maxrating;
                    if (self.label) {
                        self.label.text = [NSString stringWithFormat:@"%d%%",self.rating];
                    }
                }
            }
        }else{
            self.userRating = (star+1)*20.0f;
            self.rating = self.userRating;
            if (self.label) {
                self.label.text = [NSString stringWithFormat:@"%d%%",self.rating];
            }
        }
        [self setNeedsDisplay];
        
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (CGRectContainsPoint(self.bounds, [[[touches allObjects]lastObject] locationInView:self])) {
        
        float xpos = [[[touches allObjects]lastObject] locationInView:self].x - kLeftPadding;
        int star = MIN(4,xpos/((self.bounds.size.width-kLabelAllowance-kLeftPadding)/5.0f));
        if (star == 0) {
                self.userRating = (star+1)*20.0f;
                self.rating = self.userRating;
        }else{
            self.userRating = (star+1)*20.0f;
            self.rating = self.userRating;
        }
        
        
        if (self.label) {
            self.label.text = [NSString stringWithFormat:@"%d%%",self.rating];
        }
        
        [self setNeedsDisplay];
        
    }
}


@end
