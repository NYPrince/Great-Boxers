//
//  MainViewController.m
//  GreatBoxers
//
//  Created by Rick Williams on 7/22/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//
#import "MainViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Great Fighters";
    
    DataInitializer * startInit = [[DataInitializer alloc]init];
    self.dataInit = startInit;
    [startInit getAllData];
    self.weightDivisions = self.dataInit.WDivision;
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.weightDivisions = self.weightDivisions;
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.weightDivisions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor =[UIColor whiteColor];
    }
    
    WeightDivision * w = [self.weightDivisions objectAtIndex:[indexPath row]];
    
    NSString * divName = w.divisionName;
    
    cell.textLabel.text = divName;
    
    return cell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int selectedRowNumber = indexPath.row;
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.weightDivisionIndex = selectedRowNumber;
    
    [self performSegueWithIdentifier:@"MainToParent" sender:nil];
    
    
}


@end
