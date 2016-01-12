//
//  JCRootViewController.m
//  sd
//
//  Created by JC_R on 16/1/11.
//  Copyright © 2016年 JC_R. All rights reserved.
//

#import "JCRootViewController.h"
#import "ModelController.h"

@interface JCRootViewController ()

@property (readonly, strong, nonatomic) ModelController *modelController;

@property (nonatomic,strong) NSArray *guideControllers;

@end

@implementation JCRootViewController

@synthesize modelController = _modelController;

- (instancetype)initWithGuideControllersImages:(NSArray *)guideControllersImages andLastVc:(UIViewController *)viewControll{

    if (self = [super init]) {
        NSMutableArray *tempArr = [NSMutableArray array];
        for (int i = 0; i<guideControllersImages.count; i++) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            imageView.image = guideControllersImages[i];
            
            UIViewController *VC = [[UIViewController alloc] init];
            [VC.view addSubview:imageView];
            [tempArr addObject:VC];
        }
        [tempArr addObject:viewControll];
        _guideControllers = [tempArr copy];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建pageViewController
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];

    self.pageViewController.delegate = self.modelController;
    self.pageViewController.dataSource = self.modelController;
    
    // 设置startingViewController index 第几个
//    DataViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    
    // 设置pageViewControllers
//    NSArray *viewController = @[_controllers[0]];
    
    // 设置pageViewController默认展示第几页
    [self.pageViewController setViewControllers:@[_guideControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    // 管理控制器
    [self addChildViewController:self.pageViewController];
    
    // 管理pageViewController的view
    [self.view addSubview:self.pageViewController.view];

    // 如果是iPad，往里缩进
    CGRect pageViewRect = self.view.bounds;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0);
    }
    // 设置这本书的rect
    self.pageViewController.view.frame = pageViewRect;

}
#pragma mark - lazy
- (ModelController *)modelController {
    if (!_modelController) {
        _modelController = [[ModelController alloc] initWithPageViewController:_pageViewController andGuideControllers:_guideControllers];
    }
    return _modelController;
}
@end
