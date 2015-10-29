//
//  ParantViewController.h
//  GreatBoxers
//
//  Created by Rick Williams on 7/22/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "WeightDivision.h"


@interface ParentViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *parentTableView;

@property(retain, nonatomic) WeightDivision *weightDivision;

@end
