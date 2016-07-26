//
//  AMSEuro.m
//  MyWallet
//
//  Created by Iberfan on 26/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

#import "AMSEuro.h"

@interface AMSEuro()
@property (nonatomic) NSInteger amount;

@end

@implementation AMSEuro

-(id) initWithAmount:(NSInteger) amount{
    
    if (self =[super init]){
        _amount = amount;
    }
    return self;
}

-(AMSEuro *) times:(NSInteger) multiplier{
    AMSEuro *newEur = [[AMSEuro alloc] initWithAmount:self.amount * multiplier];
    
    return newEur;
}

#pragma mark - Overwritten

-(BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}
@end
