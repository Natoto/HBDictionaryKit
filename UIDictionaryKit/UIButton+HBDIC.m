//
//  UIButton(HBDIC).m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//
#import "NSObject+HBKey.h"
#import "UIButton+HBDIC.h"
#import "UIControl+HBDIC.h"
#import "UIColor+HBKey.h"
//#import "UILabel+HBDIC.h"
@implementation UIButton(HBDIC)

-(instancetype)configwithdictionary:(NSDictionary *)plistdic
{
    if (self && plistdic && [[plistdic class] isSubclassOfClass:[NSDictionary class]]) {
        [self configcontrolwithdictionary:plistdic];
        
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, fontsize,  self.titleLabel.font = [UIFont systemFontOfSize:fontsize.floatValue?fontsize.floatValue:15])
        
        //文字
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, title, [self setTitle:title])
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, selectedTitle, [self setSelectedTitle:selectedTitle])
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, disabledTitle, [self setTitle:disabledTitle forState:UIControlStateDisabled])
        
        //颜色
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, titleColor, if(titleColor.length) [self setTitleColor:[UIColor colorWithHBKeyString:titleColor]];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, selectedTitleColor, if(selectedTitleColor.length) [self setTitleColor:[UIColor colorWithHBKeyString:selectedTitleColor] forState:UIControlStateSelected]);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, highlightedTitleColor, if(highlightedTitleColor.length) [self setTitleColor:[UIColor colorWithHBKeyString:highlightedTitleColor] forState:UIControlStateHighlighted]);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, disabledTitleColor,if(disabledTitleColor.length) [self setTitleColor:[UIColor colorWithHBKeyString:disabledTitleColor] forState:UIControlStateDisabled])
        
        //字号
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, fontsize, if(fontsize.floatValue > 0) [self setTitleFont:[UIFont systemFontOfSize:fontsize.floatValue]];)
        
        //背景颜色
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, backgroundColor, if(backgroundColor.length) [self setBackgroundImage:[UIColor colorWithHBKeyString:backgroundColor]])
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, selectBackgroundColor, if(selectBackgroundColor.length) [self setSelectBackgroundImage:[UIColor colorWithHBKeyString:selectBackgroundColor]])
        
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, highlightedBackgroundColor, if(highlightedBackgroundColor.length)  [self setBackgroundImage:[UIButton buttonImageFromColor:[UIColor colorWithHBKeyString:highlightedBackgroundColor] frame:CGRectMake(0, 0, 1, 1)] forState:UIControlStateHighlighted];)
        
        //背景图片
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, image, if(image.length) [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal])
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, selectImage,if(selectImage.length)  [self setImage:[UIImage imageNamed:selectImage] forState:UIControlStateNormal])
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, disableImage, if(disableImage.length)  [self setImage:[UIImage imageNamed:disableImage] forState:UIControlStateNormal])
        
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, showsTouchWhenHighlighted, self.showsTouchWhenHighlighted = showsTouchWhenHighlighted.boolValue)
        
    }
    return self;
}


#pragma mark 下划线
-(void)setUnderlineStyleSingle:(NSString *)text
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [self setAttributedTitle:str forState:UIControlStateNormal];
}
#pragma mark - 生成背景图
-(void)setBackgroundImage:(UIColor *)backgroundColor
{
    [self setBackgroundImage:[UIButton buttonImageFromColor:backgroundColor frame:CGRectMake(0, 0, 1, 1)] forState:UIControlStateNormal];
}

-(void)setSelectBackgroundImage:(UIColor *)backgroundColor
{
    [self setBackgroundImage:[UIButton buttonImageFromColor:backgroundColor frame:CGRectMake(0, 0, 1, 1)] forState:UIControlStateSelected];
}
-(void)setDisableBackgroundImage:(UIColor *)backgroundColor
{
    [self setBackgroundImage:[UIButton buttonImageFromColor:backgroundColor frame:CGRectMake(0, 0, 1, 1)] forState:UIControlStateDisabled];
}
#pragma mark -
-(void)setTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}
-(void)setTitleColor:(UIColor *)titlecolor
{
    [self setTitleColor:titlecolor forState:UIControlStateNormal];
}
-(void)setSelectedTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateSelected];
}

-(void)setTitleFont:(UIFont *)font
{
    self.titleLabel.font = font;
}

-(void)setlayercolor:(UIColor *)color
{
    self.layer.masksToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = 0.5;
}


-(void)setTitleSelectedColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateHighlighted];
    [self setTitleColor:color forState:UIControlStateSelected];
}


/**
 * 通过颜色生成一种纯色的图片
 */
+(UIImage *)buttonImageFromColor:(UIColor *)color frame:(CGRect)frame
{
    CGRect rect = CGRectMake(0, 0, frame.size.width, frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
