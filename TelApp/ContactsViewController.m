//
//  ContactsViewController.m
//  TelApp
//
//  Created by 1 on 3/5/14.
//  Copyright (c) 2014 individual. All rights reserved.
//

#import "ContactsViewController.h"
#import "AddNewContactViewController.h"
@interface ContactsViewController ()


@end

@implementation ContactsViewController

@synthesize dataSource;
@synthesize savedSearchTerm = _savedSearchTerm;
@synthesize savedScopeButtonIndex;
@synthesize searchWasActive;

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
    
    
    
    sBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 70, 320,30)];
    sBar.delegate = self;
    [self.view addSubview:sBar];
    
    self.searchDisplayController.searchResultsTableView.scrollEnabled = YES;
	self.searchDisplayController.searchBar.showsCancelButton = NO;

    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 320, 400)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
    _listContent = [[NSMutableArray alloc] init];
    [_listContent addObject:[NSString stringWithFormat:@"first"]];
    [_listContent addObject:[NSString stringWithFormat:@"second"]];
    
    
    if (self.savedSearchTerm)
	{
        [self.searchDisplayController setActive:self.searchWasActive];
        [self.searchDisplayController.searchBar setText:_savedSearchTerm];
        
        self.savedSearchTerm = nil;
    }

    self.searchDisplayController.searchResultsTableView.scrollEnabled = YES;
	self.searchDisplayController.searchBar.showsCancelButton = NO;

    
    [self.navigationItem setTitle:@"Contacts"];
    [self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(addAction:)] autorelease]];
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
    
    UIButton* plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    plusButton.frame = CGRectMake(260, 20, 30, 30);
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    plusButton.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [plusButton addTarget:self action:@selector(onTouchPlus) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableArray *scopeButtonTitles = [[NSMutableArray alloc] init];
    [scopeButtonTitles addObject:NSLocalizedString(@"All", @"Title for the All button in the search display controller.")];
    
    self.searchDisplayController.searchBar.scopeButtonTitles = scopeButtonTitles;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:plusButton];
    
	// Do any additional setup after loading the view.
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
     [self.searchBar resignFirstResponder];
}

- (IBAction)addAction:(id)sender
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"contacts error in num of row");
    if (tableView  == self.searchDisplayController.searchResultsTableView) {
        return [_filteredListContent count];
    }
    else
        return [_listContent count];
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    } else {
        return [[NSArray arrayWithObject:UITableViewIndexSearch] arrayByAddingObjectsFromArray:
                [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles]];
    }
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 0;
    } else {
        if (title == UITableViewIndexSearch) {
            [tableView scrollRectToVisible:self.searchDisplayController.searchBar.frame animated:NO];
            return -1;
        }
        else {
            return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index-1];
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 1;
	} else {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [_filteredListContent objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [_listContent objectAtIndex:indexPath.row];
    }
    
    return cell;
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // only show the status bar's cancel button while in edit mode
    sBar.showsCancelButton = YES;
    sBar.autocorrectionType = UITextAutocorrectionTypeNo;
    // flush the previous search content
    [_filteredListContent removeAllObjects];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    sBar.showsCancelButton = YES;
}

#pragma mark -
#pragma mark ContentFiltering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	[_filteredListContent removeAllObjects];
    
    for (NSString* str  in _listContent) {
        NSLog(@"%@", str);
        NSComparisonResult result = [str compare:searchText options:(NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        if (result == NSOrderedSame) {
            [_filteredListContent addObject:str];
        }
    }
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return YES;
}

- (void) onTouchPlus
{
//    [self.navigationController popToRootViewControllerAnimated:NO];
    AddNewContactViewController* viewController = [[AddNewContactViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)_searchBar
{
	[self.searchDisplayController setActive:YES animated:YES];
	[self.tableView reloadData];
}

#pragma mark - ABPeoplePickerNavigationController Delegate method implementation





@end
