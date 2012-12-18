//
//  NBUDashboardLogger.m
//  NBUCore
//
//  Created by 利辺羅 on 2012/12/17.
//
//

#import "NBUDashboardLogger.h"

static NBUDashboardLogger * _sharedInstance;

@interface NBUDashboardLogger (Private) <UITableViewDelegate, UITableViewDataSource>

@end

@implementation NBUDashboardLogger
{
    UIWindow * _keyWindow;
    UIWindow * _logWindow;
    UIFont * _font;
    CGFloat _fontSize;
    NSMutableArray * _messages;
    NSArray * _messagesBuffer;
    NSUInteger _maxMessages;
    BOOL _updateScheduled;
    NSTimeInterval _minIntervalToUpdate;
    NSDate * _lastUpdate;
}
@synthesize tableView = _tableView;

+ (NBUDashboardLogger *)sharedInstance
{
    if (!_sharedInstance)
    {
        _sharedInstance = [NBUDashboardLogger new];
    }
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _maxMessages = 100;
        _messages = [NSMutableArray arrayWithCapacity:_maxMessages];
        _fontSize = 13.0;
        _font = [UIFont systemFontOfSize:_fontSize];
        _lastUpdate = [NSDate date];
        _minIntervalToUpdate = 0.5;
    }
    return self;
}

- (IBAction)toggle:(UIButton *)sender
{
    BOOL wasSelected = sender.selected;
    sender.selected = !wasSelected;
    
    if (wasSelected)
    {
        [self minimizeAnimated:YES];
        [_tableView scrollToTopAnimated:YES];
    }
    else
    {
        [self maximizeAnimated:YES];
    }
}

- (void)maximizeAnimated:(BOOL)animated
{
    [UIView animateWithDuration:animated ? 0.2 : 0.0
                     animations:^
     {
         _logWindow.frame = _keyWindow.bounds;
     }];
}

- (void)minimizeAnimated:(BOOL)animated
{
    [UIView animateWithDuration:animated ? 0.2 : 0.0
                     animations:^
     {
         _logWindow.frame = CGRectMake(0.0,
                                       0.0,
                                       _keyWindow.size.width - 30.0,
                                       20.0);
     }];
}

- (void)logMessage:(DDLogMessage *)logMessage
{
    @synchronized(self)
    {
        // Remove last object if needed
        BOOL removeObject = _messages.count == _maxMessages;
        if (removeObject)
        {
            [_messages removeLastObject];
        }
        
        // Insert new message
        [_messages insertObject:logMessage
                        atIndex:0];
    }
    
    // Refresh table view
    if (!_updateScheduled)
    {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [self setTableViewNeedsRefresh];
                       });
    }
}

- (void)setTableViewNeedsRefresh
{
    // Create the table (and log window)?
    if (!_tableView && [UIApplication sharedApplication].keyWindow)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^
        {
            _keyWindow = [UIApplication sharedApplication].keyWindow;
            _logWindow = [[NSBundle loadNibNamed:@"NBUDashboardLogger"
                                           owner:self
                                         options:nil] objectAtIndex:0];
            _logWindow.windowLevel = UIWindowLevelStatusBar + 1;
            _tableView.frame = CGRectMake(20.0,
                                          0.0,
                                          _keyWindow.size.width - 20.0,
                                          _keyWindow.size.height);
            [self minimizeAnimated:NO];
            _logWindow.hidden = NO;
        });
    }
    
    // Refresh table
    if (_tableView)
    {
        @synchronized(self)
        {
            // Already scheduled?
            if (_updateScheduled)
                return;
            
            // Too soon?
            if ([_lastUpdate timeIntervalSinceNow] > -_minIntervalToUpdate)
            {
                // Schedule
                _updateScheduled = YES;
                dispatch_after(-[_lastUpdate timeIntervalSinceNow], dispatch_get_main_queue(), ^(void)
                               {
                                   _updateScheduled = NO;
                                   [self refreshTableView];
                               });
            }
            
            // Update directly
            else
            {
                [self refreshTableView];
            }
        }
    }
}

- (void)refreshTableView
{
    _lastUpdate = [NSDate date];
    
    // Freeze messages in a buffer
    NSArray * lastBuffer = _messagesBuffer;
    _messagesBuffer = [NSArray arrayWithArray:_messages];
    NSLog(@"!!! %d", _messagesBuffer.count);
    
    // Calculate how much the buffer moved
    NSUInteger offset = NSNotFound;
    if (lastBuffer.count > 0)
        offset = [_messages indexOfObject:lastBuffer[0]];
    
    // Full refresh needed?
    if (offset == NSNotFound)
    {
        [_tableView reloadData];
    }
    
    // Partial only
    else
    {
        [_tableView beginUpdates];
        
        // Remove items?
        NSUInteger tableCount = [_tableView numberOfRowsInSection:0];
        NSLog(@"••• %d", tableCount);
        NSInteger removeCount = tableCount + offset - _maxMessages;
        if (removeCount > 0)
        {
            NSMutableArray * indexPaths = [NSMutableArray arrayWithCapacity:removeCount];
            for (NSUInteger i = tableCount - removeCount; i < tableCount; i++)
            {
                [indexPaths addObject:[NSIndexPath indexPathForRow:i
                                                         inSection:0]];
            }
            [_tableView deleteRowsAtIndexPaths:indexPaths
                              withRowAnimation:UITableViewRowAnimationFade];
            NSLog(@"--- %d", indexPaths.count);
            NSLog(@"--- %@", indexPaths);
        }
        
        // Insert items
        NSMutableArray * indexPaths = [NSMutableArray arrayWithCapacity:offset];
        for (NSUInteger i = 0; i < offset; i++)
        {
            [indexPaths addObject:[NSIndexPath indexPathForRow:i
                                                     inSection:0]];
        }
        [_tableView insertRowsAtIndexPaths:indexPaths
                          withRowAnimation:UITableViewRowAnimationFade];
        NSLog(@"+++ %d", indexPaths.count);
        NSLog(@"+++ %@", indexPaths);
        
        [_tableView endUpdates];
    }
}

#pragma mark - TableView delegate/data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _messagesBuffer.count;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString * string;
    if (self->formatter)
    {
        string = [self->formatter formatLogMessage:logMessage];
    }
    else
    {
        string = [NSString stringWithFormat:@"%@:%d %@",
                  logMessage.fileName,
                  logMessage->lineNumber,
                  logMessage->logMsg];
    }
    return string;
}

- (NSString *)textForCellAtIndexPath:(NSIndexPath *)indexPath
{
    DDLogMessage * message = _messagesBuffer[indexPath.row];
    if ([_tableView.indexPathsForSelectedRows containsObject:indexPath])
    {
        return [self formatLogMessage:message];
    }
    else
    {
        return [message->logMsg stringByReplacingOccurrencesOfString:@"\n"
                                                          withString:@" "];
    }
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![_tableView.indexPathsForSelectedRows containsObject:indexPath])
    {
        return 20.0;
    }
    
    NSString * string = [self textForCellAtIndexPath:indexPath];
    CGSize size = [string sizeWithFont:_font
                     constrainedToSize:CGSizeMake(_tableView.size.width,
                                                  _tableView.size.height)];
    return MAX(size.height, 20.0);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView beginUpdates];
    [tableView endUpdates];
    UILabel * label = (UILabel *)[_tableView cellForRowAtIndexPath:indexPath].contentView.subviews[0];
    label.text = [self textForCellAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView beginUpdates];
    [tableView endUpdates];
    UILabel * label = (UILabel *)[_tableView cellForRowAtIndexPath:indexPath].contentView.subviews[0];
    label.text = [self textForCellAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"logMessage"];
    UILabel * label;
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"logMessage"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        label = [UILabel new];
        label.backgroundColor = [UIColor clearColor];
        label.font = _font;
        label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        label.numberOfLines = 0;
        label.frame = cell.contentView.bounds;
        [cell.contentView addSubview:label];
    }
    else
    {
        label = (UILabel *)cell.contentView.subviews[0];
    }
    
    DDLogMessage * message = _messagesBuffer[indexPath.row];
    switch (message->logFlag)
    {
        case LOG_FLAG_ERROR : label.textColor = [UIColor redColor]; break;
        case LOG_FLAG_WARN  : label.textColor = [UIColor orangeColor]; break;
        case LOG_FLAG_INFO  : label.textColor = [UIColor greenColor]; break;
        default             : label.textColor = [UIColor whiteColor]; break;
    }
    
    label.text = [self textForCellAtIndexPath:indexPath];
    
    return cell;
}

@end

