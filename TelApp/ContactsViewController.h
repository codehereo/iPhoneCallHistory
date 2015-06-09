//
//  ContactsViewController.h
//  TelApp
//
//  Created by 1 on 3/5/14.
//  Copyright (c) 2014 individual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ContactsViewController : UIViewController<UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>
{
    UITableView* myTableView;
    NSMutableArray* dataSource;
 
    NSMutableArray* searchedData;
    
    UISearchBar* sBar;
    
    NSUInteger _selectedCount;
    NSMutableArray *_listContent;
	NSMutableArray *_filteredListContent;
    
}

@property (nonatomic, retain)NSMutableArray* dataSource;
@property (nonatomic, retain) UITableView* tableView;
@property (nonatomic, retain) UISearchBar* searchBar;

@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;



@end
