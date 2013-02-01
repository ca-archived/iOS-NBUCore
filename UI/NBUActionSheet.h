//
//  NBUActionSheet.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/11/12.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/**
 Block-based UIActionSheet subclass.
 
 @note The delegate parameter will be ignored.
 */
@interface NBUActionSheet : UIActionSheet

/// The optional block to be called if a non-cancel button is selected.
/// @note The cancel button index is ignored.
@property (nonatomic, strong) void(^selectedButtonBlock)(NSInteger buttonIndex);

/// The optional block to be called if the cancel button is selected.
@property (nonatomic, strong) void(^cancelButtonBlock)();

@end

