//
//  ImbyWebViewController.m
//  Imby
//
//  Created by Heather Simmons on 2014-01-17.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import "ImbyWebViewController.h"
#import "ImbyProjDetailController.h"

@interface ImbyWebViewController ()

@end

@implementation ImbyWebViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //pull up Ward 27 website within frame in Imby application webView
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    UIWebView *webView = [[UIWebView alloc] init];
    [webView setFrame:CGRectMake(0, 55, screenBounds.size.width, screenBounds.size.height)];
    NSLog(@"Ward flag for page is %@", self.wardFlag);
    
    if ([self.wardFlag isEqualToString:@"Ward 27"]){
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ward27news.ca"]]];
        
    }
    
    else {
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ward20.ca"]]];
        
    }

    webView.scalesPageToFit = YES;
    [[self view] addSubview:webView];
	// Do any additional setup after loading the view.
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
