//
//  RootViewController.h
//  SampleCoreData
//
//  Created by Admin on 27/07/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController

@property (strong) NSMutableArray *users;
@property (weak) NSManagedObjectContext *managedObjectContext;
@end
