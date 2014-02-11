//
//  ImbyPageContentViewController.h
//  Imby
//
//  Created by Heather Simmons on 2014-02-03.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImbyPageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@property(strong,nonatomic)UIPageViewController *pageViewController;
@property (strong,nonatomic) NSArray *pageTitles;
@property(strong,nonatomic) NSArray *pageImages;


@end
