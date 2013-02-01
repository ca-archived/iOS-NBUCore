//
//  NBUConfigurationPicker.m
//  NBUCore
//
//  Created by 利辺羅 on 2013/01/23.
//  Copyright (c) 2013年 CyberAgent Inc. All rights reserved.
//

#import "NBUConfigurationPicker.h"
#import "NBUActionSheet.h"

NSString * const NBUConfigurationName = @"NBUConfigurationName";
NSString * const NBUConfigurationChangedNotification = @"NBUConfigurationChangedNotification";

// Private class
@interface NBUConfigurationPickerButton : UIButton

@property (nonatomic) Class pickerClass;

@end

static NSDictionary * _currentConfiguration;

@implementation NBUConfigurationPicker

+(NSArray *)availableConfigurations
{
    // *** Implement in subclass ***
    return nil;
}

+ (BOOL)requiresRestart
{
    // *** Implement in subclass if needed ***
    return YES;
}

+ (NSDictionary *)currentConfiguration
{
    if (!_currentConfiguration)
    {
        _currentConfiguration = [UIApplication objectForKey:@"NBUConfigurationPickerConfiguration"];
    }
    return _currentConfiguration;
}

+ (void)setCurrentConfigurationAtIndex:(NSUInteger)index
{
    [self setCurrentConfiguration:self.availableConfigurations[index]];
}

+ (void)setCurrentConfiguration:(NSDictionary *)configuration
{
    NBULogInfo(@"Changing configuration to: %@", configuration);
    
    _currentConfiguration = configuration;
    [UIApplication setObject:configuration
                      forKey:@"NBUConfigurationPickerConfiguration"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NBUConfigurationChangedNotification
                                                        object:configuration];
}

+ (NSString *)currentConfigurationName
{
    return self.currentConfiguration[NBUConfigurationName];
}

+ (void)show
{
    NBULogTrace();
    
    NSArray * configurations = self.availableConfigurations;
    NSString * title = [NSString stringWithFormat:@"Current: %@", self.currentConfigurationName];
    NBUActionSheet * sheet = [[NBUActionSheet alloc] initWithTitle:title
                                                          delegate:nil
                                                 cancelButtonTitle:self.currentConfiguration ? @"Cancel" : nil
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:nil];
    for (NSDictionary * configuration in configurations)
    {
        [sheet addButtonWithTitle:configuration[NBUConfigurationName]];
    }
    sheet.selectedButtonBlock = ^(NSInteger buttonIndex)
    {
        NSDictionary * configuration = configurations[buttonIndex];
        self.currentConfiguration = configuration;
        
        if (![self requiresRestart])
            return;
        
        // Restart
        NSString * title = [NSString stringWithFormat:@"Set: %@", configuration[NBUConfigurationName]];
        NBUActionSheet * restartSheet = [[NBUActionSheet alloc] initWithTitle:title
                                                                     delegate:nil
                                                            cancelButtonTitle:nil
                                                       destructiveButtonTitle:@"Restart"
                                                            otherButtonTitles:nil];
        restartSheet.selectedButtonBlock = ^(NSInteger buttonIndex)
        {
            exit(EXIT_SUCCESS);
        };
        [restartSheet showInView:[UIApplication sharedApplication].keyWindow];
    };
    [sheet showInView:[UIApplication sharedApplication].keyWindow];
}

+ (UIButton *)pickerButtonWithTitle:(NSString *)title
{
    NBUConfigurationPickerButton * button = [NBUConfigurationPickerButton new];
    button.title = title;
    button.pickerClass = [self class];
    return button;
}

@end

@implementation NBUConfigurationPickerButton

@synthesize pickerClass = _pickerClass;

- (id)init
{
    self = [super init];
    if (self)
    {
        [self setTitleColor:[UIColor blueColor]
                   forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self addTarget:self
                 action:@selector(showConfigurationPicker:)
       forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (IBAction)showConfigurationPicker:(id)sender
{
    [_pickerClass show];
}

@end

