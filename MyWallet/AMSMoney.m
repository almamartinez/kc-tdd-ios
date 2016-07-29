//
//  AMSMoney.m
//  MyWallet
//
//  Created by Iberfan on 28/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

#import "AMSMoney.h"
#import "NSObject+GNUStepAddons.h"

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

-(id) times:(NSInteger) multiplier{
    //No se debería llamar, sino que se debería usar
    // el de al subclass.
    
    //return [self subclassResponsibility:_cmd]; //_cmd es un parámetro oculto que recibe todo método y contiene el selector actual.
    
    
    AMSMoney *newEur = [[AMSMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
        
    return newEur;
    
}

-(AMSMoney *) plus:(AMSMoney *) other{
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    AMSMoney *total = [[AMSMoney alloc] initWithAmount:totalAmount currency:self.currency];
    return total;
}

#pragma mark - Overwritten

-(BOOL)isEqual:(id)object{
   
    return (self.currency == [object currency]) && ([self amount] == [object amount]) ;
}

-(NSUInteger) hash{
    
    return (NSUInteger)self.amount;

}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@ %ld", [self class], (long)[self amount]];
}



@end
