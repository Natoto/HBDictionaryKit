//
//  ViewController.m
//  UIDictionaryKitDemo
//
//  Created by BooB on 16/3/20.
//  Copyright © 2016年 BooB. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+HBDIC.h"
#import "UIButton+HBDIC.h"
#import "ViewController2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel * label1 =[UILabel new];
    UILabel * label2=[UILabel new];
    UILabel * label3 =[UILabel new];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"UIKitStyle" ofType:@"plist"]];
    NSLog(@"%@",dic);
    NSDictionary * lblstype = [dic  objectForKey:@"UILabel"];
    [label1 configwithdictionary:lblstype];
    [label2 configwithdictionary:[dic objectForKey:@"UILabel2"]];
    [label3 configwithdictionary:[dic objectForKey:@"UILabel3"]];
    
    [label1 touchEndedBlock:^(UIView *selfView) {
        NSLog(@" label1 tap");
        [self.navigationController pushViewController:[ViewController2 new] animated:YES];
    }];
    
    UIView * view0 = [UIView new];
    [self.view addSubview:view0];
    [view0 configsuperwithdictionary:[dic objectForKey:@"view0"]];

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn configwithdictionary:[dic objectForKey:@"button"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
