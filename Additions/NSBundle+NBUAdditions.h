//
//  NSBundle+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/08/13.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

extern NSString * const NBULocalizedStringNotFound;

/**
 NSBundle category to handle subbundles.
 */
@interface NSBundle (NBUAdditions)

/// Resource the full pathname of the resource searching first in the main bundle and
/// then in its subbundles.
/// @param name The name of the resource.
/// @param extension The resource's extension.
+ (NSString *)pathForResource:(NSString *)name
                       ofType:(NSString *)extension;

/// Load a Nib file trying first with the main bundle and then its subbundles.
/// @param name The name of the Nib file.
/// @param owner The owner object.
/// @param options Loading options.
+ (NSArray *)loadNibNamed:(NSString *)name
                    owner:(id)owner
                  options:(NSDictionary *)options;

/// Search for a localized string first in the mainBundle, then in the backupBundle.
/// @param key The key for the string.
/// @param value The value to return if key is `nil`.
/// @param tableName The table to search for.
/// @param bundle The bundle to search for in case the string was not found
/// in the mainBundle.
+ (NSString *)localizedStringForKey:(NSString *)key
                              value:(NSString *)value
                              table:(NSString *)tableName
                       backupBundle:(NSBundle *)bundle;

@end

