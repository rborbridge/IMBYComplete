//
//  ImbyMapViewController.m
//  Imby
//
//  Created by Heather Simmons on 2014-01-16.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import "ImbyMapViewController.h"
#import "ImbyAnnotation.h"
#import "ImbyProjectDetailController.h"


@interface ImbyMapViewController ()

{
    
    NSArray *annotName;
    NSArray *latCoord;
    NSArray *longCoord;
    NSArray *projTitle;
    NSArray *projSubTitle;
    NSArray *projDevType;
    ImbyAnnotation *selectedAnnotation;
    
    int i;
    
}

@end

@implementation ImbyMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    annotName = [[NSMutableArray alloc]initWithObjects:
                @"myAnnotation1",
                @"myAnnotation2",
                @"myAnnotation3",
                @"myAnnotation4",
                @"myAnnotation5",
                @"myAnnotation6",
                nil];
    
    latCoord = [[NSMutableArray alloc] initWithObjects:
                @"43.651919",
                @"43.654111",
                @"43.652590",
                @"43.657510",
                @"43.649461",
                @"43.641683",
                nil];
    
    longCoord = [[NSMutableArray alloc]initWithObjects:
                 
                @"-79.382402",
                @"-79.377415",
                @"-79.390551",
                @"-79.390294",
                @"-79.388750",
                @"-79.390122",
                nil];
    
    projTitle = [[NSMutableArray alloc]initWithObjects:
                 
                @"100 Queen Street West",
                @"30 Bond Street",
                @"73 McCaul Street",
                @"600 University Avenue",
                @"205 Richmond Street West",
                @"1 Blue Jays Way",
                nil];
    
    projSubTitle = [[NSMutableArray alloc]initWithObjects:
                @"Building Permit: green roof",
                @"Zoning Amendment: midrise residential tower",
                @"Zoning Amendment: institutional library",
                @"Minor Variance: parking structure",
                @"Building Permit: retail print services",
                @"Minor Variance: restaurant",
                nil];
    
    projDevType = [[NSMutableArray alloc]initWithObjects:
                @"Building Permit",
                @"Zoning Amendment",
                @"Zoning Amendment",
                @"Minor Variance",
                @"Building Permit",
                @"Minor Variance",
                nil];
    
    self.mapView.delegate = self;
	// Center mapView
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 43.651919;
    newRegion.center.longitude = -79.382402;
    newRegion.span.latitudeDelta = 0.03;
    newRegion.span.longitudeDelta = 0.03;
    [self.mapView setRegion:newRegion animated:YES];
    
    //Build map pins and populate with title, devType, etc. properties
   for(i=0; i<[annotName count];i++)
    {
        ImbyAnnotation *indivAnnot = [[ImbyAnnotation alloc]init];
        indivAnnot.coordinate = CLLocationCoordinate2DMake ([[latCoord objectAtIndex:i]floatValue],[[longCoord objectAtIndex:i]floatValue]);
        indivAnnot.title = [projTitle objectAtIndex:i];
        indivAnnot.subtitle = [projSubTitle objectAtIndex:i];
        indivAnnot.devType = [projDevType objectAtIndex:i];
        
       [self.mapView addAnnotation:indivAnnot];
       
   }
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    //drop the pins onto the map, with callouts
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    
    }else {
        annotationView.annotation = annotation;
    }
    
    //set the map pin colours depending on development type
    NSString* devType = ((ImbyAnnotation*)annotation).devType;
    
    if ([devType isEqualToString:@"Building Permit"])
    {
        [annotationView setPinColor:MKPinAnnotationColorPurple];
    }
    else if ([devType isEqualToString:@"Zoning Amendment"])
    {
        [annotationView setPinColor:MKPinAnnotationColorRed];
    }
    else if ([devType isEqualToString:@"Minor Variance"])
    {
        [annotationView setPinColor:MKPinAnnotationColorGreen];
    }

    //set info callouts on pins
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return annotationView;
}

//perform segue to projectDetails controller when callout accessory tapped
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view

    calloutAccessoryControlTapped:(UIControl *)control
    {
        selectedAnnotation = view.annotation;
        NSLog(@"accessory button tapped for annotation %@", view.annotation);
        NSLog (@"control tag is %ld", control.tag);
    
        [self performSegueWithIdentifier:@"projectDetails" sender:self];
        
    }

//segue - pass title information for specific pin clicked, to project details controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"projectDetails"]) {
      
       ImbyProjectDetailController *myProjects = segue.destinationViewController;
        
        NSString *passMe = selectedAnnotation.title;
        
        myProjects.title = passMe;
        
    }
}
//not used
- (void)addAnnotations:(NSArray *)annotations
{
    
    
}
//show or hide user location based on user preference
- (void)viewWillAppear:(BOOL)animated
{
    self.mapView.showsUserLocation = NO;
    self.mapView.showsUserLocation = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 

@end
