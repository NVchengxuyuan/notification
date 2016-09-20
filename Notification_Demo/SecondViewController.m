//
//  SecondViewController.m
//  Notification_Demo
//
//  Created by ZRY-Drex on 16/8/19.
//  Copyright © 2016年 ZCC. All rights reserved.
//

#define LRToast(str) [NSString stringWithFormat:@"%@",str]
#import "SecondViewController.h"
#import "NotificatonViewController.h"
@interface SecondViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UIView *bgView;
@property (nonatomic,strong)UITextField *tf;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //添加一个输入框
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, 260, 40)];
    _tf.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_tf];
    
     UIViewController *firstVC = [self.navigationController.viewControllers firstObject];
    //注册通知
    [[NSNotificationCenter defaultCenter]addObserver:firstVC selector:@selector(changeBGColor:) name:@"changeBGColor" object:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 100, 100, 30);
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"点击发送通知" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handlePost:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)handlePost:(UIButton *)sender{
   UIColor *color = [UIColor yellowColor];
//随机颜色
// UIColor *color = [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1.0];
    //发送通知
    NSLog(@"发送通知了");
    //发送通知的时候会回调第一界面中的方法
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeBGColor" object:color];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
