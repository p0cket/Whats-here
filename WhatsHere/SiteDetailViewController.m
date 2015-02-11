//
//  SiteDetailViewController.m
//  WhatsHere
//
//  Created by Rajkumar Sharma on 05/08/14.
//  Copyright (c) 2014 Jimmy. All rights reserved.
//

#import "SiteDetailViewController.h"
#import "Bar.h"

@interface SiteDetailViewController()

@property (strong, nonatomic) Bar* bar;

@end


@implementation SiteDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //THIS WOULD COME FROM THE SERVER. AND THEN BE PASSED HERE FROM THE LIST VIEW.
    //YOU WOULDNT ACTUALLY INSTANTIATE THIS HERE
    self.bar = [[Bar alloc] initWithName:@"Working!" andFullAddress:@"VTS HQ" andPhoneNumber:[NSNumber numberWithInteger:1234]];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    self.barName.text = self.bar.name;
    self.address.text = self.bar.fullAddress;
}

-(IBAction)backBtnTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
