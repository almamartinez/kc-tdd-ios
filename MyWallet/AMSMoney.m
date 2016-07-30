//
//  AMSMoney.m
//  MyWallet
//
//  Created by Iberfan on 28/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

#import "AMSMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "AMSBroker.h"

@interface AMSMoney()
@property (nonatomic,strong) NSNumber *amount;
@end

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

-(id<AMSMoney>) times:(NSInteger) multiplier{
    //No se debería llamar, sino que se debería usar
    // el de al subclass.
    
    //return [self subclassResponsibility:_cmd]; //_cmd es un parámetro oculto que recibe todo método y contiene el selector actual.
    
    
    AMSMoney *newEur = [[AMSMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
        
    return newEur;
    
}

-(id<AMSMoney>) plus:(AMSMoney *) other{
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    AMSMoney *total = [[AMSMoney alloc] initWithAmount:totalAmount currency:self.currency];
    return total;
}

-(id<AMSMoney>) reduceToCurrency:(NSString *) currency withBroker:(AMSBroker*)broker{
    
    AMSMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]] doubleValue];
    
    //Comprobar que las divisas origen y destino son las mismas
    if ([self.currency isEqual:currency]){
        result = self;
    }else if (rate == 0.0){
        //NO hay tasa de conversión. Se lanza excepción
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@",self.currency, currency];
    }else{ //Hay tasa de conversión
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[AMSMoney alloc] initWithAmount:newAmount currency:currency];
        
    }
    return result;

}

#pragma mark - Overwritten

-(BOOL)isEqual:(id)object{
   
    return (self.currency == [object currency]) && ([self amount] == [object amount]) ;
}

-(NSUInteger) hash{
    
    return [self.amount integerValue];

}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], self.amount,self.currency];
}



@end
