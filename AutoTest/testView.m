//
//  testView.m
//  AutoTest
//
//  Created by zhangyun on 16/5/13.
//  Copyright © 2016年 USC. All rights reserved.
//

#import "testView.h"
#import <Masonry.h>

@implementation testView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor redColor];
        [self addSubview:_label];
        
        _btn = [[UIButton alloc] init];
        [_btn setBackgroundColor:[UIColor yellowColor]];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn];
        
        _imageView = [[UIImageView alloc] init];
        [_imageView setBackgroundColor:[UIColor purpleColor]];
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        
        UITapGestureRecognizer *tapges= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped)];
        [_imageView addGestureRecognizer:tapges];
        
        _kbv = [[keyboardView alloc] init];
        _kbv.backgroundColor = [UIColor darkGrayColor];
        [self addSubview:_kbv];
        
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)imageTapped{
    NSLog(@"--method = %s--current thread:%@",__func__,[NSThread currentThread]);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"--method = %s--current thread:%@",__func__,[NSThread currentThread]);
    return nil;
}

- (void)btnClick{
    NSLog(@"--method = %s--current thread:%@",__func__,[NSThread currentThread]);
}

- (void)layoutSubviews{
    
    NSLog(@"-tv-method = %s--current thread:%@",__func__,[NSThread currentThread]);
    NSLog(@"  frame = %@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.height, self.frame.size.height));
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView.mas_right);
        make.top.equalTo(self);
        make.height.equalTo(self);
        make.right.equalTo(self);
    }];
    
    [self.kbv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label.mas_left).offset(20);
        make.top.equalTo(self);
        make.height.equalTo(self);
        make.width.mas_equalTo(100);
    }];
}

@end
