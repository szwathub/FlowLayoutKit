//
//  Copyright © 2018 ZhiweiSun. All rights reserved.
//
//  File name: SWaterFallFlowLayout.m
//  Author:    ZhiweiSun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2018/9/22: Created by Cyrex on 2018/9/22
//

#import "SWaterFallFlowLayout.h"

@interface SWaterFallFlowLayout ()

@property (nonatomic, strong) NSMutableArray *dimensionsArray;
@property (nonatomic, strong) NSMutableArray *itemsAttributes;

@end

@implementation SWaterFallFlowLayout
#pragma mark - Override
- (void)prepareLayout {
    [super prepareLayout];

    [self.dimensionsArray removeAllObjects];
    [self.itemsAttributes removeAllObjects];

    if (SWaterFallDirectionHorizontal == self.scrollDirection) {
        for (NSInteger i = 0; i < self.numberOfRows; i++) {
            [self.dimensionsArray addObject:@(self.sectionInset.left)];
        }
    } else {
        for (NSInteger i =0; i < self.numberOfColumns; i++) {
            [self.dimensionsArray addObject:@(self.sectionInset.top)];
        }
    }

    for (NSInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        [self.itemsAttributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathWithIndex:i]]];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return nil;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attrs = [super layoutAttributesForItemAtIndexPath:indexPath];

    return attrs;
}

- (CGSize)collectionViewContentSize {
    return CGSizeZero;
}


#pragma mark - Setters
- (void)setScrollDirection:(SWaterFallDirection)scrollDirection {
    if (_scrollDirection != scrollDirection) {
        _scrollDirection = scrollDirection;
        [self invalidateLayout];
    }
}

- (void)setNumberOfRows:(NSInteger)numberOfRows {
    if (_numberOfRows != numberOfRows) {
        _numberOfRows = numberOfRows;
        if (SWaterFallDirectionHorizontal == self.scrollDirection) {
            [self invalidateLayout];
        }
    }
}

- (void)setNumberOfColumns:(NSInteger)numberOfColumns {
    if (_numberOfColumns != numberOfColumns) {
        _numberOfColumns = numberOfColumns;
        if (SWaterFallDirectionVertical == self.scrollDirection) {
            [self invalidateLayout];
        }
    }
}


- (void)setMinimumLineSpacing:(CGFloat)minimumLineSpacing {
    if (_minimumLineSpacing != minimumLineSpacing) {
        _minimumLineSpacing = minimumLineSpacing;
        [self invalidateLayout];
    }
}

- (void)setMinimumInteritemSpacing:(CGFloat)minimumInteritemSpacing {
    if (_minimumInteritemSpacing != minimumInteritemSpacing) {
        _minimumInteritemSpacing = minimumInteritemSpacing;
        [self invalidateLayout];
    }
}

- (void)setSectionInset:(UIEdgeInsets)sectionInset {
    if (!UIEdgeInsetsEqualToEdgeInsets(_sectionInset, sectionInset)) {
        _sectionInset = sectionInset;
        [self invalidateLayout];
    }
}


#pragma mark - Getters
- (NSMutableArray *)dimensionsArray {
    if (!_dimensionsArray) {
        _dimensionsArray = [NSMutableArray array];
    }

    return _dimensionsArray;
}

- (NSMutableArray *)itemsAttributes {
    if (!_itemsAttributes) {
        _itemsAttributes = [NSMutableArray array];
    }

    return _itemsAttributes;
}

@end
