//
//  ImbyProjDetailController.h
//  Imby
//
//  Created by Heather Simmons on 2014-01-30.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImbyWebViewController.h"
#import <MessageUI/MessageUI.h>
#import "ImbyEmailViewController.h"

@interface ImbyProjDetailController : UIViewController<UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate>
{

}
@property(nonatomic, strong)IBOutlet UITableView *sampleTableView;
@property(nonatomic, strong) NSArray *leftItems;
@property(nonatomic, strong) NSArray *rightItems;
@property(nonatomic, strong) NSString *type;
@property(nonatomic, strong) NSMutableArray *projTitle;
@property(nonatomic, strong) NSMutableArray *projDevType;
@property(nonatomic, strong) NSMutableArray *fileNum;
@property(nonatomic, strong) NSMutableArray *wardNum;
@property(nonatomic, strong) NSMutableArray *projText;
@property(nonatomic,strong) NSMutableArray *pubMtg;


- (IBAction) sendEmail:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *subjectField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property(weak, nonatomic) NSString *mobileNum;
@property (weak,nonatomic) UIButton *sender;

@end
