//
//  EntryDetailViewController.m
//  Journal_ObjectiveC
//
//  Created by Steve Lederer on 12/17/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "SHLEntryController.h"
#import "SHLEntry.h"

@interface EntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation EntryDetailViewController

// MARK: - ViewLifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

// MARK: - Setup

-(void)updateViews
{
    if (self.entry) {
        self.titleTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.text;
    }
}

-(void)textViewDidBeginEditing:(UITextView *)bodyTextView
{
    if ([self.bodyTextView.text isEqualToString:@"(Body text...)"]) {
        self.bodyTextView.text = @"";
    } else {
        
    }
}
// MARK: - Actions

- (IBAction)clearButtonTapped:(id)sender
{
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        [SHLEntryController.sharedController modifyEntry:self.entry withTitle:self.titleTextField.text body:self.bodyTextView.text];
    } else {
        SHLEntry *entry = [[SHLEntry alloc] initWithTitle:self.titleTextField.text text:self.bodyTextView.text timestamp:[NSDate date]];
        [SHLEntryController.sharedController addEntry: entry];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
