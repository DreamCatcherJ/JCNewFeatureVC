//
//  JCNewFeatureController.m
//  oc-weibo
//
//  Created by mac on 15/12/4.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCNewFeatureNormalVC.h"
#import "JCGuideCell.h"
#import "NSUserDefaults+Extension.h"

typedef NS_ENUM(NSInteger,JCNewFeatureNormalType) {
    JCNewFeatureNormalTypeImagesAndLastVC,
    JCNewFeatureNormalTypeImages,
    JCNewFeatureNormalTypeControllers
};

#define WINDOW [UIApplication sharedApplication].keyWindow

#define SCREEN_RECT ([UIScreen mainScreen].bounds)

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface JCNewFeatureNormalVC () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSArray *images;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,assign) JCNewFeatureNormalType newFeatureNormalType;

@end

@implementation JCNewFeatureNormalVC

#pragma mark - 初始化方法1
+ (instancetype)newFeatureWithImages:(NSArray *)images andLastVC:(UIViewController *)lastVC{
    return [[self alloc] initWithNewFeatureImages:images andLastVC:lastVC];
}

- (instancetype)initWithNewFeatureImages:(NSArray *)images andLastVC:(UIViewController *)lastVC{
    
    if (self = [super init]) {
        self.images = [NSArray arrayWithArray:images];
        super.guideControllers = @[lastVC];
        [self addChildViewController:lastVC];
        self.newFeatureNormalType = JCNewFeatureNormalTypeImagesAndLastVC;
    }
    return self;
    
}

#pragma mark - 初始化方法2
+ (instancetype)newFeatureWithImages:(NSArray *)images enterBlock:(void(^)())enterBlock{
    
    return [[self alloc] initWithNewFeatureImages:images enterBlock:enterBlock];
    
}
- (instancetype)initWithNewFeatureImages:(NSArray *)images enterBlock:(void(^)())enterBlock{
    
    if (self = [super init]) {
        self.images = [NSArray arrayWithArray:images];
        super.enterBlock = enterBlock;
        self.newFeatureNormalType = JCNewFeatureNormalTypeImages;
    }
    return self;
    
}

#pragma mark - 初始化方法3
+ (instancetype)newFeatureWithControllers:(NSArray *)controllers{
    return [[self alloc] initWithNewFeatureControllers:controllers];
}
- (instancetype)initWithNewFeatureControllers:(NSArray *)controllers{
    
    if (self = [super init]) {
        super.guideControllers = [controllers copy];
        self.newFeatureNormalType = JCNewFeatureNormalTypeControllers;
        for (UIViewController *vc in controllers) {
            [self addChildViewController:vc];
        }
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    switch (self.newFeatureNormalType) {
        case JCNewFeatureNormalTypeImagesAndLastVC:
            return self.images.count+1;//对应方法1
            break;
        case JCNewFeatureNormalTypeImages:
            return self.images.count;;//对应方法2
            break;
        case JCNewFeatureNormalTypeControllers:
            return super.guideControllers.count;//对应方法3
            break;
        default:
            return 0;
            break;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JCGuideCell *cell = [JCGuideCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    
    if (self.newFeatureNormalType == JCNewFeatureNormalTypeControllers){
        
        [cell.contentView addSubview:[super.guideControllers[indexPath.row] view]];
    }
    
    else if (self.newFeatureNormalType == JCNewFeatureNormalTypeImagesAndLastVC){
        
        if (indexPath.row == self.images.count) {
            [cell.contentView addSubview:[super.guideControllers[0] view]];
        }
        else{
            cell.image = self.images[indexPath.row];
        }
    }
    else if (self.newFeatureNormalType == JCNewFeatureNormalTypeImages){
        cell.image = self.images[indexPath.row];
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.images.count -1) {
        !self.enterBlock?:self.enterBlock();
    }
    
}

#pragma mark - dealloc
- (void)dealloc{
    NSLog(@"%s",__func__);
}

#pragma mark - lazy
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        layout.itemSize = SCREEN_RECT.size;
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:[JCGuideCell class] forCellWithReuseIdentifier:@"JCGuideCell"];
        
        //  样式
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        
    }
    return _collectionView;
}


@end
