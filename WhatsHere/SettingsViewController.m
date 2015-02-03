//
//  SettingsViewController.m
//  WhatsHere
//
//  Created by Rajkumar Sharma on 05/08/14.
//  Copyright (c) 2014 Jimmy. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

-(void)viewDidLoad
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [super viewDidLoad];
}
@end
