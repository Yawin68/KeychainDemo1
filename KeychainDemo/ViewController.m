//
//  ViewController.m
//  KeychainDemo
//
//  Created by Kevin on 2019/6/27.
//  Copyright © 2019 com.vanke.IntlProperty. All rights reserved.
//

#import "ViewController.h"
#import "SFHFKeychainUtils.h"

static NSString *serviceName = @"com.vanke.IntlProperty";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickSaveBtn
{
    NSError *error;
    BOOL saved = [SFHFKeychainUtils storeUsername:@"conquer88@163.com" andPassword:@"1234560"
                                   forServiceName:serviceName updateExisting:YES error:&error];
    
    if (saved) {
        NSLog(@"Keychain保存密码成功！");
        
    } else{
        NSLog(@"Keychain保存密码时出错：%@", error);
    }
}

- (IBAction)clickReadBtn
{
    NSString *pwd = [SFHFKeychainUtils getPasswordForUsername:@"conquer88@163.com" andServiceName:serviceName error:nil];
    NSLog(@"pwd:%@", pwd);
}

- (IBAction)clickDeleteBtn
{
    [SFHFKeychainUtils deleteItemForUsername:@"conquer88@163.com" andServiceName:serviceName error:nil];
    
    NSString *pwd = [SFHFKeychainUtils getPasswordForUsername:@"conquer88@163.com" andServiceName:serviceName error:nil];
    NSLog(@"pwd:%@", pwd);
}

- (IBAction)clickCleanBtn
{
    [SFHFKeychainUtils purgeItemsForServiceName:serviceName error:nil];
    
    NSString *pwd = [SFHFKeychainUtils getPasswordForUsername:@"conquer88@163.com" andServiceName:serviceName error:nil];
    NSLog(@"pwd:%@", pwd);
}


@end
