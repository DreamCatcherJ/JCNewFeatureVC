//
//  JCNewFeatureBaseVC.m
//  JCNewFeatureVCDemo
//
//  Created by JJR on 16/11/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "JCNewFeatureBaseVC.h"
#import "UIApplication+JCNewFeature.h"

NSString *const NewFeatureVersionKey = @"JCNewFeatureVersionKey";

@interface JCNewFeatureBaseVC ()

@end

@implementation JCNewFeatureBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
}

+ (instancetype)newFeatureWithImages:(NSArray *)images andLastVC:(UIViewController *)lastVC{
    NSAssert(YES, @"不能调用父类方法，请初始化子类");
    return nil;
}
- (instancetype)initWithNewFeatureImages:(NSArray *)images andLastVC:(UIViewController *)lastVC{
    NSAssert(YES, @"不能调用父类方法，请初始化子类");
    return nil;
}
+ (instancetype)newFeatureWithImages:(NSArray *)images enterBlock:(void(^)())enterBlock{
    NSAssert(YES, @"不能调用父类方法，请初始化子类");
    return nil;
}
- (instancetype)initWithNewFeatureImages:(NSArray *)images enterBlock:(void(^)())enterBlock{
    NSAssert(YES, @"不能调用父类方法，请初始化子类");
    return nil;
}
+ (instancetype)newFeatureWithControllers:(NSArray *)controllers{
    NSAssert(YES, @"不能调用父类方法，请初始化子类");
    return nil;
}
- (instancetype)initWithNewFeatureControllers:(NSArray *)controllers{
    NSAssert(YES, @"不能调用父类方法，请初始化子类");
    return nil;
}

#pragma mark - 是否应该显示版本新特性页面

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

@end
