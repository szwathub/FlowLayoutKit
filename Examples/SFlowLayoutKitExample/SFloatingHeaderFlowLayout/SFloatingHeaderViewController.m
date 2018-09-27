//
//  Copyright © 2018 ZhiweiSun. All rights reserved.
//
//  File name: SFloatingHeaderViewController.m
//  Author:    ZhiweiSun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2018/9/23: Created by Cyrex on 2018/9/23
//

#import "SFloatingHeaderViewController.h"
#import "SFloatingHeader.h"

#import <SFlowLayoutKit/SFlowLayoutKit.h>

@interface SFloatingHeaderViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) SFloatingHeaderFlowLayout *flowLayout;

@end

@implementation SFloatingHeaderViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configViews];
    [self confignavgations];
}


#pragma mark - Private Methods
- (void)configViews {
    [self.view addSubview:self.collectionView];
}

- (void)confignavgations {
    self.title = @"SFloatingHeaderFlowLayout";
    [self addNavCloseItem];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell"
                                                                           forIndexPath:indexPath];

    cell.backgroundColor = [UIColor redColor];

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {

    if (UICollectionElementKindSectionHeader == kind) {
        SFloatingHeader *reuseView = nil;
        reuseView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                       withReuseIdentifier:@"SFloatingHeader"
                                                              forIndexPath:indexPath];
        reuseView.backgroundColor = [UIColor blueColor];

        return reuseView;
    }

    return nil;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}


#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(CGRectGetWidth(collectionView.frame) - 40,
                      120);
}


#pragma mark - Getters
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame
                                             collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        [_collectionView registerClass:[SFloatingHeader class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"SFloatingHeader"];
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }

    return _collectionView;
}

- (SFloatingHeaderFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[SFloatingHeaderFlowLayout alloc] init];
        _flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 306);
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 10, 0);
        _flowLayout.minimumLineSpacing = 20;
        _flowLayout.minimumInteritemSpacing = 20;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }

    return _flowLayout;
}

@end
