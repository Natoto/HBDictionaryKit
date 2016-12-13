//
//  LoadSubViewViewController.m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/12/7.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "LoadSubViewViewController.h"
#import "HBDirWatchdog.h"
#import <HBDictionaryKit/HBDictionaryKit.h>

@interface LoadSubViewViewController ()
{
    HBDirWatchdog * watchDog;
}
@end

@implementation LoadSubViewViewController

-(NSDictionary *)loadplistdata:(void(^)(NSDictionary * dic))block{
    
    NSString * postfix = @"plist";
    NSString * directory = @"resource";
    NSString * filename = @"LoadSubViewViewController";
#if DEBUG && TARGET_IPHONE_SIMULATOR
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
    }else{
    }
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:mainScriptPath];
    return dic;
#else
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"UIKitStyle" ofType:@"plist"]];
    NSLog(@"%@",dic);
    return dic;
#endif
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary * dic = [self loadplistdata:^(NSDictionary *dictionary) {
        [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        [self configsubview:dictionary];
    }];
    [self configsubview:dic];
    // Do any additional setup after loading the view.
}
-(void)configsubview:(NSDictionary *)dictionary{
 
    [self.view configwithdictionary:dictionary];
    
//    NSArray * subviewsDic = dictionary[@"subviews"];
//    [subviewsDic enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        Class cls = NSClassFromString(obj[@"class"]);
//        UIView *view = [[cls alloc] init];
//        NSNumber * tag = obj[@"tag"];
//        view.tag = tag.integerValue;
//        [self.view addSubview:view];
//        [view configwithdictionary:obj];
//    }];
    
    self.view.backgroundColor = [UIColor colorWithHBKeyString:dictionary[@"backgroundcolor"]];
    self.title = dictionary[@"title"];
    
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
