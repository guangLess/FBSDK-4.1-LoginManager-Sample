//
//  ViewController.h
//  B_text_guang
//
//  Created by Aditya Narayan on 5/19/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "FBinfo.h"
//#import <FBSDKSystemAccountStoreAdapter.h>
#import <FBSDKLoginKit/FBSDKLoginManager.h>
//#import "FBSDKLoginManager+Internal.h"
//#import <FacebookSDK/FacebookSDK.h>
//#import "FBSDKLoginCompletion+Internal.h"



@interface ViewController : UIViewController

//@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
- (IBAction)loginButtonC:(id)sender;
@property (nonatomic, assign) FBSDKProfilePictureMode pictureMode;

//@property (weak, nonatomic) IBOutlet FBSDKProfilePictureView *profileImage2;
@property (weak, nonatomic) IBOutlet FBSDKProfilePictureView *profileImage;



@property (weak, nonatomic) IBOutlet UITextField *name;
@property (nonatomic,copy) NSString *profileID;
@property (nonatomic, weak) NSString * userString;

@end

