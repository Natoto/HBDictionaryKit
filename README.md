# UIDictionaryKit

# UIDictionKit 键值对编程

标签（空格分隔）： UIDictionKit key plist

---
* 键值对编程，可以用plist文件设置属性，可以用dictionary设置样式，并且用kvo监听其变化从而更新
* 使用方法 
* pod 'UIDictionaryKit', :git => 'https://github.com/Natoto/UIDictionaryKit.git'


### UIColor style ###

|KEY|TYPE|VALUE|备注|
| -| -|:-----:|:----| 
|red|||
|blue|||
|...|||

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



| KEY | TYPE | VALUE | 备注  |
| --------   | -----:  | :----:  |
|frame|  | | 
|center| | |
|backgroundColor| | |
|tag| | |
|layer| | |


### CALayer ###


|KEY|TYPE|VALUE|备注|
| --------   | -----:  | :----:  |
|direction|nsstring| left/right/top/bottom|可以用竖线分割表示多个边框|
|maskToBounds
|cornerRadius
|borderWidth
|borderColor

### UILabel style ###

|KEY|TYPE|VALUE|备注|
| --------   | -----:  | :----:  |
|font
| textColor
| shadowColor
| shadowOffset
| textAlignment
| lineBreakMode
| attributedText
| highlightedTextColor
| highlighted|
| userInteractionEnabled
| enabled
| numberOfLines
| adjustsFontSizeToFitWidth
| baselineAdjustment
| minimumScaleFactor
| allowsDefaultTighteningForTruncation
| minimumFontSize
| adjustsLetterSpacingToFitWidth


### UITextField style ###

|KEY|TYPE|VALUE|备注|
| --------   | -----:  | :----:  |
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
| -| -|:-----:|:----| 
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
| -| -|:-----:|:----| 
|onTintColor|
|tintColor|
|thumbTintColor|
|onImage|
|offImage|


---

###UISegmentControl  style

|KEY|TYPE|VALUE|备注|
| -| -|:-----:|:----| 
|items
|imageItems
|numberOfSegments
|apportionsSegmentWidthsByContent
|selectedSegmentIndex
|tintColor
|titleTextColor
|selectedTitleTextColor


* 注意：uisegmentcontrol 初始化必须是`[[UISegmentedControl alloc] initWithItems:@[@"1",@"2",@"3",@"4"]]`; 的形式不然对其赋值title或者image将不生效 并有异常抛出



