//
//  MyConfigurationPicker.m
//  NBUCoreDemo
//
//  Created by 利辺羅 on 2013/01/30.
//  Copyright (c) 2013年 CyberAgent Inc. All rights reserved.
//

#ifndef PRODUCTION

#import "MyConfigurationPicker.h"

@implementation MyConfigurationPicker

+ (BOOL)requiresRestart
{
    return NO;
}

// ** Required method **
+ (NSArray *)availableConfigurations
{
    return @[
             
             // Development
             @{
                 NBUConfigurationName           : @"Development",
                 @"server"                      : @"localhost:80",
                 @"apiServer"                   : @"api.localhost:80",
                 @"protocol"                    : @"http",
                 @"token"                       : @"1234",
                 @"anotherParameter"            : @[@"An", @"array"]
                 },
             
             // Staging
             @{
                 NBUConfigurationName           : @"Staging",
                 @"server"                      : @"stg.cyberagent.co.jp",
                 @"apiServer"                   : @"stg.api.cyberagent.co.jp",
                 @"protocol"                    : @"https",
                 @"token"                       : @"834-234982-34",
                 @"anotherParameter"            : @[@"Another", @"array"]
                 },
             
             // Production
             @{
                 NBUConfigurationName           : ProductionConfigurationName,
                 @"server"                      : ProductionConnectionServer,
                 @"apiServer"                   : ProductionConnectionAPIServer,
                 @"protocol"                    : ProductionConnectionProtocol,
                 @"token"                       : ProductionConnectionToken,
                 @"anotherParameter"            : ProductionAnotherGlobalParameter
                 },
             
             ];
}

+ (NSString *)server
{
    return self.currentConfiguration[@"server"];
}

+ (NSString *)apiServer
{
    return self.currentConfiguration[@"apiServer"];
}

+ (NSString *)protocol
{
    return self.currentConfiguration[@"protocol"];
}

+ (NSString *)token
{
    return self.currentConfiguration[@"token"];
}

+ (NSArray *)anotherParameter
{
    return self.currentConfiguration[@"anotherParameter"];
}

@end

#endif

