//
//  EntryController.h
//  JournalOBJC31
//
//  Created by Jon Corn on 1/27/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

// Singleton
+ (EntryController *) shared;

- (void)saveToPersistentStore;

// var states = [Entry]()
@property (nonatomic, copy) NSArray *entries;

// CRUD
- (void)addEntriesObject:(Entry *)entry;
- (void)removeEntriesObject:(Entry *)entry;

@end

NS_ASSUME_NONNULL_END
