//
//  CCBaseViewController.m
//  CCTabControllerTools
//
//  Created by Wang youdong on 2019/9/30.
//  Copyright © 2019 Jack. All rights reserved.
//

#import "CCBaseViewController.h"

@interface CCBaseViewController ()

@end

@implementation CCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:0.8];
}
@end
