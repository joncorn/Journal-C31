//
//  Entry.h
//  JournalOBJC31
//
//  Created by Jon Corn on 1/27/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

// Properties
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bodyText;
@property (nonatomic, copy) NSDate *timestamp;

// Initializer
- (instancetype) initWithTitle:(NSString *)title
                      bodyText:(NSString *)bodyText
                     timestamp:(NSDate *)timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;
@end

NS_ASSUME_NONNULL_END
