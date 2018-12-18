//
//  Entry.h
//  Journal_ObjectiveC
//
//  Created by Steve Lederer on 12/17/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHLEntry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timestamp;

- (instancetype)initWithTitle:(NSString *)title
                         text:(NSString *)text
                    timestamp:(NSDate *)timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;

@end

NS_ASSUME_NONNULL_END
