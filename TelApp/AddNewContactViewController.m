//
//  AddNewContactViewController.m
//  TelApp
//
//  Created by 1 on 3/13/14.
//  Copyright (c) 2014 individual. All rights reserved.
//

#import "AddNewContactViewController.h"
#define kOFFSET_FOR_KEYBOARD 80.0
#define GROUPSELECT     @"GROUPSELECT"

#define FIRSTNAME       @"firstName"
#define SECONDENAME     @"secondName"
#define COMPANY         @"company"
#define GROUPNAME       @"groupName"
#define MOBILEPHONE     @"mobilePhone"
#define HOMEPHONE       @"homePhone"
#define FAX             @"fax"
#define EMAILONE        @"emailOne"
#define EMAILTWO        @"emailTwo"
#define FACEIMAGE       @"imageFace"
#define DATABASE_FILE_PATH              @"/DatabaseFile.DB"

@interface AddNewContactViewController ()

@end

@implementation AddNewContactViewController
@synthesize strDataFilePath;
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
    
    m_arrayImageView = [[NSMutableArray alloc] init];
    
    self.title = [NSString stringWithFormat:@"New Contacts"];
    self.navigationController.tabBarController.tabBar.hidden = YES;
    
    [self initDatafilePath:DATABASE_FILE_PATH];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    BOOL touchGroup = [defaults boolForKey:GROUPSELECT];
    
    if (touchGroup == YES) {
        [defaults setBool:NO forKey:GROUPSELECT];
        [defaults synchronize];
    }
 
    m_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height)];
    m_scrollView.delegate = self;
    m_scrollView.contentSize = CGSizeMake(self.view.bounds.size.width , self.view.bounds.size.height * 1.3);

    UIButton* btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCancel.frame =  CGRectMake(0, 10, 50, 20);
    [btnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    btnCancel.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [btnCancel addTarget:self action:@selector(onCancel) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnCancel];
    
    UIButton* btnDone = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDone.frame = CGRectMake(260, 20, 50, 30);
    [btnDone setTitle:@"Done" forState:UIControlStateNormal];
    btnDone.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [btnDone addTarget:self action:@selector(onDone) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnDone];
    
    UIImage* imgFace = [UIImage imageNamed:@"picture.png"];
    imgViewFace = [[UIImageView alloc] initWithImage:imgFace];
    imgViewFace.frame = CGRectMake(20, 0, 100, 100);
    imgViewFace.contentMode = UIViewContentModeScaleAspectFill;
    imgViewFace.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleRightMargin;
    [m_arrayImageView addObject:imgViewFace];
    imgViewFace.tag = 100;
    [m_scrollView addSubview:imgViewFace];
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:self.strDataFilePath];
    NSData* imgData = [dict objectForKey:FACEIMAGE];
    
    UIImage* img = [[UIImage alloc] initWithData:imgData];
    imgViewFace.image = img;
    
    
    textFirstName = [[UITextField alloc] init];
    [textFirstName setFrame: CGRectMake(150, 0, 100, 30)];
    [textFirstName setBackgroundColor:[UIColor whiteColor]];
    [textFirstName setPlaceholder:@"First"];
    [m_scrollView addSubview:textFirstName];
    
    textSecondName = [[UITextField alloc] init];
    [textSecondName setFrame:CGRectMake(150, 50, 100, 30)];
    [textSecondName setBackgroundColor:[UIColor whiteColor]];
    [textSecondName setPlaceholder:@"Second"];
    [m_scrollView addSubview:textSecondName];
    
    textCompany = [[UITextField alloc] init];
    [textCompany setFrame:CGRectMake(150, 100, 100, 30)];
    [textCompany setBackgroundColor:[UIColor whiteColor]];
    [textCompany setPlaceholder:@"Company"];
    [m_scrollView addSubview:textCompany];
    
    UILabel* labelGroup = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 150, 50)];
    labelGroup.text = @"Group";
    [m_scrollView addSubview:labelGroup];
    
    btnGroupSelect = [UIButton buttonWithType:UIButtonTypeCustom];
    btnGroupSelect.frame = CGRectMake(150, 150, 150, 50);
    [btnGroupSelect setTitle:@"Group Select" forState:UIControlStateNormal];
    btnGroupSelect.titleLabel.font = [UIFont systemFontOfSize:17.0f];
//    btnGroupSelect.layer.borderWidth = 1;
//    btnGroupSelect.layer.borderColor = [[UIColor blackColor] CGColor];
//    btnGroupSelect.layer.cornerRadius = 5;
    [btnGroupSelect addTarget:self action:@selector(onGroupSelect:) forControlEvents:UIControlEventTouchUpInside];
    [m_scrollView addSubview:btnGroupSelect];
    
    
    UILabel* labelPhoneOne = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 150, 50)];
    labelPhoneOne.text = @"Mobile Phone";
    [m_scrollView addSubview:labelPhoneOne];
    
    textMobilePhone = [[UITextField alloc] init];
    [textMobilePhone setFrame:CGRectMake(50, 250, 250, 30)];
    [textMobilePhone setBackgroundColor:[UIColor whiteColor]];
    [textMobilePhone setPlaceholder:@"Mobile Phone"];
    [m_scrollView addSubview:textMobilePhone];
    
    UILabel* labelHomePhone = [[UILabel alloc] initWithFrame:CGRectMake(50, 290, 250, 30)];
    labelHomePhone.text = @"Home Number";
    [m_scrollView addSubview:labelHomePhone];
    
    textHomePhone = [[UITextField alloc] initWithFrame:CGRectMake(50, 330, 250, 30)];
    [textHomePhone setBackgroundColor:[UIColor whiteColor]];
    [textHomePhone setPlaceholder:@"Home Phone Number"];
    [m_scrollView addSubview:textHomePhone];
    
    UILabel* labelFax = [[UILabel alloc] initWithFrame:CGRectMake(50, 370, 250, 30)];
    labelFax.text = @"Fax";
    [m_scrollView addSubview:labelFax];
    
    textFax = [[UITextField alloc] initWithFrame:CGRectMake(50, 410, 250, 30)];
    [textFax setBackgroundColor:[UIColor whiteColor]];
    [textFax setPlaceholder:@"Fax"];
    [m_scrollView addSubview:textFax];
    
    UILabel* labelEmailOne = [[UILabel alloc] initWithFrame:CGRectMake(50, 460, 250, 30)];
    labelEmailOne.text = @"Email One";
    [m_scrollView addSubview:labelEmailOne];
    
    textEmailOne = [[UITextField alloc] initWithFrame:CGRectMake(50, 490, 250, 30)];
    [textEmailOne setBackgroundColor:[UIColor whiteColor]];
    [textEmailOne setPlaceholder:@"Email One"];
    [m_scrollView addSubview:textEmailOne];
    
    UILabel* labelEmailTwo = [[UILabel alloc] initWithFrame:CGRectMake(50, 540, 250, 30)];
    labelEmailTwo.text = @"Email Two";
    [m_scrollView addSubview:labelEmailTwo];
    
    textEmailTwo = [[UITextField alloc] initWithFrame:CGRectMake(50, 580, 250, 30)];
    [textEmailTwo setBackgroundColor:[UIColor whiteColor]];
    [textEmailTwo setPlaceholder:@"Email Two"];
    [m_scrollView addSubview:textEmailTwo];
    m_scrollView.canCancelContentTouches = NO;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [m_scrollView addGestureRecognizer:singleTap];
    [self.view addSubview:m_scrollView];
    
	// Do any additional setup after loading the view.
}

-(void) initDatafilePath:(NSString*) filePath
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    self.strDataFilePath = [documentsDirectory stringByAppendingPathComponent:filePath];
    NSLog(@"%@", strDataFilePath);
    
}


- (void) niDropDownDelegateMethod: (NIDropDown *) sender
{
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self TakePhotoWithCamera];
    }
    else if (buttonIndex == 1)
    {
        [self SelectPhotoFromLibrary];
    }
    
    else if (buttonIndex == 2)
    {
        NSLog(@"cancel");
    }
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    NSArray *subviews = [m_scrollView subviews];
    for (id objects in subviews) {
        if ([objects isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = objects;
            if ([objects isFirstResponder]) {
                [theTextField resignFirstResponder];
            }
        }
        if ([objects isKindOfClass:[UITableViewCell class]]) {
            UITableViewCell* cell = objects;
            NSLog(@"%@", cell.textLabel);
        }
    }
    CGPoint touchPoint=[gesture locationInView:m_scrollView];
    if (CGRectContainsPoint([imgViewFace frame], touchPoint)) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                                 delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Take Photo", @"Choose Photo", @"Cancel", nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        actionSheet.destructiveButtonIndex = 1;
        [actionSheet showInView:self.view];
        [actionSheet release];
    }
}

-(void) TakePhotoWithCamera
{
    [self startCameraPickerFromViewController:self usingDelegate:self];
}

-(void) SelectPhotoFromLibrary
{
    [self startLibraryPickerFromViewController:self usingDelegate:self];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[picker parentViewController] dismissViewControllerAnimated:YES completion:NULL];
}

- (BOOL)startCameraPickerFromViewController:(UIViewController*)controller usingDelegate:(id<UIImagePickerControllerDelegate>)delegateObject
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [controller presentViewController:picker animated:YES completion:nil];
        [picker release];
    }
    return YES;
}

- (BOOL)startLibraryPickerFromViewController:(UIViewController*)controller usingDelegate:(id<UIImagePickerControllerDelegate>)delegateObject
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *picker1 = [[UIImagePickerController alloc]init];
        picker1.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker1.allowsEditing = YES;
        picker1.delegate = self;
        [controller presentViewController:picker1 animated:YES completion:nil];
        [picker1 release];
    }
    return YES;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * img = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    img = [self ImageResize:img];
    imgViewFace.image = img;
    [[picker parentViewController] dismissViewControllerAnimated:NO completion:nil];
    UINavigationController* navController = self.navigationController;
    UIViewController* controller = [navController.viewControllers objectAtIndex:0];
    [controller dismissViewControllerAnimated:NO completion:nil];

}

-(UIImage*)ImageResize:(UIImage*)image
{
    if(image==NULL)
    {
        return NULL;
    }
    else
    {
        CGRect rect = CGRectMake(0.0, 0.0, 90, 90);
        UIGraphicsBeginImageContext(rect.size);
        [image drawInRect:rect];
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
}


-(void)keyboardWillShow {
    // Animate the current view out of the way
    
    NSLog(@"%f", m_scrollView.contentOffset.y);
    
    for (UIView *view in m_scrollView.subviews) {
        if (view.isFirstResponder) {
            UITextField* field = (UITextField*)view;
            CGRect frame = field.frame;
            posTextField = frame.origin;
            NSLog(@"%f", posTextField.y);
        }
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    
    NSLog(@"%f", posTextField.y);
    if (posTextField.y > 240)
    {
        NSLog(@"%f", posTextField.y);
        int heightMove;
        if (posTextField.y < 430) {
            heightMove = posTextField.y - 120;
        }
        else
            heightMove = 200;
        
        rect.origin.y -= heightMove;
        rect.size.height += heightMove;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];

}

-(void)rel{
    [dropDown release];
    dropDown = nil;
}


-(void)keyboardWillHide {
    
    //method to move the view up/down whenever the keyboard is shown/dismissed
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;

    if (posTextField.y > 240)
    {
        int heightMove;
        if (posTextField.y < 430) {
            heightMove = posTextField.y - 120;
        }
        else
            heightMove = 200;
        
        rect.origin.y += heightMove;
        rect.size.height -= heightMove;

    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

- (void) onGroupSelect:(id)sender
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    BOOL touchGroup = [defaults boolForKey:GROUPSELECT];
    if (touchGroup == NO) {
        
        [defaults setBool:YES forKey:GROUPSELECT];
        
        NSArray * arr = [[NSArray alloc] init];
        arr = [NSArray arrayWithObjects:@"Company 1", @"Company 2", @"Company 3", @"Friend 1", @"Friend 2", @"Family", nil];
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc] showDropDown:sender :&f :arr];
        dropDown.delegate = self;
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)onCancel
{
    self.navigationController.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:NO];
}

-(void) onDone
{
    NSLog(@"%@", btnGroupSelect.currentTitle);
    if ([textFirstName.text isEqualToString:@""] == YES) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please input first name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([textSecondName.text isEqualToString:@""] == YES)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please input second name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([textCompany.text isEqualToString:@""] == YES)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please input company name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([btnGroupSelect.currentTitle isEqualToString:@"Group Select"] == YES)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please select group" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([textMobilePhone.text isEqualToString:@""] == YES)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please input mobile phone number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([textHomePhone.text isEqualToString:@""] == YES)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please input home phone number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([textFax.text isEqualToString:@""] == YES)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please input fax" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([textEmailOne.text isEqualToString:@""] == YES)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please input first email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([textEmailTwo.text isEqualToString:@""] == YES)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please input second email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        
        dictSave = [NSMutableDictionary dictionary];
        
        [dictSave setObject:textFirstName.text forKey:FIRSTNAME];
        [dictSave setObject:textSecondName.text forKey:SECONDENAME];
        [dictSave setObject:textCompany.text forKey:COMPANY];
        [dictSave setObject:btnGroupSelect.currentTitle forKey:GROUPNAME];
        [dictSave setObject:textMobilePhone.text forKey:MOBILEPHONE];
        [dictSave setObject:textHomePhone.text forKey:HOMEPHONE];
        [dictSave setObject:textFax.text forKey:FAX];
        [dictSave setObject:textEmailOne.text forKey:EMAILONE];
        [dictSave setObject:textEmailTwo.text forKey:EMAILTWO];
        
        NSData* imgData = UIImageJPEGRepresentation(imgViewFace.image, 1.0);
        [dictSave setObject:imgData forKey:FACEIMAGE];
        
        [self writeDataToFile];
        
        self.navigationController.tabBarController.tabBar.hidden = NO;
        [self.navigationController popViewControllerAnimated:NO];
    }
    
}

-(void)writeDataToFile
{
    BOOL wirte = NO;
    NSLog(@"%@", strDataFilePath);
    wirte = [dictSave writeToFile:strDataFilePath atomically:YES];
    NSLog(@"%d", wirte);
    NSLog(@"This is test");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
