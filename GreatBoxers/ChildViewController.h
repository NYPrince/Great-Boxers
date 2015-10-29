//
//  ChidViewController.h
//  GreatBoxers
//
//  Created by Rick Williams on 7/22/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Boxer.h"
#import <Social/Social.h>

@interface ChildViewController : UIViewController

@property (nonatomic, strong)NSString * fightURL;

@property(nonatomic, retain) Boxer *boxer;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property(strong, nonatomic)NSString * pageURL;

- (IBAction)loadVideo:(id)sender;

@end
