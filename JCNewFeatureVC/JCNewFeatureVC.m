//
//  JCRootViewController.m
//  sd
//
//  Created by JC_R on 16/1/11.
//  Copyright © 2016年 JC_R. All rights reserved.
//

#import "JCNewFeatureVC.h"
#import "JCPageModelController.h"
#import "UIApplication+JCNewFeature.h"

NSString *const NewFeatureVersionKey = @"JCNewFeatureVersionKey";

@interface JCNewFeatureVC ()

@property (strong, nonatomic) JCPageModelController *modelController;

@property (nonatomic,strong) NSArray *guideControllers;

@end

@implementation JCNewFeatureVC

/*
 *  初始化
 */
+ (instancetype)newFeatureImages:(NSArray *)images andLastVC:(UIViewController *)VC{
    return [[self alloc] initWithNewFeatureImages:images andLastVC:VC];
}
/*
 *  初始化
 */
- (instancetype)initWithNewFeatureImages:(NSArray *)images andLastVC:(UIViewController *)lastVC{

    if (self = [super init]) {
        NSMutableArray *tempArr = [NSMutableArray array];
        for (int i = 0; i<images.count; i++) {
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            imageView.image = images[i];
            
            UIViewController *VC = [[UIViewController alloc] init];
            [VC.view addSubview:imageView];
            [tempArr addObject:VC];
        }
        [tempArr addObject:lastVC];
        _guideControllers = [tempArr copy];
    }
    return self;
}

- (void)viewDidLayoutSubviews{

    [super viewDidLayoutSubviews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建pageViewController
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];

    self.pageViewController.delegate = self.modelController;
    self.pageViewController.dataSource = self.modelController;
    
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

/*
 *  是否应该显示版本新特性页面
 */
+ (BOOL)needShowNewFeature{
    
    NSString *versionValueStringForSystemNow = [UIApplication sharedApplication].version;
    
    NSString *versionLocal = [[NSUserDefaults standardUserDefaults] objectForKey:NewFeatureVersionKey];
    
    if(versionLocal!=nil && [versionValueStringForSystemNow isEqualToString:versionLocal]){
        return NO;
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:versionValueStringForSystemNow forKey:NewFeatureVersionKey];
        
        return YES;
    }
}

#pragma mark - lazy
- (JCPageModelController *)modelController {
    if (!_modelController) {
        _modelController = [[JCPageModelController alloc] initWithPageViewController:_pageViewController andGuideControllers:_guideControllers];
    }
    return _modelController;
}
@end
