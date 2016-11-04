//
//  JCPageModelController.h
//
//  Created by JJR on 16/1/11.
//  Copyright © 2016年 JJR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCPageModelController : NSObject <UIPageViewControllerDelegate,UIPageViewControllerDataSource>

- (instancetype)initWithPageViewController:(UIPageViewController *)pageViewController andGuideControllers:(NSArray *)guideControllers;

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index;

- (NSUInteger)indexOfViewController:(UIViewController *)viewController;

@end

