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

-(id) init{
    if(self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(AMSMoney *)reduce:(id<AMSMoney>)money toCurrency:(NSString *)currency{
    //double dispatch
    return [money reduceToCurrency:currency withBroker:self];
}

-(void) addRate:(NSInteger) rate fromCurrency:(NSString *)fromCurrency toCurrency: (NSString *) currency{
   
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:currency]];
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject:invRate forKey:[self keyFromCurrency:currency     toCurrency:fromCurrency]];
    
}


#pragma mark -utils
-(NSString *) keyFromCurrency: (NSString *) fromCurrency toCurrency:(NSString *) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency,toCurrency];
}


@end
