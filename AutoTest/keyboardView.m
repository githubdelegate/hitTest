//
//  keyboardView.m
//  AutoTest
//
//  Created by zhangyun on 16/5/14.
//  Copyright © 2016年 USC. All rights reserved.
//

#import "keyboardView.h"
#import <Masonry.h>

@implementation keyboardView

- (instancetype)init{
    if (self = [super init]) {
        _btn = [[UIButton alloc] init];
        _btn.backgroundColor = [UIColor grayColor];
        [self addSubview:_btn];
    }
    return self;
}

- (void)layoutSubviews
{
    NSLog(@"-kb-method = %s--current thread:%@",__func__,[NSThread currentThread]);
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(50);
    }];
}
@end
