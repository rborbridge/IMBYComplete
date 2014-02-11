//
//  ImbyMapViewController.h
//  Imby
//
//  Created by Heather Simmons on 2014-01-16.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>



@interface ImbyMapViewController : UIViewController <MKMapViewDelegate>

@property (weak,nonatomic) IBOutlet MKMapView *mapView;

- (void)addAnnotations:(NSArray *)annotations;
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation;

@end
