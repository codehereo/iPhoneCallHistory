//
//  AddNewContactViewController.h
//  TelApp
//
//  Created by 1 on 3/13/14.
//  Copyright (c) 2014 individual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface AddNewContactViewController : UIViewController<UIScrollViewDelegate, UITextFieldDelegate, NIDropDownDelegate, UIActionSheetDelegate, UIPopoverControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIScrollView* m_scrollView;
    CGPoint posTextField;
    NIDropDown* dropDown;
    NSMutableArray* m_arrayImageView;
    UIImageView* imgViewFace;
    
    UITextField* textFirstName;
    UITextField* textSecondName;
    UITextField* textCompany;
    
    UITextField* textMobilePhone;
    UITextField* textHomePhone;
    UITextField* textFax;
    
    UITextField* textEmailOne;
    UITextField* textEmailTwo;
    
    UIButton* btnGroupSelect;
    
    NSString* strDataFilePath;
    NSMutableArray* arrayContactList;
    NSMutableDictionary* dictSave;
}

@property (nonatomic, retain) NSString* strDataFilePath;

- (void) niDropDownDelegateMethod: (NIDropDown *) sender;
@end
