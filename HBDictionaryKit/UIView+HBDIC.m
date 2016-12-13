//
//  UIView+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UIView+HBDIC.h"
#import "NSObject+HBKey.h"
#import "UIColor+HBKey.h"
#import "CALayer+HBDIC.h"
#import <objc/runtime.h>
#import "UIView+Masonry.h"

@implementation UIView(HBDIC)

static const void *HBView_Dictionary = &HBView_Dictionary;

-(void)sethbview_dictionary:(NSDictionary *)dictionary{
    objc_setAssociatedObject(self, HBView_Dictionary, dictionary, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSDictionary *)hbview_dictionary{
    NSDictionary * dictionary = objc_getAssociatedObject(self, HBView_Dictionary);
    return dictionary;
}


-(instancetype)configsuperwithdictionary:(NSDictionary *)plistdic
{
    NSLog(@"%s",__func__);
    if (self && plistdic && [[plistdic class] isSubclassOfClass:[NSDictionary class]]) {
        
        [self sethbview_dictionary:plistdic];
        //CGRectFromString 将String转成CGRect  {{x,y},{w, h}}
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, frame, if(frame.length){self.frame = CGRectFromString(frame);});
        //CGPointFromString 将String转成CGPoint 如 @”{3.0,2.5}”    {x,y}
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, center, if(center.length){self.center = CGPointFromString(center);});
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, backgroundColor, self.backgroundColor = [UIColor colorWithHBKeyString:backgroundColor];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, tag, if(tag.integerValue){self.tag = tag.integerValue;})
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, clipsToBounds, if(clipsToBounds.integerValue){self.clipsToBounds = clipsToBounds.boolValue;})
        
        
        NSDictionary * layerdic = [plistdic objectForKey:@"layer"];
        [self loadBoardLayerWithLayerDic:layerdic];
        NSDictionary * layoutdic = [plistdic objectForKey:@"Masonry"];
        [self loadBoardMasonryLayoutWithDic:layoutdic];
        
        NSArray * subviews = [plistdic objectForKey:@"subviews"];
        [self loadsubviewsWithDic:subviews];
    }
    return self;
}

-(void)loadsubviewsWithDic:(NSArray *)subviewsDic{
    
    NSLog(@"__%s__",__func__);
    if (!subviewsDic) {
        return;
    }
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [subviewsDic enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"uidictionkit: addsubview ~~");
        NSString * clsstr = obj[@"class"];
        Class cls = NSClassFromString(obj[@"class"]);
        if (!cls) {
            cls = NSClassFromString(@"UIView");
        }
        UIView *view = [[cls alloc] init];
        
        if ([clsstr isEqualToString:@"UIButton"]) {
            view = [UIButton buttonWithType:UIButtonTypeCustom];
        }
        [view sethbview_dictionary:obj];
        NSNumber * tag = obj[@"tag"];
        view.tag = tag.integerValue;
        [self addSubview:view];
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary * dic = [obj hbview_dictionary];
            [obj configwithdictionary:dic];
        }];
    });


}


// @{@"direction":@"left|right|top|bottom"};
-(void)loadBoardLayerWithLayerDic:(NSDictionary *)layerdic
{
    if (!layerdic || ![[layerdic class] isSubclassOfClass:[NSDictionary class]]) {
        return;
    }
    //字典 direction left top bottom right all
    NSString *direction = [layerdic objectForKey:@"direction"];
    CGFloat  aborderWidth;
    UIColor  * clor;
    DIC_FOR_OBJ_NOTNULL_(layerdic, NSNumber, borderWidth, aborderWidth = borderWidth.floatValue;);
    DIC_FOR_OBJ_NOTNULL_(layerdic, NSString, borderColor, clor = [UIColor colorWithHBKeyString:borderColor];);
    if (direction && direction.length) {
        if ([direction containsString:@"left"]) {
            [self addLeftBorderWithColor:clor andWidth:aborderWidth];
        }
        
        if([direction containsString:@"right"])
        {
            [self addRightBorderWithColor:clor andWidth:aborderWidth];
        }
        
        if([direction containsString:@"top"])
        {
            [self addTopBorderWithColor:clor andWidth:aborderWidth];
        }
        
        if([direction containsString:@"bottom"]){
            [self addBottomBorderWithColor:clor andWidth:aborderWidth];
        }
    }
    else
    {
        [self.layer configwithdictionary:layerdic];
    }
}

-(instancetype)configwithdictionary:(NSDictionary *)plistdic;
{
    return [self configsuperwithdictionary:plistdic];
}

- (void)ClipSquareViewToRound
{
    if (self.frame.size.width == self.frame.size.height)
    {
        self.layer.cornerRadius = self.frame.size.width/2;
    }
}

- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
   
    UIView *border = [self viewWithTag:0x321];
    if (!border) {
        border = [UIView new];
        border.tag = 0x321;
        [self addSubview:border];
    }
    border.backgroundColor = color;
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
 
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [self viewWithTag:0x322];
    if (!border) {
        border = [UIView new];
        border.tag = 0x322;
        [self addSubview:border];
    }
    border.backgroundColor = color;
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
 
}

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [self viewWithTag:0x320];
    if (!border) {
        border = [UIView new];
        border.tag = 0x320;
        [self addSubview:border];
    }
    
    border.backgroundColor = color;
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
}

- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [self viewWithTag:0x323];
    if (!border) {
        border = [UIView new];
        border.tag = 0x323;
        [self addSubview:border];
    }
    border.backgroundColor = color;
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
   
}


#pragma mark -handel action

static const void *HBTouchEndedViewBlockKey = &HBTouchEndedViewBlockKey;
static const void *HBTouchLongPressEndedViewBlockKey = &HBTouchLongPressEndedViewBlockKey;

- (void)touchEndedBlock:(void (^)(UIView *selfView))block
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                             action:@selector(touchEndedGesture)];
    tapped.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapped];
    objc_setAssociatedObject(self, HBTouchEndedViewBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)touchEndedGesture
{
    void(^_touchBlock)(UIView *selfView) = objc_getAssociatedObject(self, HBTouchEndedViewBlockKey);
    if (_touchBlock) {
        _touchBlock(self);
    }
}

-(void)longPressEndedBlock:(void (^)(UIView *selfView))block
{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressEndedGesture:)];
    longPress.minimumPressDuration = 0.5;
    [self addGestureRecognizer:longPress];
    objc_setAssociatedObject(self, HBTouchLongPressEndedViewBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)longPressEndedGesture:(UIGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        void(^_touchBlock)(UIView *selfView) = objc_getAssociatedObject(self, HBTouchLongPressEndedViewBlockKey);
        if (_touchBlock) {
            _touchBlock(self);
        }
    }
}

@end
