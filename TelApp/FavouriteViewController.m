//
//  FavouriteViewController.m
//  TelApp
//
//  Created by 1 on 3/5/14.
//  Copyright (c) 2014 individual. All rights reserved.
//

#import "FavouriteViewController.h"

@interface FavouriteViewController ()

@end

@implementation FavouriteViewController

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
    
    UIButton* editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    editButton.frame = CGRectMake(20, 20, 50, 30);
    [editButton setTitle:@"Edit" forState:UIControlStateNormal];
    editButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [editButton addTarget:self action:@selector(onTouchEdit:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:editButton];
    
    UIButton* plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    plusButton.frame = CGRectMake(260, 20, 30, 30);
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    plusButton.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [plusButton addTarget:self action:@selector(onTouchPlus) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:plusButton];
    
	// Do any additional setup after loading the view.
}

- (void)onTouchEdit:(id) sender
{
    UIButton* button = (UIButton*)sender;
    [button setTitle: @"myTitle" forState: UIControlStateSelected];
}


- (void) onTouchPlus
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
