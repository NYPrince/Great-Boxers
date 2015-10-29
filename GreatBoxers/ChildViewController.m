//
//  ChidViewController.m
//  GreatBoxers
//
//  Created by Rick Williams on 7/22/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import "ChildViewController.h"
#import "Reachability.h"
#import "AppDelegate.h"
#import "WeightDivision.h"

@implementation ChildViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    WeightDivision *weightDivision = appDelegate.weightDivisions[appDelegate.weightDivisionIndex];
    self.boxer = weightDivision.boxerList[appDelegate.boxerIndex];
    
    BOOL hasConnection = [self seekingInternet];
    
    if(hasConnection){
        NSURL * webURL = [NSURL URLWithString:self.boxer.boxerURL];
        NSURLRequest * req = [NSURLRequest requestWithURL:webURL];
        [self.webView loadRequest:req];
        self.webView.scalesPageToFit = YES;
        
    }
}


-(BOOL)seekingInternet{
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStats = [reach currentReachabilityStatus];
    
    if(internetStats == NotReachable){
        
        UIAlertView *alertMe = [[UIAlertView alloc]initWithTitle:@"Internet Connection" message:@"You need an Internet Connection, you are not connected" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        
        [alertMe show];
        return NO;
    }
    
    return YES;
}

-(void) viewDidAppear:(BOOL)animated {
    
    [self seekingInternet];
    NSURL * webURL = [NSURL URLWithString:self.pageURL];
    NSURLRequest * req = [NSURLRequest requestWithURL:webURL];
    [self.webView loadRequest:req];
    
    
}
-(void) viewWillDisappear:(BOOL)animated{
    NSURL * webURL = [NSURL URLWithString:@""];
    NSURLRequest * req = [NSURLRequest requestWithURL:webURL];
    [self.webView loadRequest:req];
}




- (IBAction)loadVideo:(id)sender {
    
    NSURL * webURL = [NSURL URLWithString:self.boxer.fighterUrl];
    NSURLRequest * req = [NSURLRequest requestWithURL:webURL];
    [self.webView loadRequest:req];
    

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
