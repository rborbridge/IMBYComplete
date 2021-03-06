//
//  ImbyAnnotation.h
//  Imby
//
//  Created by Heather Simmons on 2014-01-17.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//  Annotation class file with various properties such as pinColor and development type

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ImbyAnnotation : NSObject <MKAnnotation>
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) MKPinAnnotationColor pinColor;
@property (nonatomic, copy) NSString *devType;


//make map pins with CoreLocation framework coordinates
-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle;



@end
