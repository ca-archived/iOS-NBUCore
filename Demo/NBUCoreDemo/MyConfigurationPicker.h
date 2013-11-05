//
//  MyConfigurationPicker.h
//  NBUCoreDemo
//
//  Created by Ernesto Rivera on 2013/01/30.
//  Copyright (c) 2013 CyberAgent Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

// *** Optionally add this file to the target's prefix file ***

// Production settings
#define	ProductionConfigurationName         @"Production"
#define	ProductionConnectionServer          @"cyberagent.co.jp"
#define ProductionConnectionAPIServer       @"api.cyberagent.co.jp"
#define ProductionConnectionProtocol        @"https"
#define	ProductionConnectionToken           @"9324982-1-0029384"
#define ProductionAnotherGlobalParameter    @[@"Anything that you can save", @"to NSUserDefaults"]

// Settings for non DEBUG/TESTING builds
#if !defined (DEBUG) &&  !defined (TESTING)

    #define	ConfigurationName			ProductionConfigurationName
    #define	ConnectionServer			ProductionConnectionServer
    #define ConnectionAPIServer         ProductionConnectionAPIServer
    #define ConnectionProtocol          ProductionConnectionProtocol
    #define	ConnectionToken             ProductionConnectionToken
    #define AnotherGlobalParameter      ProductionAnotherGlobalParameter

// Settings for DEBUG/TESTING builds
#else

    // *** You need your own NBUConfigurationPicker subclass! ***
    @interface MyConfigurationPicker : NBUConfigurationPicker

    // Convenience methods
    + (NSString *)server;
    + (NSString *)apiServer;
    + (NSString *)protocol;
    + (NSString *)token;
    + (NSArray *)anotherParameter;

    @end

    #define	ConfigurationName			MyConfigurationPicker.currentConfigurationName
    #define	ConnectionServer			MyConfigurationPicker.server
    #define ConnectionAPIServer         MyConfigurationPicker.apiServer
    #define ConnectionProtocol          MyConfigurationPicker.protocol
    #define	ConnectionToken             MyConfigurationPicker.token
    #define AnotherGlobalParameter      MyConfigurationPicker.anotherParameter

#endif

