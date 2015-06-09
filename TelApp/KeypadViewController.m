//
//  KeypadViewController.m
//  TelApp
//
//  Created by 1 on 3/5/14.
//  Copyright (c) 2014 individual. All rights reserved.
//

#import "KeypadViewController.h"
#import "Constants.h"
@interface KeypadViewController ()

@end

@implementation KeypadViewController
@synthesize strInput;

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
    
    self.strInput = @"";
    
    UIButton* btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne.frame = CGRectMake(KEYBOARD_STARTX, KEYBOARD_STARTY, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnOne setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [btnOne addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnOne.tag = 1;
    [self.view addSubview:btnOne];
    
    UIButton* btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTwo.frame = CGRectMake(KEYBOARD_STARTX + XINTERVAL, KEYBOARD_STARTY, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnTwo setBackgroundImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [btnTwo addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnTwo.tag = 2;
    [self.view addSubview:btnTwo];
    
    UIButton* btnThree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnThree.frame = CGRectMake(KEYBOARD_STARTX + XINTERVAL * 2, KEYBOARD_STARTY, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnThree setBackgroundImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
    [btnThree addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnThree.tag = 3;
    [self.view addSubview:btnThree];
    
    UIButton* btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFour.frame = CGRectMake(KEYBOARD_STARTX, KEYBOARD_STARTY + YINTERVAL, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnFour setBackgroundImage:[UIImage imageNamed:@"4.png"] forState:UIControlStateNormal];
    [btnFour addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnFour.tag = 4;
    [self.view addSubview:btnFour];
    
    UIButton* btnFive = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFive.frame = CGRectMake(KEYBOARD_STARTX + XINTERVAL, KEYBOARD_STARTY + YINTERVAL, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnFive setBackgroundImage:[UIImage imageNamed:@"5.png"] forState:UIControlStateNormal];
    [btnFive addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnFive.tag = 5;
    [self.view addSubview:btnFive];
    
    UIButton* btnSix = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSix.frame = CGRectMake(KEYBOARD_STARTX + XINTERVAL * 2, KEYBOARD_STARTY + YINTERVAL, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnSix setBackgroundImage:[UIImage imageNamed:@"6.png"] forState:UIControlStateNormal];
    [btnSix addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnSix.tag = 6;
    [self.view addSubview:btnSix];
    
    UIButton* btnSeven = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSeven.frame = CGRectMake(KEYBOARD_STARTX, KEYBOARD_STARTY + YINTERVAL * 2, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnSeven setBackgroundImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
    [btnSeven addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnSeven.tag = 7;
    [self.view addSubview:btnSeven];
    
    UIButton* btnEight = [UIButton buttonWithType:UIButtonTypeCustom];
    btnEight.frame = CGRectMake(KEYBOARD_STARTX + XINTERVAL, KEYBOARD_STARTY + YINTERVAL * 2, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnEight setBackgroundImage:[UIImage imageNamed:@"8.png"] forState:UIControlStateNormal];
    [btnEight addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnEight.tag = 8;
    [self.view addSubview:btnEight];
    
    UIButton* btnNine = [UIButton buttonWithType:UIButtonTypeCustom];
    btnNine.frame = CGRectMake(KEYBOARD_STARTX + XINTERVAL * 2, KEYBOARD_STARTY + YINTERVAL * 2, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnNine setBackgroundImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
    [btnNine addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnNine.tag = 9;
    [self.view addSubview:btnNine];
    
    UIButton* btnZero = [UIButton buttonWithType:UIButtonTypeCustom];
    btnZero.frame = CGRectMake(KEYBOARD_STARTX + XINTERVAL, KEYBOARD_STARTY + YINTERVAL * 3, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnZero setBackgroundImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateNormal];
    [btnZero addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnZero.tag = 0;
    [self.view addSubview:btnZero];

    UIButton* btnSymbolOne = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSymbolOne.frame = CGRectMake(KEYBOARD_STARTX, KEYBOARD_STARTY + YINTERVAL * 3, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnSymbolOne setBackgroundImage:[UIImage imageNamed:@"symbolOne.png"] forState:UIControlStateNormal];
    [btnSymbolOne addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    btnSymbolOne.tag = 11;
    [self.view addSubview:btnSymbolOne];
    
    
    UIButton* btnSymbolTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSymbolTwo.frame = CGRectMake(KEYBOARD_STARTX + XINTERVAL * 2, KEYBOARD_STARTY + YINTERVAL * 3, KEYBOARD_WIDTH, KEYBOARD_HEIGHT);
    [btnSymbolTwo setBackgroundImage:[UIImage imageNamed:@"symbolTwo.png"] forState:UIControlStateNormal];
    btnSymbolTwo.tag = 12;
    [btnSymbolTwo addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSymbolTwo];
    
    
    btnCall = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCall.frame = CGRectMake(XCALLPOS, YCALLPOS, WIDTHCALL, HEIGHTCALL);
    [btnCall setBackgroundImage:[UIImage imageNamed:@"call.png"] forState:UIControlStateNormal];
    [btnCall addTarget:self action:@selector(onCall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnCall];
    
    btnDel = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDel.frame = CGRectMake(XPOSDEL, YPOSDEL, WIDTHDEL, HEIGHTDEL);
    [btnDel setBackgroundImage:[UIImage imageNamed:@"del.png"] forState:UIControlStateNormal];
    [btnDel addTarget:self action:@selector(onDel) forControlEvents:UIControlEventTouchUpInside];
    btnDel.hidden = YES;
    [self.view addSubview:btnDel];
    
   
    
    CGRect textViewFrame = CGRectMake(50, 30, 200, 50);
    textView = [[UITextView alloc] initWithFrame:textViewFrame];
    textView.returnKeyType = UIReturnKeyDone;
    [textView setFont:[UIFont systemFontOfSize:27]];
    textView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textView];
    
    
//     [[self navigationController] setNavigationBarHidden:YES animated:YES];
	// Do any additional setup after loading the view.
}

- (void) onDel
{
    NSString* strText = [textView text];
    strText = [strText substringToIndex:strText.length - 1];
    if (strText.length == 0) {
        btnDel.hidden = YES;
    }
    [textView setText:strText];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
//    NSLog(@"textViewShouldBeginEditing:");
    return YES;
}

- (void) onCall
{
    
}

- (void)onTouchNumber:(id)sender
{

    NSString* strText = [textView text];
    NSLog(@"%@", strText);
    
    btnDel.hidden = NO;
    
    UIButton* btnInput = (UIButton*)sender;
    int tag = btnInput.tag;
    NSString * str;
    if (tag == 11) {
        str = @"*";
    }
    else if(tag == 12)
    {
        str = @"#";
    }
    else
    {
        str = [NSString stringWithFormat:@"%d", tag];
    }
    
    strText = [strText stringByAppendingString:str];
    
    [textView setText:strText];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
