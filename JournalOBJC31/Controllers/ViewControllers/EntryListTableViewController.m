//
//  EntryListTableViewController.m
//  JournalOBJC31
//
//  Created by Jon Corn on 1/27/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView reloadData];
}

#pragma mark - Actions
- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return EntryController.shared.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry *entry = EntryController.shared.entries[indexPath.row];
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Entry *entry = EntryController.shared.entries[indexPath.row];
        [EntryController.shared removeEntriesObject:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toEntryDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        EntryDetailViewController *destinationVC = segue.destinationViewController;
        Entry *entry = EntryController.shared.entries[indexPath.row];
        destinationVC.entryLanding = entry;
    }
}

@end
