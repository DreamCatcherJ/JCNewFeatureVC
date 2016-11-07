//
//  JCNewFeatureVC.m
//
//  Created by JJR on 16/1/11.
//  Copyright © 2016年 JJR. All rights reserved.
//

#import "JCNewFeaturePagingVC.h"
#import "JCPageModelController.h"

@interface JCNewFeaturePagingVC ()

@property (strong, nonatomic) JCPageModelController *modelController;

@end

@implementation JCNewFeaturePagingVC

#pragma mark - 初始化方法4

+ (instancetype)newFeatureWithImages:(NSArray *)images andLastVC:(UIViewController *)VC{
    return [[self alloc] initWithNewFeatureImages:images andLastVC:VC];
}

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
        super.guideControllers = [tempArr copy];
    }
    return self;
}

#pragma mark - 初始化方法5

+ (instancetype)newFeatureWithImages:(NSArray *)images enterBlock:(void(^)())enterBlock{
    return [[self alloc] initWithNewFeatureImages:images enterBlock:enterBlock];
}

- (instancetype)initWithNewFeatureImages:(NSArray *)images enterBlock:(void(^)())enterBlock{

    if (self = [super init]) {
        NSMutableArray *tempArr = [NSMutableArray array];
        for (int i = 0; i<images.count; i++) {
            
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            imageView.image = images[i];
            
            if (i == images.count-1) {
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickImg)];
                imageView.userInteractionEnabled = YES;
                [imageView addGestureRecognizer:tap];
            }
            
            UIViewController *VC = [[UIViewController alloc] init];
            [VC.view addSubview:imageView];
            [tempArr addObject:VC];
        }
        super.guideControllers = [tempArr copy];
        super.enterBlock = enterBlock;
    }
    return self;
    
}

#pragma mark - 初始化方法6

+ (instancetype)newFeatureWithControllers:(NSArray *)controllers{
    return [[self alloc] initWithNewFeatureControllers:controllers];
}

- (instancetype)initWithNewFeatureControllers:(NSArray *)controllers{

    if (self = [super init]) {
        super.guideControllers = [controllers copy];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建pageViewController
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];

    self.pageViewController.delegate = self.modelController;
    self.pageViewController.dataSource = self.modelController;
    
    // 设置pageViewController默认展示第几页
    [self.pageViewController setViewControllers:@[super.guideControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    // 管理控制器
    [self addChildViewController:self.pageViewController];
    
    // 管理pageViewController的view
    [self.view addSubview:self.pageViewController.view];

}

- (void)dealloc{
    NSLog(@"%s",__func__);
}



#pragma mark - lazy
- (JCPageModelController *)modelController {
    if (!_modelController) {
        _modelController = [[JCPageModelController alloc] initWithPageViewController:_pageViewController andGuideControllers:super.guideControllers];
    }
    return _modelController;
}
@end
