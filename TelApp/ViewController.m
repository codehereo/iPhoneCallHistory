//
//  ViewController.m
//  TelApp
//
//  Created by 1 on 3/5/14.
//  Copyright (c) 2014 individual. All rights reserved.
//

#import "ViewController.h"
#import "FavouriteViewController.h"
#import "Contact.h"
#import "ContactsViewController.h"
#import "CallHistoryViewController.h"
#import "KeypadViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *arrContactsData;
@property (nonatomic, strong) ABPeoplePickerNavigationController *addressBookController;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.toolbarHidden = YES;
    FavouriteViewController* favViewController = [[FavouriteViewController alloc] initWithNibName:nil bundle:nil];
    favViewController.title = @"Favourite";
    
    
    UIButton *editButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 50, 50)];
    UIImage* image = [UIImage imageNamed:@"image.png"];
    [editButton setImage:image forState:UIControlStateNormal];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithCustomView:editButton];
    
    UINavigationController* firstNavController = [[UINavigationController alloc] initWithRootViewController:favViewController];
    firstNavController.navigationItem.rightBarButtonItem = button;
    firstNavController.navigationBar.barStyle = UIBarStyleBlackOpaque;
       

    ContactsViewController* contactViewController = [[ContactsViewController alloc] init];
    contactViewController.title = @"Contacts";
    contactViewController.tabBarItem  = [[UITabBarItem alloc] initWithTitle:@"All Contact" image:nil tag:1];
    
    
//    Contact* contactController = [[Contact alloc] initWithNibName:@"Contact" bundle:nil];
//    contactController.title = @"Contacts";
//    contactController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"All Contact" image:nil tag:1];
    UINavigationController* secondNavController = [[UINavigationController alloc] initWithRootViewController:contactViewController];
    secondNavController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    CallHistoryViewController* callViewController = [[CallHistoryViewController alloc] init];
    callViewController.title = @"Call History";
    callViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"History" image:nil tag:1];
    UINavigationController* thirdNavController = [[UINavigationController alloc] initWithRootViewController:callViewController];
    thirdNavController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    
    KeypadViewController* keyViewController = [[KeypadViewController alloc] init];
    keyViewController.title = @"Keypad";
    keyViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Keypad" image:nil tag:1];
    UINavigationController* fourthNavController = [[UINavigationController alloc] initWithRootViewController:keyViewController];
    fourthNavController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    
    UITabBarController* tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    tabBarController.viewControllers = [[NSArray alloc] initWithObjects:firstNavController, secondNavController, thirdNavController, fourthNavController, nil];

    tabBarController.view.frame = CGRectMake(0, 0, 320, 545);
    tabBarController.delegate = self;
    [self.view addSubview:[tabBarController view]];
//    [self.navigationController pushViewController:tabBarController animated:YES];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
