//
//  JCGuideCell.m
//  代码搭建彩票
//
//  Created by mac on 15/11/13.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "JCGuideCell.h"

@interface JCGuideCell ()
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation JCGuideCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    
    NSString * const reuseIdentifier = @"JCGuideCell";
    
    JCGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (void)setImage:(UIImage *)image{

    _image = image;
    [self.contentView addSubview:self.imageView];
    self.imageView.image = image;
    
}

#pragma mark - lazy
- (UIImageView *)imageView{

    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    }
    return _imageView;
}

@end
