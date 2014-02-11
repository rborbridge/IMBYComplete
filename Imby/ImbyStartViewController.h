//
//  ImbyStartViewController.h
//  Imby
//
//  Created by Heather Simmons on 2014-02-03.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImbyPageContentViewController.h"

@interface ImbyStartViewController : UIViewController<UIPageViewControllerDataSource>




@property(strong,nonatomic)UIPageViewController *pageViewController;
@property(strong,nonatomic) NSArray *pageTitles;
@property(strong, nonatomic) NSArray *pageImages;

@end
