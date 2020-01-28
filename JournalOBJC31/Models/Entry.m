//
//  Entry.m
//  JournalOBJC31
//
//  Created by Jon Corn on 1/27/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import "Entry.h"

static NSString * const TitleKey = @"title";
static NSString * const BodyTextKey = @"bodyText";
static NSString * const TimestampKey = @"timestamp";

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *title = dictionary[TitleKey];
    NSString *bodyText = dictionary[BodyTextKey];
    NSDate *timestamp = dictionary[TimestampKey];
    return [self initWithTitle:title bodyText:bodyText timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation {
    return @{TitleKey: self.title,
             BodyTextKey: self.bodyText,
             TimestampKey: self.timestamp};
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[Entry class]]) { return NO; }
    return [[self dictionaryRepresentation] isEqualToDictionary:[(Entry *)object dictionaryRepresentation]];
}

@end
