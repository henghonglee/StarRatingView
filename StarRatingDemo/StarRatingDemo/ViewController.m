//
//  ViewController.m
//  StarRatingDemo
//
//  Created by HengHong on 5/4/13.
//  Copyright (c) 2013 Fixel Labs Pte. Ltd. All rights reserved.
//

#import "ViewController.h"
#import "StarRatingView.h"

#define kLabelAllowance 50.0f
#define kStarViewHeight 30.0f
#define kStarViewWidth 160.0f
#define kLeftPadding 5.0f
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    StarRatingView* starview = [[StarRatingView alloc]initWithFrame:CGRectMake(50, 50, kStarViewWidth+kLabelAllowance+kLeftPadding, kStarViewHeight) andRating:60 withLabel:YES animated:NO];
    [self.view addSubview:starview];

    StarRatingView* starviewAnimated = [[StarRatingView alloc]initWithFrame:CGRectMake(50, 100, kStarViewWidth+kLabelAllowance+kLeftPadding, kStarViewHeight) andRating:77 withLabel:YES animated:YES];
    [self.view addSubview:starviewAnimated];
    
    
    StarRatingView* starViewNoLabel = [[StarRatingView alloc]initWithFrame:CGRectMake(50, 150, kStarViewWidth+kLeftPadding, kStarViewHeight) andRating:50 withLabel:NO animated:YES];
    [self.view addSubview:starViewNoLabel];
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
