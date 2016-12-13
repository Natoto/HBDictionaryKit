# HBDictionaryKit

# HBDictionaryKit 键值对编程

标签（空格分隔）： HBDictionaryKit

---
* 键值对编程，可以用plist文件设置属性，可以用dictionary设置样式，并且用kvo监听其变化从而更新
* 使用方法 
* pod 'HBDictionaryKit', :git => 'https://github.com/Natoto/HBDictionaryKit.git'
* or
* pod 'HBDictionaryKit', :git => 'https://github.com/Natoto/HBDictionaryKit.git',:tag=>'0.1.4'

![image] (https://github.com/Natoto/HBDictionaryKit/blob/master/demo/uidictionarykit.gif?raw=true)

---
### UIView + Masnory ###

```objc
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
```
>
>支持设置方式json，或简单语句
>1.json 如{  "toviewtag": 14234, "direction": "top", "tokey": "left", "offset": 34, "multipliedBy": 0.2} 
           
>2.格式：tag.top|left|right|bottom,offset
>make.top.equalTo(to_topview.mas_top).with.offset(to_topview_offset.floatValue);



### UIColor style ###

|KEY|TYPE|VALUE|备注|
| ----| -----|:-----:|:----|
|red|NSString|红色||
|blue|NString|蓝色||
|...||||





```
static NSString * uicolor_hbkey_black = @"black";      // 0.0 white
static NSString * uicolor_hbkey_lightGray = @"lightgraycolor";  // 0.667 white
static NSString * uicolor_hbkey_white = @"white";//Color;      // 1.0 white
static NSString * uicolor_hbkey_gray = @"gray";//Color;       // 0.5 white
static NSString * uicolor_hbkey_clear = @"clear";

static NSString * uicolor_hbkey_red= @"red";//Color;        // 1.0, 0.0, 0.0 RGB
static NSString * uicolor_hbkey_green = @"green";//Color;      // 0.0, 1.0, 0.0 RGB
static NSString * uicolor_hbkey_blue=@"blue";// Color;       // 0.0, 0.0, 1.0 RGB
static NSString * uicolor_hbkey_cyan =@"cyan";// Color;       // 0.0, 1.0, 1.0 RGB
static NSString * uicolor_hbkey_yellow = @"yellow";// Color;     // 1.0, 1.0, 0.0 RGB
static NSString * uicolor_hbkey_magenta = @"magenta";//Color;    // 1.0, 0.0, 1.0 RGB
static NSString * uicolor_hbkey_orange = @"orange";//Color;     // 1.0, 0.5, 0.0 RGB
static NSString * uicolor_hbkey_purple = @"purple";//Color;     // 0.5, 0.0, 0.5 RGB
static NSString * uicolor_hbkey_brown = @"brown";//Color;      // 0.6, 0.4, 0.2 RGB
```
* 写法，如 @"red"，@"random"，@"0x112,1"
*  常用颜色直接写数字，自定义颜色用十六进制0x表示，支持alpha半透明

### UIView style ###



| KEY | TYPE | VALUE/EG | 备注  |
| ------------| -----:| -----:  | :----:  |
|frame|  nsstring|{{0,1},{100,200}} |字符串表示frame| 
|center| nsstring|{120,100} |中点
|backgroundColor| nsstring|red/random/0xee11 |背景颜色|
|tag|nsnumber |2 |
|layer|nsdictionary| layer|caclyer 字典类型|


### CALayer ###


|KEY|TYPE|VALUE|备注|
| ------------- | -----------:| -----------:  | :----:  |
|direction|nsstring| left/right/top/bottom|可以用竖线分割表示多个边框|
|maskToBounds|nsnumber|0/1||
|cornerRadius|nsnumber|10|圆角弧度|
|borderWidth|nsnumber|1|边框厚度|
|borderColor|nsstring|gray|边框颜色|

### UILabel style ###

|KEY|TYPE|VALUE|备注|
| ----------------   | -----: | -----:  | :----:  |
|fontsize|nsnumber|13|字体大小、默认字体
| textColor|nsstring|black|字体颜色|
| shadowColor|nsstring|gray|阴影|
| shadowOffset|nsstring|{1,1}|阴影偏移位置|
| textAlignment|nsstring|left/right/center| 字体的对齐方式(支持大小写)|
| lineBreakMode|nsstring|word/char/head/middle/tail|换行的方式|
| attributedText|NSAttributedString||暂不支持plist方式
| highlightedTextColor|nsstring|red,...|高亮时的颜色|
| highlighted|nsnumber|0/1|是否高亮|
| userInteractionEnabled|nsnumber|0/1|是否支持手势有touch时候注意设置
| enabled|nsnumber|0/1|是否可用
| numberOfLines|nsnumber|0/2,...|最大行数
| adjustsFontSizeToFitWidth|nsnunber|0/1|是否自动调整字体
| baselineAdjustment|nsnumber|0/1|自动调整基准线
| minimumScaleFactor|nsnumber|0.1|最小缩放字体的比例常与adjustsFontSizeToFitWidth合用
| allowsDefaultTighteningForTruncation|nsnumber|0/1|for ios9+收紧字符间距已适应截断
| minimumFontSize|nsnunber|10|最小的字体大小|
| adjustsLetterSpacingToFitWidth|nsnunmber|0/1|自适应字体间距


### UITextField style ###

|KEY|TYPE|VALUE|备注|
| ----------------  | -----:   | -----:  | :----:  |
|text
|textColor
|fontSize;
|textAlignment
|borderStyle
|placeholder
|clearsOnBeginEditing
|adjustsFontSizeToFitWidth
|minimumFontSize
|background
|disabledBackground
|clearButtonMode
|leftViewMode
|rightViewMode
|font|UIFont||plist设置时保留|
|attributedText|NSAtributedString||plist设置时保留|


### uiimageview+hdic  style ###
|KEY|TYPE|VALUE|备注|
| --------------------|-----|:-----:|:----| 
|image|nsstring|a.png
|highlightedImage|nsstring|a.png
|userInteractionEnabled|nsnumber|1/0|
|highlighted|nsnumber|1/0|
|animationImages|nstring|img1,img2,img3|逗号隔开
|highlightedAnimationImages|nsstring|a.png
|animationDuration|nsnumber|10|
|animationRepeatCount|nsnumber|0|
|tintColor|nsstring|a.png


--- 
### Switch style

|KEY|TYPE|VALUE|备注|
| ----------| ------|:-----:|:----| 
|onTintColor|
|tintColor|
|thumbTintColor|
|onImage|
|offImage|


---

###UISegmentControl  style

|KEY|TYPE|VALUE|备注|
| ------------------------|  -----: |:-----:|:----| 
|items
|imageItems
|numberOfSegments
|apportionsSegmentWidthsByContent
|selectedSegmentIndex
|tintColor
|titleTextColor
|selectedTitleTextColor


* 注意：uisegmentcontrol 初始化必须是`[[UISegmentedControl alloc] initWithItems:@[@"1",@"2",@"3",@"4"]]`; 的形式不然对其赋值title或者image将不生效 并有异常抛出



