//
//  ViewController.m
//  WhatsHere
//
//  Created by Rajkumar Sharma on 04/08/14.
//  Copyright (c) 2014 Jimmy. All rights reserved.
//

#import "ViewController.h"
#import "Bar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doSomething{
    Bar* bar = [[Bar alloc] init];

}

//-(void)viewWillAppear:(BOOL)animated{
 //   [self fetchBars];
//}


//-(void)fetchBars{
//    //calls parse (asynchronously)
//    //gets back a bunch of bars
//    self.bars = //the bunch of bars i just got
//}

@end
