//
//  AMSMoney.m
//  MyWallet
//
//  Created by Iberfan on 28/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

#import "AMSMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "AMSMoney-Private.h"
#import "AMSEuro.h"
#import "AMSDollar.h"



@implementation AMSMoney

+(id) euroWithAmount:(NSInteger) amount{
    return [[AMSMoney alloc] initWithAmount:amount currency:@"EUR"];
}
+(id) dollarWithAmount:(NSInteger) amount{
    return [[AMSMoney alloc] initWithAmount:amount currency:@"USD"];
}

-(id) initWithAmount:(NSInteger) amount currency:(NSString *) currency{
    if (self = [super init]){
        _amount= @(amount);
        _currency = currency;
    }
    return self;
}

-(id) times:(NSInteger) multiplier{
    //No se debería llamar, sino que se debería usar
    // el de al subclass.
    
    //return [self subclassResponsibility:_cmd]; //_cmd es un parámetro oculto que recibe todo método y contiene el selector actual.
    
    
    AMSMoney *newEur = [[AMSMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
        
    return newEur;
    
}

#pragma mark - Overwritten

-(BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}

-(NSUInteger) hash{
    
    return (NSUInteger)self.amount;

}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@ %ld", [self class], (long)[self amount]];
}



@end
