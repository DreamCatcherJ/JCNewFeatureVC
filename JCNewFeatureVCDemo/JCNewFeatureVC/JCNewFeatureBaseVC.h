//
//  JCNewFeatureBaseVC.h
//  JCNewFeatureVCDemo
//
//  Created by JJR on 16/11/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCNewFeatureBaseVC : UIViewController

@property (nonatomic,copy) void(^enterBlock)();

@property (nonatomic,strong) NSArray *guideControllers;

/**
 新特性VC (用法：普通翻页效果见方法1-3，翻页效果详见方法4-6)
 
 @param images 图片
 @param lastVC 最后一个页面的VC
 */
+ (instancetype)newFeatureWithImages:(NSArray *)images andLastVC:(UIViewController *)lastVC;
/**
 新特性VC (用法：普通翻页效果见方法1-3，翻页效果详见方法4-6)
 
 @param images 图片
 @param lastVC 最后一个页面的lastVC
 */
- (instancetype)initWithNewFeatureImages:(NSArray *)images andLastVC:(UIViewController *)lastVC;


/**
 * 新特性VC (用法：普通翻页效果见方法1-3，翻页效果详见方法4-6)
 * images              : 图片
 * enterBlock            : 点击最后一张图片的回调block
 */
+ (instancetype)newFeatureWithImages:(NSArray *)images enterBlock:(void(^)())enterBlock;
/**
 * 新特性VC (用法：普通翻页效果见demo1-3，翻页效果详见demo4-6)
 * images              : 图片
 * enterBlock            : 点击最后一张图片的回调block
 */
- (instancetype)initWithNewFeatureImages:(NSArray *)images enterBlock:(void(^)())enterBlock;


/**
 新特性VC (用法：普通翻页效果见方法1-3，翻页效果详见方法4-6)
 
 @param controllers 每一页的控制
 */
+ (instancetype)newFeatureWithControllers:(NSArray *)controllers;
/**
 新特性VC (用法：普通翻页效果见方法1-3，翻页效果详见方法4-6)
 
 @param controllers 每一页的控制
 */
- (instancetype)initWithNewFeatureControllers:(NSArray *)controllers;

/*
 *  是否应该显示版本新特性界面
 */
+ (BOOL)needShowNewFeature;

- (void)didClickImg;

@end
