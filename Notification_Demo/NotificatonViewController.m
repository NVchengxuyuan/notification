//
//  NotificatonViewController.m
//  Notification_Demo
//
//  Created by ZRY-Drex on 16/8/19.
//  Copyright © 2016年 ZCC. All rights reserved.
//

#import "NotificatonViewController.h"
#import "SecondViewController.h"
@interface NotificatonViewController ()

@end

@implementation NotificatonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 280, 40)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 100, 100, 30);
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"push下一页面" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handlePush:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    //注册通知，添加观察者对象(在本页面发送通知，接收通知)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fun:) name:@"notificationTest" object:nil];
    
    //发送通知（发送时会触发通知中的方法）
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"jack",@"name",@"25",@"age", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationTest" object:self userInfo:dic];
    
    
   
    
}


//接收通知内容
- (void)fun:(NSNotification *)notification{
    NSLog(@"lala = %@",notification.userInfo);
    
}

//接收从第二个界面发过来的通知
- (void)changeBGColor:(NSNotification *)notification{
    NSLog(@"第一界面收到第三界面的通知了");
    self.view.backgroundColor = notification.object;
}

- (void)handlePush:(UIButton *)sender{
    SecondViewController *VC =[[SecondViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
