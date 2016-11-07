# JCNewFeatureVC
##快速集成 普通效果 & 翻页效果 新特性页面##

![](https://github.com/DreamCatcherJ/JCNewFeatureVC/blob/master/demo.gif?raw=true)

#演示项目
查看并运行 JCNewFeatureVCDemo.xcodeproj

#安装#
CocoaPods

- 在 Podfile 中添加 pod "JCNewFeatureVC"。
- 执行 pod install 或 pod update。
- 导入 \<JCNewFeatureNormalVC.h\> 或者 \<JCNewFeatureNormalVC.h\>

#如何使用#
在AppDelegate中的`- (BOOL)application:didFinishLaunchingWithOptions:`方法中

```
BOOL needShow = [JCNewFeatureNormalVC needShowNewFeature];// 根据程序是否第一次运行来显示新特性页面
if(needShow){
    // 先创建好需要展示的新特性图片
    UIImage *image1 = [UIImage imageNamed:@"image1"];
    UIImage *image2 = [UIImage imageNamed:@"image2"];
  下面的代码放在这里👇
}
```

#####普通效果初始化方法1
传入需要展示的图片，最后一页用controller来管理

```
UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [sb instantiateInitialViewController];
        JCNewFeatureNormalVC *newContr =[JCNewFeatureNormalVC newFeatureWithImages:@[image1,image2] andLastVC:vc];
        self.window.rootViewController = newContr;
```

- 初始化控制器放入新特性页面的图片
- 因为通常在新特性最后一张图片会有点击按钮，所以最后一个页面传入一个控制器进行点击等事件处理

#####普通效果初始化方法2
只需传入需要展示的图片

```
JCNewFeatureNormalVC *newContr =[JCNewFeatureNormalVC newFeatureWithImages:@[page1,page2,page3] enterBlock:^{
            NSLog(@"enter");
            [self enterHomeVC];
        }];
        self.window.rootViewController = newContr;
```
- 点击最后一张图片的block回调

#####普通效果初始化方法3
传入每一页对应的控制器

```
UIViewController *oneVC = [[UIViewController alloc] init];
        oneVC.view.backgroundColor = [UIColor orangeColor];
        
        UIViewController *twoVC = [[UIViewController alloc] init];
        twoVC.view.backgroundColor = [UIColor blueColor];
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *threeVC = [sb instantiateInitialViewController];
        
        window.rootViewController = [JCNewFeatureNormalVC newFeatureWithControllers:@[oneVC,twoVC,threeVC]];
```
- 每一个页面都是由一个控制器管理，高度自定义每一个页面

####如果想换成gif中的翻页效果，只需要把上面方法中的`JCNewFeatureNormalVC` 换成 `JCNewFeaturePagingVC `

<b>简书地址:[http://www.jianshu.com/p/8f267c9b9565)