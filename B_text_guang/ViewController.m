//
//  ViewController.m
//  B_text_guang
//
//  Created by Aditya Narayan on 5/19/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//
/*
 developers.facebook.com/docs/facebook-login/ios/v2.3 if load the button before view.
 Problem of plist in the test folder. plist in the test folder should be ignored.
 */
#import "ViewController.h"





@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[FBSDKAccessToken ];
    //[FBSDKAccessToken clientToken]

    /*
     self.fbLoginButton.delegate = self
     FBSDKProfile.enableUpdatesOnAccessTokenChange(true)
     */
   // to get a new access token. This can be done through the Facebook Javascript SDK, or by redirecting the user to the Log In page.
    //
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getFBdata) name: FBSDKAccessTokenDidChangeNotification object:nil];
}

-(void)signInViaProfile{
    FBSDKProfile * profile = [[FBSDKProfile alloc] init];
}

- (IBAction)loginButtonC:(id)sender {
    
    FBSDKLoginManager *loginC = [[FBSDKLoginManager alloc] init];
    //@"public_profile",
    [loginC logInWithReadPermissions:@[@"public_profile",@"email"]handler:^(FBSDKLoginManagerLoginResult *result, NSError *error){
       
        if (result) {
            self.userString = result.token.userID;
            NSLog(@" token expries at %@",result.token.expirationDate);
            [self signInViaProfile];
            [self getFBdata];

        } else {
            // maybe show an alertView.
            NSLog(@"NO permission");
        }
    }];
    
}

-(void)getFBdata{
    
     //FBSDKLoginManager.renewSystemCredentials { (result:ACAccountCredentialRenewResult, error:NSError!) -> Void in

    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"FBSDKAccesToken currentAccessToken = %@", [FBSDKAccessToken currentAccessToken]);
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         //@property (readonly, copy, nonatomic) NSDate *expirationDate
         

         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user email :%@\n user name : %@ ", [result objectForKey:@"email"], [result objectForKey:@"name"]);

                 NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=small&return_ssl_resources=1", self.userString]];
                 UIImageView * imageV = [[UIImageView alloc]initWithImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:pictureURL]]];
                 //self.profileImage.pictureMode =  FBSDKProfilePictureModeSquare;
                 [self.profileImage addSubview: imageV];
                 [self.profileImage setContentMode:UIViewContentModeScaleAspectFit];
                 self.name.text = [NSString stringWithFormat: @"-> %@ \r%@", [result objectForKey:@"name"],[result objectForKey:@"email"]];
                 FBinfo * fbinfo = [FBinfo new];
//                 fbinfo.name = [result objectForKey:@"name"];
//                 fbinfo.email = [result objectForKey:@"email"];
                 NSMutableDictionary * temp = [[NSMutableDictionary alloc]init];
                 temp = [fbinfo add:[result objectForKey:@"name"] name:[result objectForKey:@"email"]];
             }
         }];
    }
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
 
}
    
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
