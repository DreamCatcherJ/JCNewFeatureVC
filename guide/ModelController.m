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
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
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
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound || (++index == self.guideControllers.count)) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
//
//#pragma mark - UIPageViewController delegate methods
///**
// *  设置横竖屏显示多少页
// *  UIPageViewControllerSpineLocationMin 1
// *  UIPageViewControllerSpineLocationMid 2
// */
//- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
//    if (UIInterfaceOrientationIsPortrait(orientation) || ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)) {
//        // iPad竖屏或者iPhone (1页)
//        UIViewController *currentViewController = self.pageViewController.viewControllers[0];
//        NSArray *viewControllers = @[currentViewController];
//        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
//        // 默认就是NO
//        self.pageViewController.doubleSided = NO;
//        return UIPageViewControllerSpineLocationMin;
//    }
//    
//    /* iPad 的横屏 (2页)
//     -  如果当前页是双数，显示当前页和下一页
//     -  如果当前页是奇数，显示上一页和当前页
//     */
//    DataViewController *currentViewController = self.pageViewController.viewControllers[0];
//    NSArray *viewControllers = nil;
//    
//    NSUInteger indexOfCurrentViewController = [self indexOfViewController:currentViewController];
//    if (indexOfCurrentViewController == 0 || indexOfCurrentViewController % 2 == 0) {
//        UIViewController *nextViewController = [self pageViewController:self.pageViewController viewControllerAfterViewController:currentViewController];
//        viewControllers = @[currentViewController, nextViewController];
//    } else {
//        UIViewController *previousViewController = [self pageViewController:self.pageViewController viewControllerBeforeViewController:currentViewController];
//        viewControllers = @[previousViewController, currentViewController];
//    }
//    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
//    
//    
//    return UIPageViewControllerSpineLocationMid;
//}


@end
