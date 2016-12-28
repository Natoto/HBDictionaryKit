//
//       _      ______
//	/\ _\ \    /\  __ \
//	\   _  \   \ \  __<
//	 \ \  \ \   \ \_____\
//	  \/   \/    \/_____/
//
//
//
//  Created by boob on 16/12/16.
//  Copyright © 2016年 BooB. All rights reserved.
//

#import "SMDSquareCell.h"
#import <HBDictionaryKit/HBDictionaryKit.h>

@interface SMDSquareCell ()
#pragma mark- as


@end

@implementation SMDSquareCell
 
 - (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier plistdic:(NSDictionary *)plistdic
 {
     self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
     if (self)
     {
         [self.contentView configwithdictionary:plistdic[@"subviews"]];
         //使用类名alloc时，在此添加初始化配置
     }
     return self;
 }
 

- (void)awakeFromNib {
    //使用xib时在此添加初始化配置
    [super awakeFromNib];
}

-(void)setcellTitle:(NSString *)title
{
    
}

-(void)setcellProfile:(NSString *)profile
{
    //    [super setcellProfile:profile];
}

-(void)setcelldictionary:(NSMutableDictionary *)dictionary
{
    [super setcelldictionary:dictionary];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //如果需要在此添加
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



#pragma mark - private
/*
 -(IBAction)buttonTap:(UIButton *)sender
 {
 if (self.delegate && [self.delegate respondsToSelector:@selector(hbtableViewCell:subView:TapWithTag:)]) {
 [self.delegate hbtableViewCell:self subView:sender TapWithTag:sender.tag];
 }
 }
 */

#pragma mark - getter / setter

/*
 +(CGFloat)heightOfCell
 {
 return 44.0
 }*/


@end
