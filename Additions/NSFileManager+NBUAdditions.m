//
//  NSFileManager+NBUAdditions.m
//  NBUKit
//
//  Created by 利辺羅 on 2013/03/12.
//  Copyright (c) 2013年 CyberAgent Inc. All rights reserved.
//

#import "NSFileManager+NBUAdditions.h"

@implementation NSFileManager (NBUAdditions)

- (NSArray *)URLsForFilesWithExtensions:(NSArray *)extensions
                  searchInDirectoryURLs:(NSArray *)directories
{
    NSMutableArray * fileURLs = [NSMutableArray array];
    NSMutableArray * errors = [NSMutableArray array];
    NSArray * contents;
    NSError * error;
    
    // Check every directory
    for (NSURL * directory in directories)
    {
        contents = [self contentsOfDirectoryAtURL:directory
                       includingPropertiesForKeys:nil
                                          options:NSDirectoryEnumerationSkipsHiddenFiles
                                            error:&error];
        if (error)
            [errors addObject:error];
        
        // Check every fileURL in contents
        BOOL isDirectory;
        for (NSURL * fileURL in contents)
        {
            // Skip directories
            isDirectory = NO;
            if (![self fileExistsAtPath:fileURL.path
                            isDirectory:&isDirectory] || isDirectory)
            {
                continue;
            }
            
            // No need to check extension?
            if (extensions.count == 0)
            {
                [fileURLs addObject:fileURL];
                continue;
            }
            
            // Check
            else
            {
                for (NSString * extension in extensions)
                {
                    if ([fileURL.pathExtension caseInsensitiveCompare:extension] == NSOrderedSame)
                    {
                        [fileURLs addObject:fileURL];
                        continue;
                    }
                }
            }
        }
    }
    
    if (errors.count > 0)
    {
        NBULogError(@"Some error(s) ocurred while searching searching for files with extensions %@ in directories %@. Error(s): %@",
                    extensions.shortDescription, directories, errors);
    }
    
    NBULogInfo(@"Found %d files with extensions %@", fileURLs.count, extensions.shortDescription);
    
    return fileURLs;
}

@end

