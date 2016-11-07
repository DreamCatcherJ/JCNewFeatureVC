//
//  NSUserDefaults+Extension.m
//  gzweibo
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "NSUserDefaults+Extension.h"

//沙盒的版本key
#define kVersionInSandBox @"VersionInSandBox"

@implementation NSUserDefaults (Extension)


+(void)saveCurrentVersion{
    //保存当前应用版本号到沙盒
    NSString *currentVersion = [self versionFromInfoPlist];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:currentVersion forKey:kVersionInSandBox];
    [defaults synchronize];
}

+(NSString *)versionFromSandBox{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kVersionInSandBox];
}


+(NSString *)versionFromInfoPlist{
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    //    NSLog(@"%@",info);
    //获取当前版本
    NSString *versionKey =  (__bridge NSString *)kCFBundleVersionKey;
    NSString *currentVersion = info[versionKey];
    
    return currentVersion;
}

@end
