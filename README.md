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

```
[[JCRootViewController alloc] initWithGuideControllersImages:@[image1]
							   andLastVc:lastVc]
```

- 初始化控制器放入新特性页面的图片
- 因为通常在新特性最后一张图片会有点击按钮，所以最后一个页面传入一个控制器进行点击等事件处理