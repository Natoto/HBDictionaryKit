//
//  Foundation+HBKey.h
//  UIDictionaryKitDemo
//
//  Created by BooB on 16/3/20.
//  Copyright © 2016年 BooB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//#define DIC_OBJ_KEY(DIC,PARA) [DIC objectForKey:PARA]
//
//#define DIC_OBJ_KEY(DIC,PARA) [DIC objectForKey:PARA]
//#define OBJ_NULL_DEFAULT(OBJ,VALUE) if (!OBJ) {\
//OBJ = VALUE;\
//}

#define OBJ_NOTNULL_(OBJ,ANDNEXTSTEP) if(!OBJ){\
@try {\
ANDNEXTSTEP;\
}\
@catch (NSException *exception) {\
NSLog(@"💔 --> 数据类型不一致，无法赋值 in %s %s %@ ",__FILE__,__FUNCTION__,exception);\
}\
@finally {\
}}


#define DIC_FOR_OBJ_NOTNULL_(DIC,OBJTYPE,OBJ,ANDNEXTSTEP){ OBJTYPE * OBJ = [DIC objectForKey:@#OBJ]; if(OBJ){\
@try {\
ANDNEXTSTEP;\
}\
@catch (NSException *exception) {\
NSLog(@"💔 --> 数据类型不一致，无法赋值 in %s %s %@ ",__FILE__,__FUNCTION__,exception);\
}\
@finally {\
}}}

@interface NSObject(HBKey)

-(NSTextAlignment )NSTextAlignmentFromString:(NSString *)string;

-(NSLineBreakMode)NSLineBreakModeFromString:(NSString *)string;
@end

@interface NSString(HBKey)

/**
 * 字符串是否存在下面的字符串中 注意：赋值时已null结尾
 */

-(BOOL)isInStrings:(NSString *)s1, ...;
@end