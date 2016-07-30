//
//  AMSMoney.h
//  MyWallet
//
//  Created by Iberfan on 28/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import Foundation;
@class AMSMoney;
@class AMSBroker;

@protocol AMSMoney <NSObject>

-(id) initWithAmount:(NSInteger) amount currency:(NSString *) currency;
-(id<AMSMoney>) times:(NSInteger) multiplier;
-(id<AMSMoney>) plus:(AMSMoney *) other;
-(id<AMSMoney>) reduceToCurrency:(NSString *) currency withBroker:(AMSBroker*) broker;
@end

@interface AMSMoney : NSObject<AMSMoney>

@property (nonatomic,strong,readonly) NSNumber *amount;
@property (nonatomic,readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

@end
