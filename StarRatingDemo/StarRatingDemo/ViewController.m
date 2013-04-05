//
//  ViewController.m
//  StarRatingDemo
//
//  Created by HengHong on 5/4/13.
//  Copyright (c) 2013 Fixel Labs Pte. Ltd. All rights reserved.
//

#import "ViewController.h"
#import "StarRatingView.h"
#import "StarRatingViewDebug.h"
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
    StarRatingViewDebug* starview = [[StarRatingViewDebug alloc]initWithFrame:CGRectMake(50, 50, kStarViewWidth+kLabelAllowance+kLeftPadding, kStarViewHeight) andRating:60 withLabel:YES animated:NO];
    [self.view addSubview:starview];

    StarRatingViewDebug* starviewAnimated = [[StarRatingViewDebug alloc]initWithFrame:CGRectMake(50, 100, kStarViewWidth+kLabelAllowance+kLeftPadding, kStarViewHeight) andRating:77 withLabel:YES animated:YES];
    [self.view addSubview:starviewAnimated];
    
    
    StarRatingViewDebug* starViewNoLabel = [[StarRatingViewDebug alloc]initWithFrame:CGRectMake(50, 150, kStarViewWidth+kLeftPadding, kStarViewHeight) andRating:50 withLabel:NO animated:YES];
    [self.view addSubview:starViewNoLabel];
    
    StarRatingView* starViewComplete = [[StarRatingView alloc]initWithFrame:CGRectMake(50, 200, kStarViewWidth+kLabelAllowance+kLeftPadding, kStarViewHeight) andRating:65 withLabel:YES animated:YES];
    [self.view addSubview:starViewComplete];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
