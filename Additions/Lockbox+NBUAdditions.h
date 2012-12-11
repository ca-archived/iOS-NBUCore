//
//  Lockbox+NBUAdditions.h
//  NBUCore
//
//  Created by エルネスト 利辺羅 on 12/06/20.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "Lockbox.h"

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

