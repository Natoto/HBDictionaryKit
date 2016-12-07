//
//  UIView+Masonry.h
//  Pods
//
//  Created by boob on 16/12/7.
//
//

#import <UIKit/UIKit.h>

@interface UIView(Masonry)

-(void)loadBoardMasonryLayoutWithDic:(NSDictionary *)layoutDic;
@end

@class MASConstraint;
@class MASConstraintMaker;

@interface HBViewMasonry : NSObject
@property (nonatomic, weak)     UIView * hbsuperview;
@property (nonatomic, strong) NSNumber * toviewtag;
@property (nonatomic, strong) NSString * direction;
@property (nonatomic, strong) NSString * tokey;   /* 相当于：mas_top ps: make.top.equalTo(<#view#>.mas_top).with.offset(<#num#>);   */
@property (nonatomic, strong) NSNumber * offset;
@property (nonatomic, strong) NSNumber * multipliedBy; //倍数

-(UIView *)toview;

//TAG.left,offset
+(HBViewMasonry *)getviewmasconstrains:(NSString *)direction
                             superview:(UIView *)superview
                            withstring:(NSString *)topstr;

-(MASConstraint *)hb_readconstrains:(MASConstraintMaker *)make;

@end
