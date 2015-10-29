//
//  ParantViewController.m
//  GreatBoxers
//
//  Created by Rick Williams on 7/22/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import "ParentViewController.h"
#import "AppDelegate.h"
#import "Boxer.h"

@interface UIViewController ()

@end

@implementation ParentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    self.weightDivision = appDelegate.weightDivisions[appDelegate.weightDivisionIndex];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.weightDivision.boxerList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    Boxer *boxer = self.weightDivision.boxerList[ indexPath.row ];
    
    [[cell imageView] setImage:[UIImage imageNamed:boxer.boxerImage]];
    
    cell.textLabel.text = boxer.boxerName;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int selectedRowNumber = indexPath.row;
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.boxerIndex = selectedRowNumber;
    
    [self performSegueWithIdentifier:@"ParentToChild" sender:nil];
}



@end
