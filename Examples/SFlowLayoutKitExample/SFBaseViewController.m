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
@property (nonatomic, strong) UIBarButtonItem *controlItem;

@end

@implementation SFBaseViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configNavgations];
    [self configViews];
}


#pragma mark - Private Methods
- (void)configViews {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)configNavgations {
    self.edgesForExtendedLayout = UIRectEdgeAll;

    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    if (navigationBar) {
        navigationBar.shadowImage  = [UIImage new];
        navigationBar.tintColor    = [UIColor blackColor];
        navigationBar.barTintColor = [UIColor whiteColor];
        navigationBar.titleTextAttributes = @{ NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Semibold" size:16],
                                    NSForegroundColorAttributeName : [UIColor blackColor]};
    }
    self.navigationController.navigationBar.translucent = NO;
}

- (void)addNavCloseItem {
    self.navigationItem.leftBarButtonItem = self.closeItem;
}

- (void)addNavControlItem {
    self.navigationItem.rightBarButtonItem = self.controlItem;
}


#pragma mark - Action Methods
- (void)showControlView {

}

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

- (UIBarButtonItem *)controlItem {
    if (!_controlItem) {
        _controlItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sf_nav_control"]
                                                        style:UIBarButtonItemStylePlain
                                                       target:self
                                                       action:@selector(showControlView)];
    }

    return _controlItem;
}

@end
