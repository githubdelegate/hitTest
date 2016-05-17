//
//  ViewController.m
//  AutoTest
//
//  Created by zhangyun on 16/5/10.
//  Copyright © 2016年 USC. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()
@property (nonatomic,strong) testView  *tv;
@property (nonatomic,strong) UITextField  *field;
@property (nonatomic,strong) UIButton  *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
#if MYDEBUG == 1
    NSLog(@"my debug");
#endif

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    self.btn = btn;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    
    
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [self.view addSubview:field];
    field.backgroundColor = [UIColor redColor];
    self.field = field;
    
    
//    testView *view = [[testView alloc] initWithFrame:CGRectMake(10,0 , 300, 80)];
    testView *view = [[testView alloc] init];
    self.tv = view;
    self.tv.userInteractionEnabled = NO;
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(35);
    }];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    [self.tv addGestureRecognizer:tapGes];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputKeyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputKeyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
}

- (void)btnClick{
    NSLog(@"--method = %s--current thread:%@",__func__,[NSThread currentThread]);
}

- (void)viewTapped{
        NSLog(@"--method = %s--current thread:%@",__func__,[NSThread currentThread]);
}

- (void)inputKeyboardWillHide:(NSNotification *)notification{
    
    NSLog(@"--method = %s--current thread:%@",__func__,[NSThread currentThread]);
    CGRect keyboardBounds;
    [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    UIViewAnimationOptions animationCurve = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    CGFloat kbHeight = keyboardBounds.size.height;
    [self.tv mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(35);
    }];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:[duration doubleValue]
                          delay:0
                        options:animationCurve
                     animations:^{
                         [self.view layoutIfNeeded];
                         //                         self.frame = containerFrame;
                         //                         if (self.changeHeightBlock) {
                         //                             self.changeHeightBlock(YES);
                         //                         }
                     } completion:^(BOOL finished) {
                         
                     }];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
//     [self.tv mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.view).offset(-800);
//    }];
//    
//    [self.view setNeedsUpdateConstraints];
//    [self.view updateConstraintsIfNeeded];
//    
//    [UIView animateWithDuration:20 animations:^{
//        [self.view layoutIfNeeded];
//        
//    } completion:^(BOOL finished) {
//        
//    }];
//    
//    UITouch *touch = [touches anyObject];
//    CGPoint touchLocation = [touch locationInView:self.view];
//    if ([self.tv.layer.presentationLayer hitTest:touchLocation]) {
//        [self btnClick];
//    }
    
//    for (UIButton *button in self.buttonsOutletCollection)
//    {
//        if ([button.layer.presentationLayer hitTest:touchLocation])
//        {
//            // This button was hit whilst moving - do something with it here
//            break;
//        }
//    }
//
//    [UIView animateWithDuration:15 delay:0 options:UIViewAnimationCurveLinear | UIViewAnimationOptionAllowUserInteraction animations:^{
//         self.btn.frame = CGRectMake(300, 100, 100, 40);
//    } completion:^(BOOL finished) {
//        
//    }];
}

- (void)inputKeyboardWillShow:(NSNotification *)notification
{
    NSLog(@"--method = %s--current thread:%@",__func__,[NSThread currentThread]);
    CGRect keyboardBounds;
    [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    UIViewAnimationOptions animationCurve = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    CGFloat kbHeight = keyboardBounds.size.height;
    [self.tv mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-kbHeight);
        make.height.mas_equalTo(35);
    }];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    
    [UIView animateWithDuration:[duration doubleValue]
                          delay:0
                        options:animationCurve
                     animations:^{
                         [self.view layoutIfNeeded];
//                         self.frame = containerFrame;
//                         if (self.changeHeightBlock) {
//                             self.changeHeightBlock(YES);
//                         }
                     } completion:^(BOOL finished) {
                         
                     }];
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
}
@end
