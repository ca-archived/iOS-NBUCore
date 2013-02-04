//
//  NBUConfigurationPicker.h
//  NBUCore
//
//  Created by 利辺羅 on 2013/01/23.
//  Copyright (c) 2013年 CyberAgent Inc. All rights reserved.
//

extern NSString * const NBUConfigurationName;
extern NSString * const NBUConfigurationChangedNotification;

/**
 Abstract configuration picker for switching application parameters (development, staging, etc.).
 
 - Subclasses should override the availableConfigurations method.
 - The current configuration is saved to NSUserDefaults.
 
 @warning To be used only for testing purposes.
 @warning Do not save production settings in NSUserDefaults.
 */
@interface NBUConfigurationPicker : NSObject

/// @name Methods to Override in Subclasses.

/// All the available configurations.
///
/// Each configuration should be a NSDictionay with at least one object for with the key NBUConfigurationName.
+ (NSArray *)availableConfigurations;

/// Whether changing settings requires restarting the application. Default `YES`.
+ (BOOL)requiresRestart;

/// @name Showing the Picker

/// Show the picker.
+ (void)show;

/// Create a UIButton configured to display the picker.
/// @param title The desired button title.
+ (UIButton *)pickerButtonWithTitle:(NSString *)title;

/// @name Managing the Current Configuration

/// The current configuration.
+ (NSDictionary *)currentConfiguration;

/// The current configuration's name.
+ (NSString *)currentConfigurationName;

/// Set the current configuration manually.
///
/// You can use `exit(EXIT_SUCCESS)` to terminate the application.
/// @param configuration The desired configuration.
+ (void)setCurrentConfiguration:(NSDictionary *)configuration;

/// Set the current configuration at a given index manually.
///
/// You can use `exit(EXIT_SUCCESS)` to terminate the application.
/// @param index The index of the desired configuration.
+ (void)setCurrentConfigurationAtIndex:(NSUInteger)index;

@end

