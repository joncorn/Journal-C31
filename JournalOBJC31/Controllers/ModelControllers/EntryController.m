//
//  EntryController.m
//  JournalOBJC31
//
//  Created by Jon Corn on 1/27/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import "EntryController.h"

static NSString * const EntriesKey = @"entries";

@interface EntryController ()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation EntryController

// MARK: - Singleton
+ (EntryController *)shared {
    static EntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [EntryController new];
    });
    return shared;
}

// MARK: - Initializer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

// MARK: - Methods
- (NSArray *)entries { return self.internalEntries; }

- (void)addEntriesObject:(Entry *)entry {
    [self.internalEntries addObject:entry];
}

- (void)removeEntriesObject:(Entry *)entry {
    [self.internalEntries removeObject:entry];
}

- (void)saveToPersistentStore {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}
- (void)loadFromPersistentStore {
    NSURL *url = [EntryController persistentStoreFileURL];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url options:kNilOptions error:&error];
    if (error) {
        NSLog(@"Error loading JSON data from file: %@", error);
        return;
    }
    NSArray *rawEntries = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error) {
        NSLog(@"Error converting JSON data to NSObject: %@", error);
        return;
    }
    NSMutableArray *newEntries = [NSMutableArray new];
    for (NSDictionary *entryDict in rawEntries) {
        Entry *entry = [[Entry alloc] initWithDictionary:entryDict];
        if (entry) {
            [newEntries addObject:entry];
        }
    }
    self.entries = newEntries;
}
+ (NSURL *)persistentStoreFileURL {
    NSArray<NSURL *> *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                    inDomains:NSUserDomainMask];
    return [urls[0] URLByAppendingPathComponent:@"journal.json"];
}

@end
