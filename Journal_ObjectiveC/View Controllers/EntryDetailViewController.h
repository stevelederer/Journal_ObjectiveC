//
//  EntryDetailViewController.h
//  Journal_ObjectiveC
//
//  Created by Steve Lederer on 12/17/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHLEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController<UITextViewDelegate>

@property (nonatomic, strong) SHLEntry *entry;

@end

NS_ASSUME_NONNULL_END
