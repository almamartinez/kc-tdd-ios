//
//  AMSSimpleViewController.h
//  MyWallet
//
//  Created by Iberfan on 30/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface AMSSimpleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)displayText:(UIButton *)sender;

@end
