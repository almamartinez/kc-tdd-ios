//
//  AMSBroker.h
//  MyWallet
//
//  Created by Iberfan on 29/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import Foundation;
@class AMSMoney;

@interface AMSBroker : NSObject

-(AMSMoney *)reduce:(AMSMoney *) money toCurrency:(NSString *) currency;
@end
