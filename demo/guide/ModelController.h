//
//  ModelController.h
//
//  Created by JC_R on 16/1/11.
//  Copyright © 2016年 JC_R. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDelegate,UIPageViewControllerDataSource>

- (instancetype)initWithPageViewController:(UIPageViewController *)pageViewController andGuideControllers:(NSArray *)guideControllers;

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index;

- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

