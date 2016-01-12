//
//  ModelController.m
//
//  Created by JC_R on 16/1/11.
//  Copyright © 2016年 JC_R. All rights reserved.
//

#import "ModelController.h"

@interface ModelController ()

@property (nonatomic,strong) UIPageViewController *pageViewController;

@property (nonatomic,strong) NSArray *guideControllers;

@end

@implementation ModelController

- (instancetype)initWithPageViewController:(UIPageViewController *)pageViewController andGuideControllers:(NSArray *)guideControllers{

    if (self = [super init]) {
        _pageViewController = pageViewController;
        _guideControllers = guideControllers;
    }
    return self;
}

/**
 *  返回翻页后的控制器
 */
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index{
    // Return the data view controller for the given index.
    if ((self.guideControllers.count == 0) || (index >= [self.guideControllers count])) {
        return nil;
    }

    // 翻页后的控制器
    UIViewController *guideController = _guideControllers[index];
    return guideController;
}
/**
 *  返回当前展现的控制器 在pageViewController中的index
 */
- (NSUInteger)indexOfViewController:(UIViewController *)viewController {
    return [self.guideControllers indexOfObject:viewController];
}

#pragma mark - Page View Controller Data Source
/**
 *  往前翻页
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(UIViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}
/**
 *  往后翻页
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(UIViewController *)viewController];
    if (index == NSNotFound || (++index == self.guideControllers.count)) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
@end
