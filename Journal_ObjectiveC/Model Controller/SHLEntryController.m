//
//  SHLEntryController.m
//  Journal_ObjectiveC
//
//  Created by Steve Lederer on 12/17/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import "SHLEntryController.h"

@implementation SHLEntryController

// MARK: - Properties

+ (SHLEntryController *)sharedController
{
    static SHLEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SHLEntryController.alloc init];
        sharedInstance.entries = [NSMutableArray new];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

// MARK: - CRUD

-(void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (SHLEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [NSUserDefaults.standardUserDefaults setObject:entryDictionaries forKey:@"Entries"];
}

-(void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        SHLEntry *entry = [[SHLEntry new] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

-(void)addEntry:(SHLEntry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistentStorage];
}

-(void)removeEntry:(SHLEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
}

-(void)modifyEntry:(SHLEntry *)entry withTitle:(NSString *)title body:(NSString *)body
{
    entry.title = title;
    entry.text = body;
    [self saveToPersistentStorage];
}

@end
