//
//  EntryListTableViewController.m
//  Journal_ObjectiveC
//
//  Created by Steve Lederer on 12/17/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "SHLEntryController.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Number of Entries: %lu", (unsigned long)[[[SHLEntryController sharedController] entries] count]);
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[SHLEntryController sharedController] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    SHLEntry *entry = [[SHLEntryController sharedController] entries][indexPath.row];
    cell.textLabel.text = entry.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        SHLEntry *entry = [[SHLEntryController sharedController] entries][indexPath.row];
        [[SHLEntryController sharedController] removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        NSLog(@"Number of Entries: %lu", (unsigned long)[[[SHLEntryController sharedController] entries] count]);
        [tableView reloadData];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"entryDetailSegue"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        EntryDetailViewController *destinationVC = [segue destinationViewController];
        SHLEntry *entry = [[SHLEntryController sharedController] entries][indexPath.row];
        destinationVC.entry = entry;
    }
}


@end
