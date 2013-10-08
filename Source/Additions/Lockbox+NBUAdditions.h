//
//  Lockbox+NBUAdditions.h
//  NBUCore
//
//  Created by Ernesto Rivera on 12/06/20.
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

#import <Lockbox/Lockbox.h>

/**
 Lockbox additions to be able to save dictionary and keys to the keychain.
 */
@interface Lockbox (NBUAdditions)

/// Save a dictionary to the Keychain.
/// @param dictionary The dictionary to save.
/// @param key The associated key.
+(BOOL)setDictionary:(NSDictionary *)dictionary
              forKey:(NSString *)key;

/// Retrieve a dictionary from the Keychain.
/// @param key The associated key.
+(NSDictionary *)dictionaryForKey:(NSString *)key;

@end

