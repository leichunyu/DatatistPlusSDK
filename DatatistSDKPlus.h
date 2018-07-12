//
//  DatatistSDKPlus.h
//  DatatistSDKPlusTest
//
//  Created by IOS01 on 2018/6/27.
//  Copyright © 2018年 IOS01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DatatistSDKPlus : NSObject

/**
 *  @method trackEvent
 *  统计自定义事件（可选），如购买动作
 *  @param  eventId     事件名称（自定义）
 */
+ (void)trackEvent:(NSString *)eventId;


/**
 *  @method trackEvent:label:
 *  统计带标签的自定义事件（可选），可用标签来区别同一个事件的不同应用场景
 如购买某一特定的商品
 *  @param  eventId     事件名称（自定义）
 *  @param  eventLabel  事件标签（自定义）
 */
+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel;

/**
 *  @method    trackEvent:label:parameters
 *  统计带二级参数的自定义事件，单次调用的参数数量不能超过10个
 *  @param  eventId     事件名称（自定义）
 *  @param  eventLabel  事件标签（自定义）
 *  @param  parameters  事件参数 (key只支持NSString, value支持NSString和NSNumber)
 */
+ (void)trackEvent:(NSString *)eventId
             label:(NSString *)eventLabel
        parameters:(NSDictionary *)parameters;

/**
 *  @method trackEvent:flag
 *  统计自定义事件（可选），如购买动作
 *  @param  eventId     事件名称（自定义)
 *  @param  eventFlag    0 数据发送画龙; 1 数据发送TD; 2 数据同时发送画龙和TD; (默认为2)

 */
+ (void)trackEvent:(NSString *)eventId flag:(NSInteger)eventFlag;


/**
 *  @method trackEvent:label:flag
 *  统计带标签的自定义事件（可选），可用标签来区别同一个事件的不同应用场景
 如购买某一特定的商品
 *  @param  eventId     事件名称（自定义）
 *  @param  eventLabel  事件标签（自定义）
 *  @param  eventFlag    0 数据发送画龙; 1 数据发送TD; 2 数据同时发送画龙和TD; (默认为2)
 */
+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel flag:(NSInteger)eventFlag;

/**
 *  @method    trackEvent:label:parameters:flag
 *  统计带二级参数的自定义事件，单次调用的参数数量不能超过10个
 *  @param  eventId     事件名称（自定义）
 *  @param  eventLabel  事件标签（自定义）
 *  @param  parameters  事件参数 (key只支持NSString, value支持NSString和NSNumber)
 *  @param  eventFlag    0 数据发送画龙; 1 数据发送TD; 2 数据同时发送画龙和TD; (默认为2)
 */
+ (void)trackEvent:(NSString *)eventId
             label:(NSString *)eventLabel
        parameters:(NSDictionary *)parameters
              flag:(NSInteger)eventFlag;

///**
// @method    trackPageView:ignoreUrls
//   上报没用集成JSSdk的webView的URL和title
// @param webview webView
// @param urlList 已集成JSsdk的url列表
// */
//+ (void)trackPageView:(UIWebView *)webview ignoreUrls:(NSArray<NSString *> *)urlList;

/**
 @method    trackPageView:ignoreUrls
 上报没用集成JSSdk的webView的URL和title
 @param url 要上报的url
 @param title 要上报的title
 @param urlList 已集成JSsdk的url列表
 */
+ (void)trackPageView:(NSString *)url title:(NSString *)title ignoreUrls:(NSArray<NSString *> *)urlList;

@end
