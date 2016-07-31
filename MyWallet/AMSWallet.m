//
//  AMSWallet.m
//  MyWallet
//
//  Created by Iberfan on 30/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

#import "AMSWallet.h"
#import "AMSBroker.h"

@interface AMSWallet()
@property (nonatomic, strong) NSMutableArray *moneys;
@property (nonatomic, strong) NSMutableDictionary *moneysPerCurrency;
@end

@implementation AMSWallet

-(NSUInteger)count{
    return self.moneys.count;
}

-(NSArray *)currencies{
    return [self.moneysPerCurrency.allKeys sortedArrayUsingComparator: ^(id obj1, id obj2) {
        return [obj1 caseInsensitiveCompare:obj2];
    }];
}

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if (self = [super init]){
        AMSMoney *money = [[AMSMoney alloc]initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        _moneysPerCurrency = [[NSMutableDictionary alloc]init];
        [_moneys addObject:money];
        [_moneysPerCurrency setObject:[_moneys mutableCopy] forKey:currency];
    }
    return self;
}


-(id<AMSMoney>) plus:(AMSMoney *)money{
    
    NSMutableArray *moneysForCurrency = [_moneysPerCurrency objectForKey:money.currency];
    
    if(moneysForCurrency == nil){
        moneysForCurrency = [[NSArray arrayWithObject:money] mutableCopy];
    }else{
        [moneysForCurrency addObject:money];
    }
    
    [_moneysPerCurrency setObject:moneysForCurrency forKey:money.currency];
    
    [self.moneys addObject: money];
    
    return self;
}

-(id<AMSMoney>) times:(NSInteger) multiplier{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (AMSMoney *each in self.moneys) {
        AMSMoney *new = [each times:multiplier];
        [newMoneys addObject:new];
    }
    
    self.moneys = newMoneys;
    return self;
}


-(id<AMSMoney>) reduceToCurrency:(NSString *) currency withBroker:(AMSBroker*) broker{
    
    AMSMoney *result = [[AMSMoney alloc]initWithAmount:0 currency:currency];
    
    for (AMSMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    
    return result;
}

-(NSUInteger) numberOfCurrencies{
    return _moneysPerCurrency.allKeys.count;
}

-(NSUInteger) amountForCurrency:(NSString *)currency{
    NSMutableArray *moneysForCurrency = [_moneysPerCurrency objectForKey:currency];
    
    NSUInteger result=0;
    for (AMSMoney *each in moneysForCurrency) {
        result += [each.amount unsignedIntegerValue];
    }
    
    return result;   
    
}
-(NSUInteger) countForCurrency:(NSString *)currency{
    NSMutableArray *moneysForCurrency = [_moneysPerCurrency objectForKey:currency];
    
    return moneysForCurrency.count;
}

-(AMSMoney *) moneyAtPosition:(NSInteger)position ForCurrency:(NSString *)currency{
    NSMutableArray *moneysForCurrency = [_moneysPerCurrency objectForKey:currency];
    
    return [moneysForCurrency objectAtIndex:position];
}

@end