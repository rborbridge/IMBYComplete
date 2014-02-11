//
//  ImbyEmailViewController.h
//  Imby
//
//  Created by Heather Simmons on 2014-01-17.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//  Functionality moved to project detail view controller, retained here only for reference
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ImbyEmailViewController : UIViewController<MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>


- (IBAction) sendEmail:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *subjectField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property(weak, nonatomic) NSString *mobileNum;
@property (weak,nonatomic) UIButton *sender;


- (IBAction) sendText:(UIButton *)textMe;

-(IBAction) makeCall:(UIButton *)callMe;

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error;

- (void)messageComposeViewController: (MFMessageComposeViewController *)controller didFinishWithResult: (MessageComposeResult) result;


@end
