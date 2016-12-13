//
//  UIView+Masonry.h
//  Pods
//
//  Created by Natoto on 16/12/7.
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
@property (nonatomic, strong) NSNumber * offset;      //设置偏移量
@property (nonatomic, strong) NSString * size;         //设置size
@property (nonatomic, strong) NSNumber * multipliedBy; //倍数 修饰宽高度的{"multipliedBy":1}
@property (nonatomic, strong) NSString * sizeOffset;    //用于修饰size的 小于0则默认跟父类一样 {"sizeOffset","{0,0}"}
@property (nonatomic, strong) NSString * centeroffset;  //{"centeroffset","{0,0}"}
@property (nonatomic, strong) NSString * insets;        //用于修饰edges {"insets","{0,0,0,0}"}
-(UIView *)toview;

//TAG.left,offset
+(HBViewMasonry *)getviewmasconstrains:(NSString *)direction
                             superview:(UIView *)superview
                            withstring:(NSString *)topstr;

-(MASConstraint *)hb_readconstrains:(MASConstraintMaker *)make;

@end
