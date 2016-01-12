# guide
##快速集成翻页效果的新特性页面##

![](https://raw.githubusercontent.com/DreamCatcherJ/guide/master/demo/screenshots/guide.gif)

#演示项目
查看并运行 demo.xcodeproj

#安装#
CocoaPods

- 在 Podfile 中添加 pod "guide"。
- 执行 pod install 或 pod update。
- 导入 \<JCRootViewControlle.h\>

#如果使用#
在AppDelegate中，创建需要显示的新特性图片，最后一张图片请放在lastVc中传入

```
JCRootViewController *VC = [[JCRootViewController alloc] initWithGuideControllersImages:@[image1,image2,image3]
							   andLastVc:lastVc]
```

```
	self.window.rootViewController = VC;
    
    [self.window makeKeyAndVisible];

```


- 初始化控制器放入新特性页面的图片
- 因为通常在新特性最后一张图片会有点击按钮，所以最后一个页面传入一个控制器进行点击等事件处理

<b>简书地址:[http://www.jianshu.com/p/ed3e8a484405](https://github.com/DreamCatcherJ/guide)