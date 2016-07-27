//
//  DetailViewController.h
//  SampleCoreData
//
//  Created by Admin on 27/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Users.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *mobileNo;
@property (strong) Users *userObj;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@end
