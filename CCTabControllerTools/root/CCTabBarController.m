//
//  CCTabBarController.m
//  CCTabControllerTools
//
//  Created by Wang youdong on 2019/9/30.
//  Copyright © 2019 Jack. All rights reserved.
//

#import "CCTabBarController.h"
#import "CCTabBar.h"
#import "CCNavigationViewController.h"
#import "CCFishViewController.h"
#import "CCPondViewController.h"
#import "CCReleaseViewController.h"
#import "CCNewsViewController.h"
#import "CCManagerViewController.h"
@interface CCTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic,strong)CCTabBar    *tabBar;
@end

@implementation CCTabBarController
@dynamic tabBar;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    self.tabBar = [[CCTabBar alloc] init];
    [self.tabBar.centerBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    //设置背景颜色不透明
    self.tabBar.translucent = NO;
    //利用KVC,将自定义tabBar,赋给系统tabBar
    [self setValue:self.tabBar forKeyPath:@"tabBar"];
    
    [self addChildViewControllers];
}
//添加子控制器
- (void)addChildViewControllers{
    CCFishViewController *fish = [[CCFishViewController alloc] init];
    fish.tabBarItem.title = @"闲鱼";
    fish.tabBarItem.image = [UIImage imageNamed:@"home_normal"];
    fish.tabBarItem.selectedImage = [UIImage imageNamed:@"home_highlight"];
    
    CCPondViewController *pond = [[CCPondViewController alloc] init];
    pond.tabBarItem.title = @"鱼塘";
    pond.tabBarItem.image = [UIImage imageNamed:@"fishpond_normal"];
    pond.tabBarItem.selectedImage = [UIImage imageNamed:@"fishpond_highlight"];
    //不设置图片,先占位
    CCReleaseViewController *release = [[CCReleaseViewController alloc] init];
    release.tabBarItem.title = @"发布";
    
    CCNewsViewController *news = [[CCNewsViewController alloc] init];
    news.tabBarItem.title = @"消息";
    news.tabBarItem.image = [UIImage imageNamed:@"message_normal"];
    news.tabBarItem.selectedImage = [UIImage imageNamed:@"message_highlight"];
    
    CCManagerViewController *manager = [[CCManagerViewController alloc] init];
    manager.tabBarItem.title = @"我的";
    manager.tabBarItem.image = [UIImage imageNamed:@"account_normal"];
    manager.tabBarItem.selectedImage = [UIImage imageNamed:@"account_highlight"];
    
    NSArray *itemArrays   = @[fish,pond,release,news,manager];
    self.viewControllers  = itemArrays;
    self.tabBar.tintColor = [UIColor blackColor];
}
- (void)buttonAction{
    //关联中间按钮
    self.selectedIndex = 2;
    //播放动画
    [self rotationAnimation];
}
//tabbar选择时的代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (tabBarController.selectedIndex == 2){
        //选中中间的按钮
        [self rotationAnimation];
    }else {
        [self.tabBar.centerBtn.layer removeAllAnimations];
    }
}
//旋转动画
- (void)rotationAnimation{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*0.5];
    rotationAnimation.duration = 1.0;
    rotationAnimation.repeatCount = DOMAIN;
    [self.tabBar.centerBtn.layer addAnimation:rotationAnimation forKey:@"key"];
}
@end
