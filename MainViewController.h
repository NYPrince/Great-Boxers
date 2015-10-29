//
//  MainViewController.h
//  GreatBoxers
//
//  Created by Rick Williams on 7/22/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//
#import "ParentViewController.h"
#import <UIKit/UIKit.h>
#import "DataInitializer.h"
#import "WeightDivision.h"
#import "ChildViewController.h"

@interface MainViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *divisionTableView;

@property(nonatomic, retain)DataInitializer * dataInit;

@property (nonatomic, retain) NSArray *weightDivisions;


@end