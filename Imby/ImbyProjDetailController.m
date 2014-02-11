//
//  ImbyProjDetailController.m
//  Imby
//
//  Created by Heather Simmons on 2014-01-30.
//  Copyright (c) 2014 Heather Simmons. All rights reserved.
//

#import "ImbyProjDetailController.h"
#import "ImbyMapViewController.h"
#import "ImbyWebViewController.h"
#import <MessageUI/MessageUI.h>
#import "ImbyCalendarViewController.h"
#import "ImbyEmailViewController.h"

@interface ImbyProjDetailController ()
{
    
   
}

@end

@implementation ImbyProjDetailController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.projTitle = [[NSMutableArray alloc]initWithObjects:
                 @"100 Queen Street West",
                 @"30 Bond Street",
                 @"73 McCaul Street",
                 @"600 University Avenue",
                 @"205 Richmond Street West",
                 @"1 Blue Jays Way",
                 nil];
    self.projDevType = [[NSMutableArray alloc]initWithObjects:
                 @"Building Permit",
                 @"Zoning Amendment",
                 @"Zoning Amendment",
                 @"Minor Variance",
                 @"Building Permit",
                 @"Minor Variance",
                   nil];
    self.fileNum = [[NSMutableArray alloc]initWithObjects:
                 @"Q12987",
                 @"B45687",
                 @"M98765",
                 @"U34567",
                 @"R76545",
                 @"B98709",
                 nil];
    self.wardNum = [[NSMutableArray alloc]initWithObjects:
                    @"Ward 27",
                    @"Ward 27",
                    @"Ward 20",
                    @"Ward 20",
                    @"Ward 20",
                    @"Ward 20",
                    nil];

    
    self.projText = [[NSMutableArray alloc]initWithObjects:
                     @"The proposal by Lanterra Developments Ltd. is to construct a green roof on top of the existing two 58-storey towers (192 metres each including mechanical penthouse) containing 480 units each for a total of 960 residential units. The towers are proposed on a common 7-storey podium (23 metres) containing above grade parking and retail uses. The applicant is proposing to develop the site in phases with the podium and the south tower in Phase 1 and the north tower in Phase 2. Each residential tower has a separate lobby for pedestrian access. The north tower lobby has access at Maitland Street and wraps around to Maitland Terrace in the north east corner of the site. The south tower lobby has access at Alexander Street at the south east corner of the site.",
                     
                     @"The City has received a Rezoning Application to permit the construction of a new 18-storey mixed-use building containing 105 residential units, commercial at-grade, and 59 below-grade parking spaces at 30 Bond Street. Access to the underground garage and loading space will be from 11 Raglan Avenue.",
                     
                     @"The City has received a Rezoning Application for 73 McCaul Street to develop a 7 storey institutional library and mixed-use building including 60 residential condominium units and 890 square metres of commercial uses at grade. The proposal also includes five levels of below-grade parking with 186 vehicle parking spaces.",
                     
                     @"The City has received an application to amend the zoning to permit the development of a 6 storey above-grade parking structure at 600 Univeristy Avenue persuant to  redevelopment of two separate parcels municipally known as 500 University Avenue (south parcel) and 700 University Avenue (north parcel) for the purpose of a new mixed use development. The North Parcel would be developed with a 82 storey mixed use building complete with a six storey podium. The South Parcel would be developed with two tower elements having total heights of 84 and 86 storeys respectively, on a six-storey base. A total of approximately 22,220 m² of non-residential gross floor area, 2,709 dwelling units and 311 parking spaces are proposed. The Toronto and East York Community Council considered the preliminary staff report related to the Zoning Amendment application at its meeting of February 26, 2013.",
                     
                     @"Photo Shop Ltd. has applied for building permit to renovate the facade and interior of 205 Richmond Street West to provide 80% at-grade glazed frontage and cafe space for 15.",
                     
                     @"Toronto Blue Jays Roastery Inc has submitted an application for minor variance to the existing CMU2 Mixed Use zoning at 1 Blue Jays Way to permit 100 additional patio spaces (163 total) along the building frontage.",
                     nil];
    self.pubMtg = [[NSMutableArray alloc]initWithObjects:
                   @"March 27, 2014  7:00PM  Toronto Metro Hall",
                   @"February 11, 2014  6:00PM  Toronto City Hall",
                   @"February 15, 2014  7:00PM  Toronto Metro Hall",
                   @"March 5, 2014  7:00PM  Toronto Metro Hall",
                   @"March 17, 2014  7:00PM  Toronto Metro Hall",
                   @"March 4, 2014  1:00PM  Toronto City Hall",
                 nil];
    
    NSLog(@"Title of file is %@", self.title);
    
    //initialize flag
    NSInteger flag = 106;

    //set "flags" based on title information passed in from mapView controller
    if ([self.title isEqualToString:@"100 Queen Street West"])
    {
        
        flag = 0;
        
    }
    
     if ([self.title isEqualToString:@"30 Bond Street"])
     {
         
         flag = 1;
     }
    
    if ([self.title isEqualToString:@"73 McCaul Street"])
    {
        
        flag = 2;
    }
    
    
    if ([self.title isEqualToString:@"600 University Avenue"])
    {
        
        flag = 3;
    }
    
    if ([self.title isEqualToString:@"205 Richmond Street West"])
    {
        
        flag = 4;
    }
    
    if ([self.title isEqualToString:@"1 Blue Jays Way"])
    {
        
        flag = 5;
    }

    
    //Dynamic Content of Details Page Table View
    //Cell label info, left side
    self.leftItems = [[NSArray alloc]initWithObjects:
                  @"File Number",
                  @"Application Type",
                  @"Ward Information",
                  @"Plans & Renderings",
                  @"Add Public Meeting to Calendar",
                  nil];
    
    //Cell label info, right side
    self.rightItems=[[NSArray alloc]initWithObjects:
                 [self.fileNum objectAtIndex:flag],
                 [self.projDevType objectAtIndex:flag],
                 [self.wardNum objectAtIndex:flag],
                 @"View",
                 [self.pubMtg objectAtIndex:flag],
                 nil];

    
//Scolling Text View, use flag to load text for appropriate project
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect frame = CGRectMake(10, 290, screenBounds.size.width, screenBounds.size.height-290);    NSLog(@"screen height is %f", screenBounds.size.height);
    UIScrollView *scrollMe = [[UIScrollView alloc] initWithFrame:frame];
    scrollMe.scrollEnabled = YES;
    scrollMe.contentSize = CGSizeMake(frame.size.width, frame.size.height);
    UITextView *textView = [[UITextView alloc] initWithFrame: CGRectMake(0,0,300,frame.size.height-44)];
    [textView setText: [_projText objectAtIndex:flag]];
    textView.editable = NO;
    
//Bottom Toolbar with email and phone buttons
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44);
    
    UIBarButtonItem *barButtonEmail = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(sendEmail:)];
    
    UIBarButtonItem *barButtonPhone = [[UIBarButtonItem alloc]initWithTitle:@"Phone" style:UIBarButtonItemStylePlain target:self action:@selector(buttonClickedPhone:)];

    
    UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                               target:nil
                                               action:nil];
    
    
    UIBarButtonItem *flexibleSpaceBarButton2 = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                               target:nil
                                               action:nil];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 125, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"Contact Planner";
    
    UIBarButtonItem *contactUs = [[UIBarButtonItem alloc] initWithCustomView:label];
    
    
    toolbar.items = [NSArray arrayWithObjects:barButtonEmail,
                     flexibleSpaceBarButton,contactUs,flexibleSpaceBarButton2,
                     barButtonPhone, nil];
    
    //add textView to scrollview, add scrollview to view, add toolbar to view
    [scrollMe addSubview:textView];
    [self.view addSubview:scrollMe];
    [self.view addSubview:toolbar];
    
}

//make phone calls
-(void) buttonClickedPhone:(id)sender
{
    NSLog(@"you clicked on button %@", sender);
    
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

//send email
- (IBAction)sendEmail:(UIButton *)sender {
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:self.subjectField.text];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:@"heathersimmons@rogers.com", nil];
  
        NSString *subjectLine = [[NSString alloc] initWithString:(self.title)];
        
        [mailer setToRecipients:toRecipients];
        [mailer setMessageBody:@"" isHTML:YES];
        [mailer setSubject:subjectLine];
        
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

//Various log messages based on mail result; also dismisses mail controller when message sent
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
   
    return [self.leftItems count];
}

//Configure cell in each row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellType = @"Type";
    static NSString *CellWard = @"Ward";
    static NSString *CellFile = @"File";
    static NSString *CellPlans = @"Plans";
    static NSString *CellMtg = @"Mtg";
    
    NSString *identityString = @"";
    
    switch([indexPath row]){
        case 0: {
            identityString = CellType;
            break;
        }
        case 1: {
            identityString = CellWard;
            break;
            
        }
        case 2: {
            identityString = CellFile;
            break;
            
    }
        case 3: {
            identityString = CellPlans;
            break;
        }
            
        case 4:{
            identityString = CellMtg;
            break;
            
        }
        default:
            break;
    }
    
    
   UITableViewCell *cell;
    
    //set styles of individual cells
   cell = [tableView dequeueReusableCellWithIdentifier:identityString];
    
    if (cell == nil) {
        if(identityString == CellType){
       
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identityString];
            
            
        }
        else if(identityString ==CellWard) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identityString];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
        
        else if(identityString ==CellFile) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identityString];
            
            
        }
        else if (identityString == CellPlans) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identityString];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
    }
    
        else if (identityString == CellMtg) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identityString];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.detailTextLabel.textColor = [UIColor grayColor];
        
    }
    
        else {
            
        }
//Set cell text for each row
    cell.textLabel.text = [self.leftItems objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.rightItems objectAtIndex:indexPath.row];
    
    return cell;
}

//next two methods trigger segues to ward, page content, and calendar controllers
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"goWeb"]) {
        
        ImbyWebViewController *myWard = segue.destinationViewController;
        
        NSString *passWard;
        
        if ([self.title isEqualToString:@"100 Queen Street West"])
        {
            
            passWard = @"Ward 27";
            
        }
        
        else if ([self.title isEqualToString:@"30 Bond Street"])
        {
            
            passWard = @"Ward 27";
        }
        
        else
            
        {
            passWard = @"Ward 20";
        }
        
         NSLog(@"passWard is %@", passWard);
        
        myWard.wardFlag = passWard;
    }

    
    if ([segue.identifier isEqualToString:@"goPage"]) {
//        NSIndexPath *indexPath = [self.sampleTableView indexPathForSelectedRow];
//        UIViewController *myViewController = segue.destinationViewController;
//        myViewController.title = [self.leftItems objectAtIndex:indexPath.row];
    }
    if ([segue.identifier isEqualToString:@"goCalendar"]) {
//        NSIndexPath *indexPath = [self.sampleTableView indexPathForSelectedRow];
//        UIViewController *myViewController = segue.destinationViewController;
//        myViewController.title = [self.items objectAtIndex:indexPath.row];
    }

    
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch([indexPath row]){
        case 0: {
            break;
        }
        
        case 1: {
          
            break;
        }
        
        case 2: {
            
            break;
            
        }
        
        case 3: {
            
            break;
        }
            
        case 4: {
         [self performSegueWithIdentifier:@"goCalendar" sender:self];
         //   [self addEvent];
            break;
            
        }
  
        default:
            break;
    }
    
    // Navigation logic may go here. Create and push another view controller.
    
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


@end
