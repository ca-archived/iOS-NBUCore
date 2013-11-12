//
//  NBULog+NBUCore.m
//  NBUCore
//
//  Created by Ernesto Rivera on 2013/11/12.
//  Copyright (c) 2012-2013 CyberAgent Inc.
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

#import "NBULog+NBUCore.h"
#import "NBUCorePrivate.h"
#import "NBULogContextDescription.h"

static int _coreLogLevel;

@implementation NBULog (NBUCore)

+ (void)load
{
    // Default levels
    [self setCoreLogLevel:LOG_LEVEL_DEFAULT];
    
    // Register the NBUCore log context
    [NBULog registerContextDescription:[NBULogContextDescription descriptionWithName:@"NBUCore"
                                                                             context:NBUCORE_LOG_CONTEXT
                                                                     modulesAndNames:nil
                                                                   contextLevelBlock:^{ return [NBULog coreLogLevel]; }
                                                                setContextLevelBlock:^(int level) { [NBULog setCoreLogLevel:level]; }
                                                          contextLevelForModuleBlock:NULL
                                                       setContextLevelForModuleBlock:NULL]];
}

+ (int)coreLogLevel
{
    return _coreLogLevel;
}

+ (void)setCoreLogLevel:(int)LOG_LEVEL_XXX
{
#ifdef DEBUG
    _coreLogLevel = LOG_LEVEL_XXX == LOG_LEVEL_DEFAULT ? LOG_LEVEL_INFO : LOG_LEVEL_XXX;
#else
    _coreLogLevel = LOG_LEVEL_XXX == LOG_LEVEL_DEFAULT ? LOG_LEVEL_WARN : LOG_LEVEL_XXX;
#endif
}

@end

