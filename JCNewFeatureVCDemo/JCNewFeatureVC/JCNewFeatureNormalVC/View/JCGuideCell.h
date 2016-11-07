//
//  JCGuideCell.h
//  代码搭建彩票
//
//  Created by mac on 15/11/13.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface JCGuideCell : UICollectionViewCell

@property (nonatomic,strong) UIImage *image;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
