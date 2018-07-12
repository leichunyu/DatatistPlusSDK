//
//  DatatistSDKPlus.m
//  DatatistSDKPlusTest
//
//  Created by IOS01 on 2018/6/27.
//  Copyright © 2018年 IOS01. All rights reserved.
//

#import "DatatistSDKPlus.h"
#import "TalkingData.h"
#import "DatatistTracker.h"

@implementation DatatistSDKPlus

+ (void)trackEvent:(NSString *)eventId
{
    [self trackEvent:eventId label:nil parameters:nil flag:2];
}

+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel
{
    [self trackEvent:eventId label:eventLabel parameters:nil flag:2];
}

+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel parameters:(NSDictionary *)parameters
{
    [self trackEvent:eventId label:eventLabel parameters:parameters flag:2];
}

+ (void)trackEvent:(NSString *)eventId flag:(NSInteger)eventFlag
{
    [self trackEvent:eventId label:nil parameters:nil flag:eventFlag];
}

+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel flag:(NSInteger)eventFlag
{
    [self trackEvent:eventId label:eventLabel parameters:nil flag:eventFlag];
}

+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel parameters:(NSDictionary *)parameters flag:(NSInteger)eventFlag
{
    @try{
        // eventId为空，直接退出
        if (!eventId || eventId.length == 0)
        {
            return;
        }
        
        //把eventLabel 加入到 parameters，用于上报画龙
        NSMutableDictionary *datatistDic_M;
        if (parameters)
        {
            datatistDic_M =  [NSMutableDictionary dictionaryWithDictionary:parameters];
        }
        else
        {
            datatistDic_M =  [NSMutableDictionary dictionary];
        }
        
        if (eventLabel && [eventLabel isKindOfClass:[NSString class]] && eventLabel.length > 0)
        {
            [datatistDic_M setObject:eventLabel forKey:@"eventLabel"];
        }
        
        
        if (eventFlag == 0)
        {
            [[DatatistTracker sharedInstance] trackEvent:eventId udVariable:[NSDictionary dictionaryWithDictionary:datatistDic_M]];
            
        }else if (eventFlag == 1)
        {
            [TalkingData trackEvent:eventId label:eventLabel parameters:parameters];
        }else if (eventFlag == 2)
        {
            [TalkingData trackEvent:eventId label:eventLabel parameters:parameters];
            [[DatatistTracker sharedInstance] trackEvent:eventId udVariable:[NSDictionary dictionaryWithDictionary:datatistDic_M]];
        }
    }@catch (NSException *exception)
    {
        NSLog(@"崩溃信息:%@,%@",exception.reason,exception.userInfo.description);
    }
}

//+ (void)trackPageView:(UIWebView *)webview ignoreUrls:(NSArray<NSString *> *)urlList
//{
//    @try{
//        NSString *currentURL = [webview stringByEvaluatingJavaScriptFromString:@"document.location.href"];
//        NSString *title = [webview stringByEvaluatingJavaScriptFromString:@"document.title"];
//
//        __block BOOL ignore = NO;
//        [urlList enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            if ([currentURL rangeOfString:obj].length > 0)
//            {
//                ignore = YES;
//            }
//        }];
//        if (ignore)
//        {
//            return;
//        }
//        else
//        {
//            [[DatatistTracker sharedInstance] trackPageView:currentURL title:title udVariable:nil];
//        }
//    }@catch (NSException *exception)
//    {
//        NSLog(@"崩溃信息:%@,%@",exception.reason,exception.userInfo.description);
//    }
//}
+ (void)trackPageView:(NSString *)url title:(NSString *)title ignoreUrls:(NSArray<NSString *> *)urlList
{
    @try{
//        NSString *currentURL = [webview stringByEvaluatingJavaScriptFromString:@"document.location.href"];
//        NSString *title = [webview stringByEvaluatingJavaScriptFromString:@"document.title"];
        if (url == nil || url.length == 0)
        {
            return;
        }
        if (!title)
        {
            title = @"";
        }
        __block BOOL ignore = NO;
        [urlList enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([url rangeOfString:obj].length > 0)
            {
                ignore = YES;
            }
        }];
        if (ignore)
        {
            return;
        }
        else
        {
//            [[DatatistTracker sharedInstance] trackPageView:url title:title udVariable:nil];
            [[DatatistTracker sharedInstance] trackJSEvent:@{@"url":url,@"title":title,@"eventName":@"pageview"}];
        }
    }@catch (NSException *exception)
    {
        NSLog(@"崩溃信息:%@,%@",exception.reason,exception.userInfo.description);
    }
}
@end
