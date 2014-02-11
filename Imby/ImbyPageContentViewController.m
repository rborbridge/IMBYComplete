//
//  ImbyPageContentViewController.m
//  Imby
//
//  Created by Heather Simmons on 2014-02-03.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import "ImbyPageContentViewController.h"

@interface ImbyPageContentViewController ()

@end

@implementation ImbyPageContentViewController

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
   
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
