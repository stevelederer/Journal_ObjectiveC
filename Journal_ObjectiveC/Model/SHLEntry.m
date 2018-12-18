//
//  Entry.m
//  Journal_ObjectiveC
//
//  Created by Steve Lederer on 12/17/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import "SHLEntry.h"

@implementation SHLEntry

- (instancetype)initWithTitle:(NSString *)title
                         text:(NSString *)text
                    timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        // Initialize our properties
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *text = dictionary[@"text"];
    NSDate *timestamp = dictionary[@"timestamp"];
    return[self initWithTitle:title text:text timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{
             @"title": self.title,
             @"text": self.text,
             @"timestamp": self.timestamp
             };
}

@end
