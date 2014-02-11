//
//  ImbyProjectDetailController.m
//  Imby
//
//  Created by Heather Simmons on 2014-01-23.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import "ImbyProjectDetailController.h"

@interface ImbyProjectDetailController ()

@end

@implementation ImbyProjectDetailController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.heathersimmons.ca"]];
	// Do any additional setup after loading the view.
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
