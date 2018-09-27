//
//  Copyright © 2018 ZhiweiSun. All rights reserved.
//
//  File name: SFBaseViewController.m
//  Author:    ZhiweiSun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2018/9/26: Created by Cyrex on 2018/9/26
//

#import "SFBaseViewController.h"

@interface SFBaseViewController ()

@property (nonatomic, strong) UIBarButtonItem *closeItem;

@end

@implementation SFBaseViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configNavgations];
}


#pragma mark - Private Methods
- (void)configNavgations {
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    if (navigationBar) {
        navigationBar.shadowImage  = [UIImage new];
        navigationBar.tintColor    = [UIColor blackColor];
        navigationBar.barTintColor = [UIColor whiteColor];
        navigationBar.titleTextAttributes = @{ NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Semibold" size:16],
                                    NSForegroundColorAttributeName : [UIColor blackColor]};
    }
}

- (void)addNavCloseItem {
    self.navigationItem.leftBarButtonItem = self.closeItem;
}


#pragma mark - Action Methods
- (void)closeViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Getters
- (UIBarButtonItem *)closeItem {
    if (!_closeItem) {
        _closeItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sf_nav_close"]
                                                      style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(closeViewController)];
    }

    return _closeItem;
}

@end
