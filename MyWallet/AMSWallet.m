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

@end

@implementation AMSWallet

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if (self = [super init]){
        AMSMoney *money = [[AMSMoney alloc]initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}


-(id<AMSMoney>) plus:(AMSMoney *)money{
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

@end