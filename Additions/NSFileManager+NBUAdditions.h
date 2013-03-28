//
//  NSFileManager+NBUAdditions.h
//  NBUKit
//
//  Created by 利辺羅 on 2013/03/12.
//  Copyright (c) 2013年 CyberAgent Inc. All rights reserved.
//

/**
 Convenience methods for file and directory handling.
 */
@interface NSFileManager (NBUAdditions)

/// Retrieve all the non-hidden, first level URLs matching a given set of extensions
/// searching among several directories.
/// @param extensions An array of file extensions.
/// @param directories An array of directories to be searched.
- (NSArray *)URLsForFilesWithExtensions:(NSArray *)extensions
                  searchInDirectoryURLs:(NSArray *)directories;

@end

