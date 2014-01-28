//
//  ImbyAnnotation.m
//  Imby
//
//  Created by Heather Simmons on 2014-01-17.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import "ImbyAnnotation.h"

@implementation ImbyAnnotation

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle
{
    if ((self = [super init])) {
        self.coordinate =coordinate;
        self.title = title;
        self.subtitle = subtitle;
        
    }
    return self;
}






@end
