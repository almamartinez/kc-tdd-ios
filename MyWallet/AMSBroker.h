//
//  AMSBroker.h
//  MyWallet
//
//  Created by Iberfan on 29/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import Foundation;
#import "AMSMoney.h"
#import "AMSBroker.h"

@interface AMSBroker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

-(AMSMoney *)reduce:(id<AMSMoney>)money toCurrency:(NSString *) currency;
-(void) addRate:(NSInteger) rate fromCurrency:(NSString *)fromCurrency toCurrency: (NSString *) currency;
-(NSString *) keyFromCurrency: (NSString *) fromCurrency toCurrency:(NSString *) toCurrency;

@end
