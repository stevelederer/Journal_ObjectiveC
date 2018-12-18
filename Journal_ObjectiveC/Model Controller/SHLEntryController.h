//
//  SHLEntryController.h
//  Journal_ObjectiveC
//
//  Created by Steve Lederer on 12/17/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHLEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHLEntryController : NSObject

// MARK: - Properties
+ (SHLEntryController *)sharedController;
@property (nonatomic, strong) NSMutableArray<SHLEntry*> *entries;

// MARK: - Methods
-(void)addEntry:(SHLEntry *)entry;
-(void)removeEntry:(SHLEntry *)entry;
-(void)modifyEntry:(SHLEntry *)entry
         withTitle:(NSString *)title
              body:(NSString *)body;
-(void)saveToPersistentStorage;
-(void)loadFromPersistentStorage;

@end

NS_ASSUME_NONNULL_END
