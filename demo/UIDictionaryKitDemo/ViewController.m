//
//  ViewController.m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+HBDIC.h"
#import "UIButton+HBDIC.h"
#import "ViewController2.h"
#import "HBKVOController.h"
#import "HBDirWatchdog.h"
#import "LoadSubViewViewController.h"


@interface ViewController ()
{
    HBKVOController *_KVOController1;
    UILabel * label2;
    UIButton * btn;
    HBDirWatchdog * watchDog;
}
@property(nonatomic,strong) NSMutableDictionary * btndic;
@property(nonatomic,strong) NSMutableDictionary * lbl2styledic;
@end

@implementation ViewController

-(NSDictionary *)loadplistdata:(void(^)(NSDictionary * dic))block{

    NSString * postfix = @"plist";
    NSString * directory = @"resource";
    NSString * filename = @"UIKitStyle";
#if !DEBUG && TARGET_IPHONE_SIMULATOR
    NSString *rootPath = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"projectPath"];
    NSString *scriptRootPath = [rootPath stringByAppendingPathComponent:directory];
    NSString *mainScriptPath ;
    if (postfix.length) {
        mainScriptPath = [NSString stringWithFormat:@"%@/%@.%@", scriptRootPath, filename,postfix];
    }
    else{
        mainScriptPath = [NSString stringWithFormat:@"%@/%@", scriptRootPath, filename];
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:mainScriptPath]) //如果不存在
    {
        NSLog(@"文件不存在 path:%@ \n 请确认info.plist设置一项 key:projectPath  value:$(SRCROOT)/$(TARGET_NAME)",mainScriptPath);
        return nil;
    }
    watchDog = [[HBDirWatchdog alloc] initWithPath:scriptRootPath update:^{
        if (block) {
            NSDictionary * dictionary = [NSDictionary dictionaryWithContentsOfFile:mainScriptPath];
            block(dictionary);
        }
    }];
    [watchDog start];
    if ([postfix isEqualToString:@"plist"]) {
        [self loadplistConfig:filename filepath:mainScriptPath];
    }else{
    } 
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:mainScriptPath];
    return dic;
#else
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"UIKitStyle" ofType:@"plist" inDirectory:@"resource"]];
    NSLog(@"%@",dic);
    return dic;
#endif
}
-(void)loadplistConfig:(NSString *)plistname filepath:(NSString *)filepath
{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    NSDictionary * dic = [self loadplistdata:^(NSDictionary *dictionary) {
        [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        [self configsubview:dictionary];
    }];
    [self configsubview:dic];
    //[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"UIKitStyle" ofType:@"plist"]];
    NSLog(@"%@",dic);

}

-(void)configsubview:(NSDictionary *)dic{
    
    UILabel * label1 =[UILabel new];
    label2=[UILabel new];
    UILabel * label3 =[UILabel new];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    
    NSDictionary * lblstype = [dic  objectForKey:@"UILabel"];
    [label1 configwithdictionary:lblstype];
    
    NSMutableDictionary * lbl2styledic =  [NSMutableDictionary dictionaryWithDictionary:[dic objectForKey:@"UILabel2"]];
    self.lbl2styledic = lbl2styledic;
    [self.lbl2styledic setObject:@1 forKey:@"userInteractionEnabled"];
    [label2 configwithdictionary:lbl2styledic];
    
    
    [label3 configwithdictionary:[dic objectForKey:@"UILabel3"]];
    [label1 touchEndedBlock:^(UIView *selfView) {
        NSLog(@" label1 tap");
        [self.navigationController pushViewController:[ViewController2 new] animated:YES];
    }];
    
    [self.lbl2styledic setObject:@1 forKey:@"userInteractionEnabled"];
    [label2 touchEndedBlock:^(UIView *selfView) {
//        NSLog(@" label2 tap");
//        [self.lbl2styledic setObject:[NSString stringWithFormat:@"%d",arc4random()%255] forKey:@"text"];
        
        [self.navigationController pushViewController:[LoadSubViewViewController new] animated:YES];
    }];
    
    UIView * view0 = [UIView new];
    [self.view addSubview:view0];
    [view0 configsuperwithdictionary:[dic objectForKey:@"view0"]];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    NSMutableDictionary * btndic = [NSMutableDictionary dictionaryWithDictionary:[dic objectForKey:@"button"]];
    [btn configwithdictionary:btndic];
    
    self.btndic = btndic;
    [btn touchEndedBlock:^(UIView *selfView) {
        [btndic setObject:[NSString stringWithFormat:@"%d",arc4random()%255] forKey:@"title"];
    }];
    
    [self addKVO];
}
-(void)addKVO
{
    // create KVO controller instance
    _KVOController1 = [HBKVOController controllerWithObserver:self];
    [_KVOController1  observe:self.btndic keyPaths:self.btndic.allKeys options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew  block:^(id observer,NSDictionary * dic , NSDictionary *change) {
        NSString * string =  change[NSKeyValueChangeNewKey];
        [btn configwithdictionary:dic];
    }];
    
    [_KVOController1 observe:self.lbl2styledic keyPaths:self.lbl2styledic.allKeys options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew  block:^(id observer, NSDictionary * dic, NSDictionary *change) {
        [label2 configwithdictionary:dic];
    }];
    
}

-(void)dealloc
{
    [self.btndic removeObserver:self  forKeyPath:@"title"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
