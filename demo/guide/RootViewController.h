//
//  RootViewController.h
//  sd
//
//  Created by JC_R on 16/1/11.
//  Copyright © 2016年 JC_R. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController 

@property (strong, nonatomic) UIPageViewController *pageViewController;

- (instancetype)initWithGuideControllersImages:(NSArray *)guideControllersImages andLastVc:(UIViewController *)viewControll;

@end

