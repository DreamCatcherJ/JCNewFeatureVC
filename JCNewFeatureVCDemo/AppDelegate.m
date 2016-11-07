//
//  AppDelegate.m
//  JCNewFeatureVCDemo
//
//  Created by JJR on 16/11/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "JCNewFeaturePagingVC.h"
#import "ViewController.h"
#import "JCHomeViewController.h"
#import "JCNewFeatureNormalVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window = window;
    
    BOOL needShow = [JCNewFeatureNormalVC needShowNewFeature];
    
#warning  正式环境去掉
    needShow = YES;
    
    UIImage *page1 = [UIImage imageNamed:@"page1"];
    UIImage *page2 = [UIImage imageNamed:@"page2"];
    UIImage *page3 = [UIImage imageNamed:@"page3"];
    
    if (needShow) {
        
        /******************翻页效果初始化方法1*******************/
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [sb instantiateInitialViewController];
        
        JCNewFeatureNormalVC *newContr =[JCNewFeatureNormalVC newFeatureWithImages:@[page1,page2] andLastVC:vc];
        self.window.rootViewController = newContr;
        
        /******************翻页效果初始化方法2*******************/
        /*
        JCNewFeatureNormalVC *newContr =[JCNewFeatureNormalVC newFeatureWithImages:@[page1,page2,page3] enterBlock:^{
            NSLog(@"enter");
            [self enterHomeVC];
        }];
        self.window.rootViewController = newContr;
         */
        /******************翻页效果初始化方法3*******************/
        /*
        UIViewController *oneVC = [[UIViewController alloc] init];
        oneVC.view.backgroundColor = [UIColor orangeColor];
        
        UIViewController *twoVC = [[UIViewController alloc] init];
        twoVC.view.backgroundColor = [UIColor blueColor];
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *threeVC = [sb instantiateInitialViewController];
        
        window.rootViewController = [JCNewFeatureNormalVC newFeatureWithControllers:@[oneVC,twoVC,threeVC]];
        */
        /******************翻页效果初始化方法4*******************/
        /*
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [sb instantiateInitialViewController];
        
        window.rootViewController = [JCNewFeaturePagingVC newFeatureWithImages:@[page1,page2] andLastVC:vc];
        */
        /******************翻页效果初始化方法5*******************/
        /*
        window.rootViewController = [JCNewFeaturePagingVC newFeatureWithImages:@[page1,page2,page3] enterBlock:^{
            NSLog(@"enter");
            [self enterHomeVC];
        }];
        */
        /******************翻页效果初始化方法6*******************/
        /*
        UIViewController *oneVC = [[UIViewController alloc] init];
        oneVC.view.backgroundColor = [UIColor orangeColor];
        
        UIViewController *twoVC = [[UIViewController alloc] init];
        twoVC.view.backgroundColor = [UIColor blueColor];
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *threeVC = [sb instantiateInitialViewController];
        
        window.rootViewController = [JCNewFeaturePagingVC newFeatureWithControllers:@[oneVC,twoVC,threeVC]];
        */
    }
    
    return YES;
}

- (void)enterHomeVC{

    JCHomeViewController *homeVC = [[JCHomeViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = homeVC;
    
}


@end
