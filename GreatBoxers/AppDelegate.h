//
//  AppDelegate.h
//  GreatBoxers
//
//  Created by Rick Williams on 7/22/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic)UINavigationController * navigationController;

@property (nonatomic, retain) NSArray *weightDivisions;

@property(nonatomic) int weightDivisionIndex;
@property(nonatomic) int boxerIndex;

@end
