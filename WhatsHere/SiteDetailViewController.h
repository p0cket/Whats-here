//
//  SiteDetailViewController.h
//  WhatsHere
//
//  Created by Rajkumar Sharma on 05/08/14.
//  Copyright (c) 2014 Jimmy. All rights reserved.
//

#import "ParentViewController.h"
#import <MapKit/MapKit.h>

@interface SiteDetailViewController : ParentViewController
@property (weak, nonatomic) IBOutlet UILabel *barName;
@property (weak, nonatomic) IBOutlet UILabel *address;

@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;


@end
