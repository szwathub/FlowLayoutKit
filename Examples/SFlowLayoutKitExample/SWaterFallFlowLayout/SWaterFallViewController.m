//
//  Copyright © 2018 ZhiweiSun. All rights reserved.
//
//  File name: SWaterFallViewController.m
//  Author:    ZhiweiSun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2018/9/25: Created by Cyrex on 2018/9/25
//

#import "SWaterFallViewController.h"

#import <SFlowLayoutKit/SFlowLayoutKit.h>

@interface SWaterFallViewController () <UICollectionViewDataSource, UICollectionViewDelegate, SWaterFallFlowLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) SWaterFallFlowLayout *flowLayout;

@end

@implementation SWaterFallViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self confignavgations];
    [self configViews];
}


#pragma mark - Private Methods
- (void)configViews {
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)confignavgations {
    self.title = @"SFloatingHeaderFlowLayout";
    [self addNavCloseItem];
    [self addNavControlItem];
}


#pragma mark - Override
- (void)showControlView {
    [super showControlView];

}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell"
                                                                           forIndexPath:indexPath];

    cell.backgroundColor = [UIColor redColor];

    return cell;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ;
}


#pragma mark - SWaterFallFlowLayoutDelegate
- (CGFloat)waterFallFlowLayout:(SWaterFallFlowLayout *)layout dimensionsAtIndexPath:(NSIndexPath *)indexPath {
    return 40 + (arc4random() % 40);
}


#pragma mark - Getters
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }

    return _collectionView;
}

- (SWaterFallFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[SWaterFallFlowLayout alloc] init];
        _flowLayout.delegate = self;
        _flowLayout.sectionInset = UIEdgeInsetsMake(16, 16, 16, 16);
        _flowLayout.minimumLineSpacing = 16;
        _flowLayout.minimumInteritemSpacing = 16;
        _flowLayout.numberOfRowColumns = 3;
        _flowLayout.scrollDirection = SWaterFallDirectionHorizontal;
    }

    return _flowLayout;
}

@end
