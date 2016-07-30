//
//  AMSSimpleViewController.m
//  MyWallet
//
//  Created by Iberfan on 30/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

#import "AMSSimpleViewController.h"

@interface AMSSimpleViewController ()

@end

@implementation AMSSimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)displayText:(UIButton *)sender {
    self.displayLabel.text = sender.titleLabel.text;
}
@end
