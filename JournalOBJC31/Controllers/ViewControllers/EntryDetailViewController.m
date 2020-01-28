//
//  EntryDetailViewController.m
//  JournalOBJC31
//
//  Created by Jon Corn on 1/27/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "Entry.h"
#import "EntryController.h"

@interface EntryDetailViewController () <UITextFieldDelegate>

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)setEntryLanding:(Entry *)entryLanding {
    _entryLanding = entryLanding;
    [self updateViews];
}

- (void)updateViews {
    if (!self.entryLanding) return;
    self.entryTitleTextField.text = self.entryLanding.title;
    self.bodyTextView.text = self.entryLanding.bodyText;
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    if (self.entryLanding) {
        self.entryLanding.title = self.entryTitleTextField.text;
        self.entryLanding.bodyText = self.bodyTextView.text;
        self.entryLanding.timestamp = [NSDate date];
    } else {
        
        Entry *entry = [[Entry alloc] initWithTitle:self.entryTitleTextField.text bodyText:self.bodyTextView.text timestamp:[NSDate date]];
        
        [[EntryController shared] addEntriesObject:entry];
        self.entryLanding = entry;
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(UIButton *)sender {
    self.entryTitleTextField.text = @"";
    self.bodyTextView.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
