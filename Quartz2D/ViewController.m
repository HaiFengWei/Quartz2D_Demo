//
//  ViewController.m
//  Quartz2D
//
//  Created by haifeng on 2017/4/27.
//  Copyright © 2017年 meilikeji. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()
@property (nonatomic, strong) DrawView *drawView;
@end

@implementation ViewController

- (DrawView *)drawView {
    
    if (!_drawView) {
        _drawView = [[DrawView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _drawView.backgroundColor=[UIColor whiteColor];
    }
    return _drawView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 使用self.drawView,别用_drawView;
    [self.view addSubview:self.drawView];
}



@end
