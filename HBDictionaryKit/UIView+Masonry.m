//
//  UIView+Masonry.m
//  Pods
//
//  Created by Natoto on 16/12/7.
//
//

#import "UIView+Masonry.h"
#import <Masonry/Masonry.h>
#import <CommonCrypto/CommonCrypto.h>
#import <objc/runtime.h>

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
        HBViewMasonry * mas_size = [HBViewMasonry getviewmasconstrains:@"size" superview:self.superview withstring:layoutDic[@"size"]];
        HBViewMasonry * mas_edges = [HBViewMasonry getviewmasconstrains:@"edges" superview:self.superview withstring:layoutDic[@"edges"]];
        HBViewMasonry * mas_center = [HBViewMasonry getviewmasconstrains:@"center" superview:self.superview withstring:layoutDic[@"center"]];
        
        if (mas_top || mas_bottom || mas_left || mas_right || mas_width || mas_right || mas_size || mas_edges || mas_center) {
            
            @try {
                [self mas_remakeConstraints:^(MASConstraintMaker *make) {
                    if (mas_top) {
                        [mas_top hb_readconstrains:make];
                    }
                    if (mas_center) {
                        [mas_center hb_readconstrains:make];
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
                    if (mas_edges) {
                        [mas_edges hb_readconstrains:make];
                    }
                    if (mas_size) {
                        [mas_size hb_readconstrains:make];
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
/**
 * 通过json设置
 */
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
    
    NSString * sizeOffsetstr = dictionary[@"sizeoffset"];
    viewobj.sizeOffset = sizeOffsetstr? sizeOffsetstr: @"{0,0}";
   
    NSString * centeroffsetstr = dictionary[@"centeroffset"];
    viewobj.centeroffset = centeroffsetstr?centeroffsetstr: @"{0,0}";
 
    NSString * insetsstr = dictionary[@"insets"];
    viewobj.insets = insetsstr?insetsstr:@"{0,0,0,0}";
    
    NSString * sizestr = dictionary[@"size"];
    viewobj.size = sizestr;
    return viewobj;
}

/**
 * 创建自定义约束类
 */
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

/**
 * 设置约束 放到make block 里面
 */
-(MASConstraint *)hb_readconstrains:(MASConstraintMaker *)make {
    
    NSLog(@"\n\n %s --> desc \n%@ ",__func__,self.description);
    MASConstraint * makecons0 = [self hb_conbain_make:make forkey:self.direction];
    
        if ([self.direction isEqualToString:@"width"] || [self.direction isEqualToString:@"height"]) {
            
            if (self.offset.floatValue > 0) {
                MASConstraint * makecons1 = makecons0.equalTo(self.offset).multipliedBy(self.multipliedBy.floatValue);
                return  makecons1;
            }
            else{
                MASConstraint * makecons_to = makecons0.equalTo([self hb_view_mas_attr:self.toview forkey:self.tokey]).multipliedBy(self.multipliedBy.floatValue);
                return makecons_to;
            }

        }
        else if([self.direction isEqualToString:@"size"]){
            
            CGSize offsetsize = CGSizeFromString(self.sizeOffset);
            MASConstraint * makecons_to;
            if (self.size) {
                CGSize size = CGSizeFromString(self.size);
                size.width = size.width>0?size.width:(self.toview.frame.size.width + size.width);
                size.height = size.height>0?size.height:(self.toview.frame.size.height + size.height);
                makecons_to = makecons0.mas_equalTo(size);
            }else{
                makecons_to = makecons0.equalTo([self hb_view_mas_attr:self.toview forkey:self.tokey]).sizeOffset(offsetsize);
            }
            return makecons_to;
        }
        else if([self.direction isEqualToString:@"center"]){
            CGPoint offsetsize = CGPointFromString(self.centeroffset);
            MASConstraint * makecons_to = makecons0.equalTo([self hb_view_mas_attr:self.toview forkey:self.tokey]).centerOffset(offsetsize);
            return makecons_to;
        }
        else if([self.direction isEqualToString:@"edges"]){
            
            UIEdgeInsets  insets = UIEdgeInsetsFromString(self.insets);
            MASConstraint * makecons_to = makecons0.equalTo([self hb_view_mas_attr:self.toview forkey:self.tokey]).insets(insets);
//            MASConstraint * makecons_to = make.edges.equalTo(self.toview);
            return makecons_to;
        }
        else{
            
            MASConstraint * makecons_to = makecons0.equalTo([self hb_view_mas_attr:self.toview forkey:self.tokey]);
            MASConstraint * makecons1 = makecons_to.offset(self.offset.floatValue);
            return  makecons1;
        }
   
    
    return make;
    
}




-(MASConstraint *)hb_conbain_make:(MASConstraintMaker *)make forkey:(NSString *)key{
    
    MASConstraint * constrain = make;
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
    }else if ([key isEqualToString:@"edges"]) {
        constrain = make.edges;
    }else if ([key isEqualToString:@"size"]) {
        constrain = make.size;
    }
    return constrain;
}

-(MASViewAttribute *)hb_view_mas_attr:(UIView *)make forkey:(NSString *)key{
    
    MASViewAttribute *constrain = make;
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



- (NSString *)description
{
    NSMutableString * desc = [NSMutableString string];
    
    Class rootClass = [self class];
    
//    for ( Class clazzType = [self class];; )
//    {
        Class clazzType = [self class];
        unsigned int		propertyCount = 0;
        objc_property_t *	properties = class_copyPropertyList( clazzType, &propertyCount );
        
        for ( NSUInteger i = 0; i < propertyCount; i++ )
        {
            const char *	name = property_getName(properties[i]);
            NSString *		propertyName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            NSObject *		propertyValue = [self valueForKey:propertyName];
            if([propertyName description])
                [desc appendString:[propertyName description]];
            [desc appendString:@":"];
            
            if(propertyValue && [propertyValue description])
                [desc appendString:[propertyValue description]];
            [desc appendString:@"\n"];
        }
        
        free( properties );
        
//        clazzType = class_getSuperclass( clazzType );
//        if ( nil == clazzType )
//            break;
    
//        if ( clazzType == rootClass )
//            break;
//    }
    
    return desc; //[super description];
}


@end
