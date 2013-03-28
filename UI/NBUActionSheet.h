//
//  NBUActionSheet.h
//  NBUCore
//
//  Created by 利辺羅 on 2012/11/12.
//  Copyright (c) 2012年 CyberAgent Inc. All rights reserved.
//

/// Result blocks.
typedef void (^NBUActionSheetSelectedButtonBlock)(NSInteger buttonIndex);
typedef void (^NBUActionSheetCancelButtonBlock)();

/**
 Block-based UIActionSheet subclass.
 
 - Set selection and cancel actions as blocks.
 - Flexible show methods that work with different devices and orientations.
 
 @note The delegate parameter will be ignored.
 */
@interface NBUActionSheet : UIActionSheet

/// @name Creating and Configuring an Action Sheet

/// Initialize an action sheet.
/// @param title An optional title.
/// @param cancelButtonTitle An optional cancel button title. Ignored on non-iPad devices.
/// @param destructiveButtonTitle The destructive button title.
/// @param otherButtonTitles Optional additional buttons.
/// @param selectedButtonBlock The block to be called when the user chooses a non-cancel
/// button.
/// @param cancelButtonBlock The optional block to be called if the user cancels the
/// action sheet.
- (id)initWithTitle:(NSString *)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
selectedButtonBlock:(NBUActionSheetSelectedButtonBlock)selectedButtonBlock
  cancelButtonBlock:(NBUActionSheetCancelButtonBlock)cancelButtonBlock;

/// The optional block to be called if a non-cancel button is selected.
/// @note The cancel button index is ignored.
@property (nonatomic, strong) NBUActionSheetSelectedButtonBlock selectedButtonBlock;

/// The optional block to be called if the cancel button is selected.
@property (nonatomic, strong) NBUActionSheetCancelButtonBlock cancelButtonBlock;

/// @name Showing the Action Sheet

/// Show from a given view.
/// @param view The target view.
- (void)showFromView:(UIView *)view;

/// Show from a view or from a view controller.
/// @param target A UIView or UIViewController object.
- (void)showFrom:(id)target;

@end

