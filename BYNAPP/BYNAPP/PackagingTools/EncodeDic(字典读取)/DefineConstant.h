//
//  DefineConstant.h
//  OneHome
//
//  Created by 夏勇 on 16/4/7.
//  Copyright © 2016年 xiayong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>



@interface DefineConstant : NSObject



/**
 *  从字典里获取字符串对象
 *
 *  @param dic 字典
 *  @param key 需要获取值的Key
 *
 *  @return 返回一个字符对象
 */
extern NSString* EncodeStringFromDic(NSDictionary *dic, NSString *key);
/**
 *  从字典里获取NSNumber对象
 *
 *  @param dic 字典
 *  @param key 需要获取值的Key
 *
 *  @return 返回一个NSNumber对象
 */
extern NSNumber* EncodeNumberFromDic(NSDictionary *dic, NSString *key);
/**
 *  从字典里获取字典对象
 *
 *  @param dic 字典
 *  @param key 需要获取值的Key
 *
 *  @return 返回一个NSDictionary对象
 */
extern NSDictionary *EncodeDicFromDic(NSDictionary *dic, NSString *key);
/**
 *  从字典里获取数组对象
 *
 *  @param dic 字典
 *  @param key 需要获取值的Key
 *
 *  @return 返回一个NSArray对象
 */
extern NSArray *EncodeArrayFromDic(NSDictionary *dic, NSString *key);


//extern CGFloat getStringHeight:(NSString*)text withLineSpacing:(NSInteger)spacing withFont:(CGFloat)font withWidht:(CGFloat)width;


/**
 *  计算一串文字的高度
 *
 *  @param text        字符串
 *  @param lineSpacing 行距
 *  @param font        字体大小
 *  @param width       宽度
 *
 */
extern CGFloat GetStringHeight(NSString* text,NSInteger lineSpacing,CGFloat font,CGFloat width);

/**
 *  获取时间戳
 */
extern NSString * GetTimestamp(void);
/**
 *  加密
 */
extern NSString * MD5String(NSString* str);

/**
 *  校验身份证号码
 */
extern BOOL ValidateIDCardNumber(NSString* value);

@end
