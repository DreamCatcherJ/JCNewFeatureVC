//
//  NSUserDefaults+Extension.h
//  gzweibo
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Extension)

/**
 *  保存当前版本号到偏好设置
 */
+(void)saveCurrentVersion;


/**
 *  获取沙盒的版本号
 */
+(NSString *)versionFromSandBox;

/**
 *  获取Info.plist的版本号
 */
+(NSString *)versionFromInfoPlist;
@end
