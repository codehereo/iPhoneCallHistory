//
//  CallHistoryViewController.m
//  TelApp
//
//  Created by 1 on 3/5/14.
//  Copyright (c) 2014 individual. All rights reserved.
//

#import "CallHistoryViewController.h"

@interface CallHistoryViewController ()

@end

@implementation CallHistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Call History";
//    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    UIButton* callButton = [UIButton buttonWithType:UIButtonTypeCustom];
    callButton.frame = CGRectMake(20, 30, 50, 25);
    [callButton setTitle:@"Call" forState:UIControlStateNormal];
    callButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [callButton addTarget:self action:@selector(onTouchCall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:callButton];
    
    UIButton* receiveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    receiveButton.frame = CGRectMake(100, 30, 60, 25);
    [receiveButton setTitle:@"Receive" forState:UIControlStateNormal];
    receiveButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [receiveButton addTarget:self action:@selector(onTouchReceive) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:receiveButton];
    
    UIButton* missButton = [UIButton buttonWithType:UIButtonTypeCustom];
    missButton.frame = CGRectMake(200, 30, 50, 25);
    [missButton setTitle:@"Miss" forState:UIControlStateNormal];
    missButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [missButton addTarget:self action:@selector(onTouchMiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:missButton];
    
	// Do any additional setup after loading the view.
}

- (void) onTouchCall
{
    
}

-(void) onTouchReceive
{
    
}

-(void) onTouchMiss
{
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
