//
//  UIApplication+JCNewFeature.m
//  JCNewFeatureVCDemo
//
//  Created by JJR on 16/11/4.
//  Copyright © 2016年 JJR. All rights reserved.
//

#import "UIApplication+JCNewFeature.h"

@implementation UIApplication (JCNewFeature)

/*
 *  当前程序的版本号
 */
-(NSString *)version{
    
    //系统直接读取的版本号
    NSString *versionValueStringForSystemNow=[[NSBundle mainBundle].infoDictionary valueForKey:(NSString *)kCFBundleVersionKey];
    
    return versionValueStringForSystemNow;
}

@end
