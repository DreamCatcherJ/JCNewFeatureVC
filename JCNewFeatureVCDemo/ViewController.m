//
//  ViewController.m
//  JCNewFeatureVCDemo
//
//  Created by JJR on 16/11/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "JCHomeViewController.h"

@interface ViewController ()
- (IBAction)onClickEnter:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page3"]];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    [self.view sendSubviewToBack:imageView];
    
}


- (IBAction)onClickEnter:(id)sender {
    
    JCHomeViewController *homeVC = [[JCHomeViewController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = homeVC;
    
}
@end
