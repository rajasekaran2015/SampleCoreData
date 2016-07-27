//
//  DetailViewController.m
//  SampleCoreData
//
//  Created by Admin on 27/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.userObj) {
        [self.firstName setText:[self.userObj valueForKey:@"firstName"]];
        [self.lastName setText:[self.userObj valueForKey:@"lastName"]];
        [self.mobileNo setText:[[self.userObj valueForKey:@"mobile"] stringValue]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    
    if (self.userObj) {
        // Update existing user
        [self.userObj setValue:self.firstName.text forKey:@"firstName"];
        [self.userObj setValue:self.lastName.text forKey:@"lastName"];
        [self.userObj setValue:[NSNumber numberWithInt:[self.mobileNo.text intValue]] forKey:@"mobile"];
        
    } else {
        // Create a new user
        NSManagedObject *userObj = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:context];
        [userObj setValue:self.firstName.text forKey:@"firstName"];
        [userObj setValue:self.lastName.text forKey:@"lastName"];
        [userObj setValue:[NSNumber numberWithInt:[self.mobileNo.text intValue]] forKey:@"mobile"];
    }
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
