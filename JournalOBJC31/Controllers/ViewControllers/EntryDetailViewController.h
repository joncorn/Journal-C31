//
//  EntryDetailViewController.h
//  JournalOBJC31
//
//  Created by Jon Corn on 1/27/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController

#pragma mark - Properties
@property (nonatomic) Entry *entryLanding;

#pragma mark - Outlets
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
@property (weak, nonatomic) IBOutlet UITextField *entryTitleTextField;

@end

NS_ASSUME_NONNULL_END
