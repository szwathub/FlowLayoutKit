//
//  Copyright © 2018 ZhiweiSun. All rights reserved.
//
//  File name: SWaterFallFlowLayout.h
//  Author:    ZhiweiSun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2018/9/22: Created by Cyrex on 2018/9/22
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SWaterFallDirection) {
    SWaterFallDirectionVertical = 0,
    SWaterFallDirectionHorizontal
};

@protocol SWaterFallFlowLayoutDelegate;

@interface SWaterFallFlowLayout : UICollectionViewLayout

@property (nonatomic, weak) id <SWaterFallFlowLayoutDelegate> delegate;

@property (nonatomic, assign) SWaterFallDirection scrollDirection;

/**
 number of rows, only useful when scroll direction's value is SWaterFallDirectionHorizontal
 */
@property (nonatomic, assign) NSInteger numberOfRows;

/**
 number of columns, uonly userful when scroll direction's value is SWaterFallDirectionVertical
 */
@property (nonatomic, assign) NSInteger numberOfColumns;

@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) UIEdgeInsets sectionInset;

@end


@protocol SWaterFallFlowLayoutDelegate <NSObject>
@required
- (CGFloat)waterFallFlowLayout:(SWaterFallFlowLayout *)layout
        dimensionsForDirection:(SWaterFallDirection)direction
                   atIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
