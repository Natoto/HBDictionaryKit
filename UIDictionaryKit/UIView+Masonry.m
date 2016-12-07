//
//  UIView+Masonry.m
//  Pods
//
//  Created by boob on 16/12/7.
//
//

#import "UIView+Masonry.h"
#import <Masonry/Masonry.h>
#import <CommonCrypto/CommonCrypto.h>


@implementation NSString(masnory)

/**
 *
((\w*(\s|.\w*))|\s*),(-|\s*)\w+(\s|.\d*)
 
 //匹配语法
 //toviewtag:tag.left,offset:1234
 //
 */
- (BOOL)ismasnorystring
{
    if (!self.length) {
        return  NO;
    }
    NSString *     regex4 = @"(((\\w*(\\s|\.\\w*))|\\s*),(-|\\s*)\\w*(\\s|\.\\d*))";
    
    NSString *     regex3 = @"((\\w*(\\s|\.\\w*)(\\s|\.\\w*))|\\s*),(-|\\s*)\\w*(\\s|\.\\d*)";
    
    NSPredicate *   pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex3];
    NSPredicate *   pred4 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex4];
    
    return    [pred3 evaluateWithObject:self] ||
              [pred4 evaluateWithObject:self];
}

-(BOOL)isjsonstring{

    if (!self.length) {
        return  NO;
    }
    NSError *error;
    if ([NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                        options:kNilOptions
                                          error:&error] == nil)
    {
    }
    if (!error) {
        return YES;
    }
    return NO;
}
@end

@implementation UIView(Masonry)


/**
 *  用法： tag.top|left|right|bottom,offset
 make.top.equalTo(to_topview.mas_top).with.offset(to_topview_offset.floatValue);
 */
-(void)loadBoardMasonryLayoutWithDic:(NSDictionary *)layoutDic{
    
    if (!layoutDic || ![[layoutDic class] isSubclassOfClass:[NSDictionary class]]) {
        return;
    }
    UIView * superview = [self superview];
    if (superview) {
        
        HBViewMasonry * mas_top = [HBViewMasonry getviewmasconstrains:@"top" superview:self.superview withstring:layoutDic[@"top"]];
        HBViewMasonry * mas_bottom = [HBViewMasonry getviewmasconstrains:@"bottom" superview:self.superview withstring:layoutDic[@"bottom"]];
        HBViewMasonry * mas_left = [HBViewMasonry getviewmasconstrains:@"left" superview:self.superview withstring:layoutDic[@"left"]];
        HBViewMasonry * mas_right = [HBViewMasonry getviewmasconstrains:@"right" superview:self.superview withstring:layoutDic[@"right"]];
        HBViewMasonry * mas_width = [HBViewMasonry getviewmasconstrains:@"width" superview:self.superview withstring:layoutDic[@"width"]];
        HBViewMasonry * mas_height = [HBViewMasonry getviewmasconstrains:@"height" superview:self.superview withstring:layoutDic[@"height"]];  
        if (mas_top || mas_bottom || mas_left || mas_right || mas_width || mas_right) {
            
            @try {
                [self mas_remakeConstraints:^(MASConstraintMaker *make) {
                    if (mas_top) {
                        [mas_top hb_readconstrains:make];
                    }
                    if (mas_bottom) {
                        [mas_bottom hb_readconstrains:make];
                    }
                    if (mas_left) {
                        [mas_left hb_readconstrains:make];
                    }
                    if (mas_right) {
                        [mas_right hb_readconstrains:make];
                    }
                    if (mas_width) {
                        [mas_width hb_readconstrains:make];
                    }
                    if (mas_height) {
                        [mas_height hb_readconstrains:make];
                    }
                }];
            } @catch (NSException *exception) {
                NSLog(@"hblayout: 约束出错了");
            } @finally {
                
            }
           
        }
        
    }
}
 

@end



@implementation HBViewMasonry


-(UIView *)toview{
    UIView * view = [self.hbsuperview viewWithTag:self.toviewtag.integerValue];
    if (!view) {
        view = self.hbsuperview;
    }
    return view;
}

+(HBViewMasonry *)hbviewmas:(NSString *)direction
                  superview:(UIView *)superview
                fromjsonstr:(NSString *)jsonstr {

    /*
     {
     "toviewtag": 14234,
     "direction": "top",
     "tokey": "left",
     "offset": 34,
     "multipliedBy": 0.2
     }
     */
    NSString * json = [jsonstr lowercaseString];
    NSError * error ;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    HBViewMasonry * viewobj = [HBViewMasonry new];
    viewobj.direction = direction;
    viewobj.hbsuperview = superview;
    viewobj.multipliedBy = dictionary[@"multipliedby"];
    viewobj.toviewtag = dictionary[@"toviewtag"]; //@(toviewtag.integerValue);
    viewobj.offset = dictionary[@"offset"];//@(offsetstr.floatValue);
    viewobj.tokey = dictionary[@"tokey"];//tokey;
    
    return viewobj;
}

//TAG.left,offset
+(HBViewMasonry *)getviewmasconstrains:(NSString *)direction
                          superview:(UIView *)superview
                         withstring:(NSString *)masmarkstr{
    if (!superview) {
        return nil;
    }
    if (masmarkstr.length && [masmarkstr ismasnorystring]) {
        NSString * tokey = direction;
        NSString * mulitby = @"1";
        UIView   * to_topview;
        NSString * toviewtag = @"0";
        NSArray  * compants =[masmarkstr componentsSeparatedByString:@","];
        NSString * toobj = compants[0];
        NSString * offsetstr = compants.count>1?compants[1]:@"0";
        NSNumber * to_topview_offset = [NSNumber numberWithFloat:offsetstr.floatValue];
        if (compants.count == 2) {//默认必须要有一个值
            if (!toobj.length || [toobj containsString:@"superview"]) {
                to_topview = superview;
            }
            else{
                @try {
                    NSArray * toobjcompant = [toobj componentsSeparatedByString:@"."];
                   toviewtag = toobjcompant[0];
                    if (toobjcompant.count >= 2) {//相对的位置 top,left,right,bottom
                        tokey = toobjcompant[1];
                    }
                    if (toobjcompant.count >= 3) {//倍数
                        mulitby = toobjcompant[2];
                    }
                    to_topview = [superview viewWithTag:toviewtag.integerValue];
                } @catch (NSException *exception) {
                    NSLog(@"没有该view： %@",toobj);
                } @finally {
                    
                }
            }
        }
        HBViewMasonry * viewobj = [HBViewMasonry new];
        viewobj.direction = direction;
        viewobj.hbsuperview = superview;
        viewobj.multipliedBy = @(mulitby.floatValue);
        viewobj.toviewtag = @(toviewtag.integerValue);
        viewobj.offset = @(offsetstr.floatValue);
        viewobj.tokey = tokey;
        return viewobj;
    }else if([masmarkstr isjsonstring]){
        
        HBViewMasonry * masview = [HBViewMasonry hbviewmas:direction superview:superview fromjsonstr:masmarkstr];
        return masview;
        
    }else
    {
        if (masmarkstr.length) {
            NSLog(@"\n%s \nlayout:不合法字符串：%@ \n请按照格式 eg:tag.left,offset编写\n 或者用json\n",__func__,masmarkstr);
        }
    }
    return nil;
}

-(MASConstraint *)hb_readconstrains:(MASConstraintMaker *)make {
    MASConstraint * makecons0 = [self hb_conbain_make:make forkey:self.direction];
    
    
        if ([self.direction isEqualToString:@"width"] || [self.direction isEqualToString:@"height"]) {
            
            if (self.offset.floatValue > 0) {
                MASConstraint * makecons1 = makecons0.equalTo(self.offset).multipliedBy(self.multipliedBy.floatValue);
                return  makecons1;
            }
            else{
                MASConstraint * makeconsto = makecons0.equalTo([self hb_view_mas_attr:self.toview forkey:self.tokey]).multipliedBy(self.multipliedBy.floatValue);
                return makeconsto;
            }

        }
        else{
            
            MASConstraint * makeconsto = makecons0.equalTo([self hb_view_mas_attr:self.toview forkey:self.tokey]);
            MASConstraint * makecons1 = makeconsto.offset(self.offset.floatValue);
            return  makecons1;
        }
   
    
    return make;
    
}




-(MASConstraint *)hb_conbain_make:(MASConstraintMaker *)make forkey:(NSString *)key{
    
    MASConstraint * constrain;
    if (!key) {
        return make;
    }
    if ([key isEqualToString:@"left"]) {
        constrain = make.left;
    }else if ([key isEqualToString:@"right"]) {
        constrain = make.right;
    }else if ([key isEqualToString:@"bottom"]) {
        constrain = make.bottom;
    }else if ([key isEqualToString:@"top"]) {
        constrain = make.top;
    }else if ([key isEqualToString:@"width"]) {
        constrain = make.width;
    }else if ([key isEqualToString:@"height"]) {
        constrain = make.height;
    }else if ([key isEqualToString:@"center"]) {
        constrain = make.center;
    }
    return constrain;
}

-(MASViewAttribute *)hb_view_mas_attr:(UIView *)make forkey:(NSString *)key{
    
    MASViewAttribute *constrain;
    if (!key) {
        return make;
    }
    if ([key isEqualToString:@"left"]) {
        constrain = make.mas_left;
    }else if ([key isEqualToString:@"right"]) {
        constrain = make.mas_right;
    }else if ([key isEqualToString:@"bottom"]) {
        constrain = make.mas_bottom;
    }else if ([key isEqualToString:@"top"]) {
        constrain = make.mas_top;
    }else if ([key isEqualToString:@"width"]) {
        constrain = make.mas_width;
    }else if ([key isEqualToString:@"height"]) {
        constrain = make.mas_height;
    }
    return constrain;
}

@end
