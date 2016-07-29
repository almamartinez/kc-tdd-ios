//
//  AMSBroker.m
//  MyWallet
//
//  Created by Iberfan on 29/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

#import "AMSBroker.h"

#import "AMSMoney.h"

@implementation AMSBroker

-(AMSMoney *)reduce:(AMSMoney *) money toCurrency:(NSString *) currency{
    return money;
}
@end
