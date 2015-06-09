//
//  KeypadViewController.h
//  TelApp
//
//  Created by 1 on 3/5/14.
//  Copyright (c) 2014 individual. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeypadViewController : UIViewController<UITextViewDelegate>
{
    UITextView * textView;
    NSString*    strInput;
    UIButton*    btnCall;
    UIButton*    btnDel;
}

@property (nonatomic, assign) NSString* strInput;

@end
