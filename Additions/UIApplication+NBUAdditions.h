//
//  UIApplication+NBUAdditions.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/07/26.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 Convenience UIApplication methods.
 
 - Retrieve application version and build information.
 - Get the documents and caches directories.
 */
@interface UIApplication (NBUAdditions)

/// @name Application Properties

/// Convenience method to retrive the application display name.
@property (nonatomic, readonly) NSString * applicationName;

/// Convinience method to retrive the application version.
@property (nonatomic, readonly) NSString * applicationVersion;

/// Convinience method to retrive the application build.
@property (nonatomic, readonly) NSString * applicationBuild;

/// Convinience method to retrive the application documents directory.
@property (nonatomic, readonly) NSURL * documentsDirectory;

/// Convinience method to retrive the application caches directory.
@property (nonatomic, readonly) NSURL * cachesDirectory;

/// @name Set/Get Values in NSDefaults/Keychain

/// Retrieve a saved object from NSUserDefaults.
/// @param key The associated key.
/// @return An NSData, NSString, NSNumber, NSDate, NSArray, NSDictionary or nil@ object.
+ (id)objectForKey:(NSString *)key;

/// Save an object in NSUserDefaults.
/// @param object An NSData, NSString, NSNumber, NSDate, NSArray, or NSDictionary object.
/// @param key The associated key.
+ (void)setObject:(id)object
           forKey:(NSString *)key;

/// Retrieve a saved object from the device Keychain.
/// @note For now limited to strings.
/// @param key The associated key.
/// @return An NSString object.
+ (id)secureObjectForKey:(NSString *)key;

/// Save an object in the device Keychain.
/// @note For now limited to strings.
/// @param object A NSString object.
/// @param key The associated key.
+ (void)setSecureObject:(id)object
                 forKey:(NSString *)key;

@end

