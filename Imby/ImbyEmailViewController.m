//
//  ImbyEmailViewController.m
//  Imby
//
//  Created by Heather Simmons on 2014-01-17.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//
//  Functionality moved to project detail view controller, retained here only for reference

#import "ImbyEmailViewController.h"
#import <MessageUI/MessageUI.h>

@interface ImbyEmailViewController () <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

@end

@implementation ImbyEmailViewController
NSString *mobileNum = @"4163997396";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendEmail:(UIButton *)sender {
    //[self.subjectField resignFirstResponder];
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:self.subjectField.text];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:@"johnplanner@somewhere.com", nil];
        [mailer setToRecipients:toRecipients];
        [mailer setMessageBody:@"" isHTML:YES];
        
        //        UIImage* imgToAttach = [UIImage imageNamed:@"banner-ios.png"];
        //        NSData *data = UIImageJPEGRepresentation(imgToAttach, 1.0);
        //        [mailer addAttachmentData:data mimeType:@"image/png" fileName:@"banner-ios.png"];
        
        [self presentViewController:mailer animated:YES completion:NULL];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                        message:@"Your device doesn't support sending email."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            //Mail cancelled: you cancelled the operation and no email message was queued.
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            //Mail saved: you saved the email message in the drafts folder.
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            self.subjectField.text=@"Type Subject";
            self.subjectField.textColor= [UIColor lightGrayColor];
            
            //Mail send: the email message is queued in the outbox. It is ready to send.
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure");
            //Mail failed: the email message was not saved or queued, possibly due to an error.
            break;
        default:
            
            break;
    }
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction) sendText:(UIButton *)textMe;

{if([MFMessageComposeViewController canSendText])
    
    
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc]init];
    controller.messageComposeDelegate = self;
    
    [controller setSubject:self.subjectField.text];
    
    NSArray *toRecipients = @[@"4163997396"];
    [controller setRecipients:toRecipients];
    [controller setBody: @""];
    
    
    [self presentViewController:controller animated:YES completion: NULL];
    
}
else
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                    message:@"Your device doesn't support sending text."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}
    
    
    
    
}

- (void)messageComposeViewController: (MFMessageComposeViewController *)controller didFinishWithResult: (MessageComposeResult) result
{
    
    
    if (result == MessageComposeResultCancelled)
    {
        NSLog(@"Text cancelled");
        
    }
    else if (result == MessageComposeResultSent)
    {
        NSLog(@"Text sent");
        
    }
    else if(result ==MessageComposeResultFailed)
    {
        NSLog (@"Failed");
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}



-(IBAction) makeCall:(UIButton *)callMe{
    
    
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"tel://"]]){
        NSString* mobileNum = @"+14163997396";
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", mobileNum]]];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                        message:@"We couldn't complete the phone call."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    
    
    
}



@end
