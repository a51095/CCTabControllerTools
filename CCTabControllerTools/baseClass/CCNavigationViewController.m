//
//  CCNavigationViewController.m
//  CCTabControllerTools
//
//  Created by Wang youdong on 2019/9/30.
//  Copyright © 2019 Jack. All rights reserved.
//

#import "CCNavigationViewController.h"

@interface CCNavigationViewController ()<UINavigationControllerDelegate>
@property(nonatomic,assign)BOOL isPush;
@end

@implementation CCNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate =self;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.isPush) {
        //如果已经isPush,但尚未didShow,则返回不再二次push
        return;
    }else{
        self.isPush = YES;
    }
    [super pushViewController:viewController animated:animated];
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //didShow之后,重置isPush状态为NO,以达到下次可以正常push的目的;
    self.isPush = NO;
}
@end
