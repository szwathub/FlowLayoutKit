//
//  Copyright © 2018 ZhiweiSun. All rights reserved.
//
//  File name: SFloatingHeader.m
//  Author:    ZhiweiSun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2018/9/27: Created by Cyrex on 2018/9/27
//

#import "SFloatingHeader.h"

@interface SFloatingHeader ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SFloatingHeader
#pragma mark - Override
- (void)layoutSubviews {
    [super layoutSubviews];

    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


#pragma mark - Getters
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"image_background"];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }

    return _imageView;
}

@end
