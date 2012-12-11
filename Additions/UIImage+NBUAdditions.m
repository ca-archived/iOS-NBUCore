//
//  UIImage+NBUAdditions.m
//  NBUCore
//
//  Created by エルネスト 利辺羅 on 12/06/01.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

#import "UIImage+NBUAdditions.h"

// Set Logging Component
#undef RKLogComponent
#define RKLogComponent lcl_cBaseImage

@implementation UIImage (NBUAdditions)

#pragma mark - Crop

- (UIImage *)imageCroppedToRect:(CGRect)cropArea
{
    cropArea = CGRectMake(floorf(cropArea.origin.x),
                          floorf(cropArea.origin.y),
                          floorf(cropArea.size.width),
                          floorf(cropArea.size.height));
    
    UIGraphicsBeginImageContextWithOptions(cropArea.size,
                                           YES,         // Opaque
                                           self.scale); // Use image scale
    
    [self drawInRect:CGRectMake(-cropArea.origin.x,
                                -cropArea.origin.y,
                                self.size.width,
                                self.size.height)];
    UIImage * croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NBULogVerbose(@"Image %@ %@ cropped to %@ %@",
               self,
               NSStringFromCGSize(self.size),
               croppedImage,
               NSStringFromCGSize(croppedImage.size));
    
    return croppedImage;
}

- (UIImage *)imageCroppedToFill:(CGSize)targetSize
{
    CGFloat factor = MAX(targetSize.width / self.size.width,
                         targetSize.height / self.size.height);
    
    UIGraphicsBeginImageContextWithOptions(targetSize,
                                           YES,                     // Opaque
                                           self.scale);             // Use image scale
    
    [self drawInRect:CGRectMake(- (floorf(self.size.width * factor) - targetSize.width) / 2.0,
                                - (floorf(self.size.height * factor) - targetSize.width) / 2.0,
                                floorf(self.size.width * factor),
                                floorf(self.size.height * factor))];
    UIImage * croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NBULogVerbose(@"Image %@ %@ cropped to %@ %@",
               self,
               NSStringFromCGSize(self.size),
               croppedImage,
               NSStringFromCGSize(croppedImage.size));
    
    return croppedImage;
}

#pragma mark - Downsize

- (UIImage *)imageDonwsizedToFill:(CGSize)targetSize
{
    return [self imageDownsizedByFactor:MAX(targetSize.width / self.size.width,
                                            targetSize.height / self.size.height)];
}

- (UIImage *)imageDonwsizedToFit:(CGSize)targetSize
{
    return [self imageDownsizedByFactor:MIN(targetSize.width / self.size.width,
                                            targetSize.height / self.size.height)];
}

- (UIImage *)imageDownsizedByFactor:(CGFloat)factor
{
    // No need to downsize?
    if (factor >= 1.0)
        return self;
    
    // Downsize
    CGRect target = CGRectMake(0.0,
                               0.0,
                               floorf(self.size.width * factor),
                               floorf(self.size.height * factor));
    
    UIGraphicsBeginImageContextWithOptions(target.size,
                                           YES,         // Opaque
                                           self.scale); // Use image scale
    
    [self drawInRect:target];
    UIImage * downsizedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NBULogVerbose(@"Image %@ %@ downsized to %@ %@",
               self,
               NSStringFromCGSize(self.size),
               downsizedImage,
               NSStringFromCGSize(downsizedImage.size));
    
    return downsizedImage;
}

#pragma mark - Flatten

- (UIImage *)imageFlattened
{
    UIGraphicsBeginImageContextWithOptions(self.size,
                                           YES,         // Opaque
                                           self.scale); // Use image scale
    
    [self drawInRect:CGRectMake(0.0,
                                0.0,
                                self.size.width,
                                self.size.height)];
    UIImage * flattenedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NBULogVerbose(@"Image %@ %@ flattened to %@ %@",
               self,
               NSStringFromCGSize(self.size),
               flattenedImage,
               NSStringFromCGSize(flattenedImage.size));
    
    return flattenedImage;
}

#pragma mark - Save to Disk

- (NSURL *)writeToFile:(NSString *)path
{
    // Success?
    NSError * error;
    if ([UIImageJPEGRepresentation(self, 0.8) writeToFile:path
                                                  options:NSDataWritingAtomic
                                                    error:&error])
    {
        NSURL * url = [NSURL fileURLWithPath:path];
        NBULogInfo(@"Image saved to: %@", url);
        return url;
    }
    // Failure
    else
    {
        NBULogError(@"Error saving to file '%@': %@", path, error);
        return nil;
    }
}

- (NSURL *)writeToTemporaryDirectory
{
    // Find a suitable path
    NSFileManager * manager = [NSFileManager new];
    NSString * directory = [NSTemporaryDirectory() stringByStandardizingPath];
    NSString * path;
    NSUInteger i = 1;
    do
    {
        path = [NSString stringWithFormat:@"%@/image%03d.jpg", directory, i++];
    }
    while ([manager fileExistsAtPath:path]);
    
    // Write it
    return [self writeToFile:path];
}

// From: http://stackoverflow.com/questions/5427656/ios-uiimagepickercontroller-result-image-orientation-after-upload
- (UIImage *)imageWithOrientationUp
{
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

@end

