//
//  JCNewFeatureVC.h
//
//  Created by JC_R on 16/1/11.
//  Copyright © 2016年 JC_R. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCNewFeatureVC : UIViewController 

@property (strong, nonatomic) UIPageViewController *pageViewController;

/*
 *  初始化方法1
 */
+ (instancetype)newFeatureWithImages:(NSArray *)images andLastVC:(UIViewController *)VC;
- (instancetype)initWithNewFeatureImages:(NSArray *)images andLastVC:(UIViewController *)VC;

/*
 *  初始化方法2
 */
+ (instancetype)newFeatureWithImages:(NSArray *)images enterBlock:(void(^)())enterBlock;
- (instancetype)initWithNewFeatureImages:(NSArray *)images enterBlock:(void(^)())enterBlock;

/*
 *  初始化方法3
 */
+ (instancetype)newFeatureWithControllers:(NSArray *)controllers;
- (instancetype)initWithNewFeatureControllers:(NSArray *)controllers;

/*
 *  是否应该显示版本新特性界面
 */
+ (BOOL)needShowNewFeature;

@end

