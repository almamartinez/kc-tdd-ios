//
//  AMSWallet.h
//  MyWallet
//
//  Created by Iberfan on 30/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import Foundation;
#import "AMSMoney.h"

@interface AMSWallet : NSObject<AMSMoney>

@property (nonatomic, readonly, strong) NSArray *currencies;

-(NSUInteger) numberOfCurrencies;
-(NSUInteger) amountForCurrency:(NSString *)currency;
-(NSUInteger) countForCurrency:(NSString *)currency;
-(AMSMoney *) moneyAtPosition:(NSInteger)position ForCurrency:(NSString *)currency;
@end
