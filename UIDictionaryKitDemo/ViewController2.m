//
//  ViewController2.m
//  UIDictionaryKitDemo
//
//  Created by zeno on 16/3/21.
//  Copyright © 2016年 BooB. All rights reserved.
//

#import "ViewController2.h"
#import "UIViewController+HBDIC.h"
#import "UIImageView+HBDIC.h"
#import "HBKVOController.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary * plistdic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"UIKitStyle" ofType:@"plist"]];
    [self configcontrolwithdictionary:[plistdic objectForKey:@"viewcontroller2"]];
    
    UIImageView * imgview = [UIImageView new];
    [self.view addSubview:imgview];
    [imgview configcontrolwithdictionary:[plistdic objectForKey:@"imageview"]];
    
    
    
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