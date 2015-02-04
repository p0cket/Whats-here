//
//  ListViewController.m
//  WhatsHere
//
//  Created by Rajkumar Sharma on 05/08/14.
//  Copyright (c) 2014 Jimmy. All rights reserved.
//

#import "ListViewController.h"
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "SearchViewController.h"

@interface ListViewController()
{
    SearchViewController *searchController ;
}
@property (nonatomic,weak) IBOutlet UILabel *lblTitle;
@end


@implementation ListViewController


- (void)viewDidLoad
{
    _controllerCategoryType = CategoryTypeBar;
    _controllerListType = ListTypeNear;
    if (_controllerListType == ListTypeNear)
        _lblTitle.text = @"Near";
    else
        [self setHeadingTitle];
    
     _mapView.showsUserLocation = YES;
    
    pinCount = 1;
    [self addAnnotationAtLat:-30.05 long:140.05];
    [self addAnnotationAtLat:-30.03 long:139.98];
    [self addAnnotationAtLat:-29.98 long:139.96];
    [self addAnnotationAtLat:-29.94 long:140.02];
    [self addAnnotationAtLat:-29.90 long:140.01];
     [self zoomIn:nil];
    self.navigationController.navigationBar.hidden = YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)addAnnotationAtLat:(float)lat long:(float)longi
{
    //  for the pins on the map
    MKCoordinateRegion Bridge = { {0.0, 0.0} , {0.0, 0.0} };
    Bridge.center.latitude = lat;
    Bridge.center.longitude = longi;
    Bridge.span.longitudeDelta = 0.01f;
    Bridge.span.latitudeDelta = 0.01f;
    
    Annotation *ann = [[Annotation alloc] init];
    ann.title = @"Superba Food";
    ann.subtitle = @"1900 S Linkln Blvd.";
    ann.coordinate = Bridge.center;
    [_mapView addAnnotation:ann];

}

- (IBAction)zoomIn:(id)sender {
    
    MKCoordinateRegion Bridge = { {0.0, 0.0} , {0.0, 0.0} };
    Bridge.center.latitude = -30.0;
    Bridge.center.longitude = 140.0;
    Bridge.span.longitudeDelta = 0.01f;
    Bridge.span.latitudeDelta = 0.01f;

    
    MKUserLocation *userLocation = _mapView.userLocation;
    NSLog(@"%@",userLocation);
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        Bridge.center, 20000, 20000);
    [_mapView setRegion:region animated:YES];
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    

    if (annotation == mapView.userLocation)
    {
        return nil;
    }
    else
    {
        MKPinAnnotationView *MyPin=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Current"];
        //MyPin.pinColor = MKPinAnnotationColorPurple;
        
        UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        
        /*MyPin.rightCalloutAccessoryView = advertButton;
         MyPin.draggable = YES;
         
         MyPin.animatesDrop=TRUE;
         MyPin.canShowCallout = YES;*/
        MyPin.highlighted = NO;
        MyPin.canShowCallout = YES;
        MyPin.image = [UIImage imageNamed:@"icon-beer-copia"];
        
        
//        if (pinCount ==1)
//        MyPin.image = [UIImage imageNamed:@"icon-bar-copia"];
//        if (pinCount ==2)
//        MyPin.image = [UIImage imageNamed:@"icon-beer-copia"];
//        if (pinCount ==3)
//        MyPin.image = [UIImage imageNamed:@"icon-reel-film"];
//        if (pinCount ==4)
//        MyPin.image = [UIImage imageNamed:@"icon-restaurant"];
//        if (pinCount ==5)
//        MyPin.image = [UIImage imageNamed:@"icon-clinic"];
        MyPin.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map-popup-pic.png"]];
        MyPin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinCount++;
        return MyPin;
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"PushToDetail" sender:nil];
}

-(IBAction)button:(id)sender{
    NSLog(@"tapped");
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
}

-(IBAction)segmentValueChange:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex == 0) {
        [_mapView setHidden:NO];
    }else {
        _mapView.hidden = YES;
   }
}

- (IBAction)zoomInToUserLocation:(id)sender {
    
    MKUserLocation *userLocation = _mapView.userLocation;
    NSLog(@"%@",userLocation);
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 20000, 20000);
    [_mapView setRegion:region animated:YES];
}

-(void)setHeadingTitle{
    switch (self.controllerCategoryType) {
        case CategoryTypeBar:
            _lblTitle.text = @"Bars";
            break;
        case CategoryTypeBank:
            _lblTitle.text = @"Banks/ATM";
            break;
        case CategoryTypeCoffeeShop:
            _lblTitle.text = @"Coffee Shops";
            break;
        case CategoryTypeConert:
            _lblTitle.text = @"Concerts";
            break;
        case CategoryTypeGasStation:
            _lblTitle.text = @"Gas Stations";
            break;
        case CategoryTypeHospital:
            _lblTitle.text = @"Hospitals";
            break;
        case CategoryTypeLocalGuide:
            _lblTitle.text = @"Local Guides";
            break;
        case CategoryTypeMovieTheatre:
            _lblTitle.text = @"Movie Theatre";
            break;            
        default:
            break;
    }

}

-(IBAction)backBtnTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView Datasource/Delegate
//table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return arrOfOptions.count;
    return 5;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    //NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    //searchResults = [ filteredArrayUsingPredicate:resultPredicate];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;

    if (self.controllerListType == ListTypeNear)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"NearCell"];
        UIImageView *imgIcon = (UIImageView *)[cell.contentView viewWithTag:10];
        int value = arc4random()%7+2;
        imgIcon.image = [UIImage imageNamed:[self getIconNameForCategory:value]];
        // replace with only beer icon
        
        UITextField *textField = (UITextField *)[cell.contentView viewWithTag:9];
        textField.text = @"Hey guys";
        //  Code changed
        //  alex@viewthespace.com     
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell"];
        UIImageView *imgIcon = (UIImageView *)[cell.contentView viewWithTag:10];
        imgIcon.image = [UIImage imageNamed:[self getIconNameForCategory:self.controllerCategoryType]];
    }
   
    
    return cell;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"PushToDetail" sender:nil];
}

-(NSString *)getIconNameForCategory:(CategoryType)category
{

    switch (category) {
        case CategoryTypeBar:
            return @"icon-bar.png";
            break;
        case CategoryTypeBank:
            return @"icon-atm";
            break;
        case CategoryTypeCoffeeShop:
            return@"icon-coffee-shop";
            break;
        case CategoryTypeConert:
            return @"icon-concerrts";
            break;
        case CategoryTypeGasStation:
            return @"icon-gas-station";
            break;
        case CategoryTypeHospital:
            return @"icon-hospital";
            break;
        case CategoryTypeLocalGuide:
            return @"icon-local-guide";
            break;
        case CategoryTypeMovieTheatre:
            return @"icon-movie-theaters";
            break;
        default:
            break;
    }

}

#pragma mark - search

-(IBAction)searchBtnTap:(id)sender
{
    if (searchController == nil)
        searchController = (SearchViewController *) [self viewFromStoryboard:@"SearchViewController"];
    [self.navigationController.view addSubview:searchController.view];
    [searchController.searchTxtFld becomeFirstResponder];
    
}

-(IBAction)searchBtnTapped:(id)sender
{
    
    [searchController.searchTxtFld becomeFirstResponder];
}

-(IBAction)cancelBtnTap:(id)sender
{
    [searchController.view removeFromSuperview];
}



-(UIViewController *) viewFromStoryboard:(NSString *)storyboardID
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * controller = [storyBoard instantiateViewControllerWithIdentifier:storyboardID];
    
    return controller;
}

@end
