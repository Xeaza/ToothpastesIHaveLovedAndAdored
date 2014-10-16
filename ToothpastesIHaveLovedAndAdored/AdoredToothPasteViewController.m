//
//  ViewController.m
//  ToothpastesIHaveLovedAndAdored
//
//  Created by Taylor Wright-Sanson on 10/16/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "AdoredToothPasteViewController.h"
#import "ToothpastesTableViewController.h"

@interface AdoredToothPasteViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *adoredToothpastes;

@end

@implementation AdoredToothPasteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self load];
    if (self.adoredToothpastes == nil)
    {
        self.adoredToothpastes = [NSMutableArray array];
    }
    //self.adoredToothpastes = [NSMutableArray array];

}

- (IBAction)unwindFromToothpastesViewController:(UIStoryboardSegue *)segue
{
    ToothpastesTableViewController *toothpastesTableViewController = segue.sourceViewController;
    [self.adoredToothpastes addObject:[toothpastesTableViewController adoredToothpaste]];
    [self.tableView reloadData];
    [self save];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.adoredToothpastes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.adoredToothpastes objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - NSUserDefaults

- (NSURL *)documentsDirectory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *files = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    return  files.firstObject;
}

- (void)load
{
    NSURL *plist = [[self documentsDirectory] URLByAppendingPathComponent:@"pastes.plist"];
    self.adoredToothpastes = [NSMutableArray arrayWithContentsOfURL:plist];
}

- (void)save
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSURL *plist = [[self documentsDirectory] URLByAppendingPathComponent:@"pastes.plist"];
    [self.adoredToothpastes writeToURL:plist atomically:YES];
    [userDefaults setObject:[NSDate date] forKey:@"LastSaved"];
    [userDefaults synchronize];
}

@end
