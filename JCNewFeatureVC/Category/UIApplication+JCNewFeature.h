//
//  UIApplication+JCNewFeature.h
//  JCNewFeatureVCDemo
//
//  Created by JJR on 16/11/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (JCNewFeature)

/*
 *  当前程序的版本号
 */
@property (nonatomic,copy,readonly) NSString *version;

@end
