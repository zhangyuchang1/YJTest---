//
//  KeychainTestController.m
//  YJTest
//
//  Created by zyc on 16/6/13.
//  Copyright © 2016年 zyc. All rights reserved.
//
#define KEY_Iphone_UUID @"KeyIphoneUUID"
#import "KeychainTestController.h"
#import "YJKeychain.h"

@interface KeychainTestController ()

@end

@implementation KeychainTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//获取设备标识
-(void)getAppIdentifier
{
    NSString *usernamepasswordKVPairs = (NSString *)[YJKeychain load:KEY_Iphone_UUID];
    
    NSString *uuid = @"";
    if (usernamepasswordKVPairs) {
        uuid = usernamepasswordKVPairs;
    }else{
        [YJKeychain save:KEY_Iphone_UUID data:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
        uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
