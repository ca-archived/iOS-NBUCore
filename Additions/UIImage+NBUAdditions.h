//
//  UIImage+NBUAdditions.h
//  NBUCore
//
//  Created by エルネスト 利辺羅 on 12/06/01.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 NBUCore additions to UIImage to handle cropping, resizes and image flattening.
 */
@interface UIImage (NBUAdditions)

/// @name Adjusting Orientation

/// Force an image to be orientated Up.
- (UIImage *)imageWithOrientationUp;

/// @name Resize and Cropping

/// Crop an image to a given area.
/// @param cropArea The reference area in image coordinates.
- (UIImage *)imageCroppedToRect:(CGRect)cropArea;

/// Downsize and crop an image in a way to **fill** a target pixel size.
/// @param targetSize The target size in pixels.
/// @note The resulting image is downsized to fill and areas outside the target area are discarded.
- (UIImage *)imageCroppedToFill:(CGSize)targetSize;

/// Downsize an image to **fill** a target pixel size.
/// @param targetSize The target size in pixels.
/// @note The resulting image is not cropped.
- (UIImage *)imageDonwsizedToFill:(CGSize)targetSize;

/// Downsize an image to **fit** a target pixel size.
/// @param targetSize The target size in pixels.
/// @note The resulting image is not cropped.
- (UIImage *)imageDonwsizedToFit:(CGSize)targetSize;

/// Downsize an image by a given factor.
/// @param factor The factor used to downsize where 1.0 is no downsize.
/// @note If factor is bigger or equal to 1.0 then the original image is returned.
- (UIImage *)imageDownsizedByFactor:(CGFloat)factor;

/// Flatten an image to make sure it has a CGImage backing.
- (UIImage *)imageFlattened;

/// @name Saving to Disk

/// Write image as JPEG with compression 0.8 to a given path.
/// @param path The complete target path including the desired file name and extension.
/// @return On success a valid NSURL or `nil` on failure.
- (NSURL *)writeToFile:(NSString *)path;

/// Write image to the temporary directory.
/// @return On success a valid NSURL or `nil` on failure.
- (NSURL *)writeToTemporaryDirectory;

@end

