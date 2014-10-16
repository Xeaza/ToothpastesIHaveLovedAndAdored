//
//  ViewController.m
//  ToothpastesIHaveLovedAndAdored
//
//  Created by Taylor Wright-Sanson on 10/16/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "AdoredToothPasteViewController.h"

@interface AdoredToothPasteViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation AdoredToothPasteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}

@end
