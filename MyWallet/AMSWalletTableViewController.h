//
//  AMSWalletTableViewController.h
//  MyWallet
//
//  Created by Iberfan on 31/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import UIKit;
#import "AMSBroker.h"
@class AMSWallet;


@interface AMSWalletTableViewController : UITableViewController

-(id)initWithModel:(AMSWallet *)wallet;

-(NSInteger) sectionForCurrency:(NSString *)currency;

@end
