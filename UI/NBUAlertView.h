//
//  NBUAlertView.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/10/31.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 Block-based UIAlertView subclass.
 
 @note The delegate parameter will be ignored.
 */
@interface NBUAlertView : UIAlertView

/// The optional block to be called if a non-cancel button is selected.
/// @note The cancel button may have the index `0`.
@property (nonatomic, strong) void(^selectedButtonBlock)(NSInteger buttonIndex);

/// The optional block to be called if the cancel button is selected.
@property (nonatomic, strong) void(^cancelButtonBlock)();

@end

