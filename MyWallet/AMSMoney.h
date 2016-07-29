//
//  AMSMoney.h
//  MyWallet
//
//  Created by Iberfan on 28/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import Foundation;

@interface AMSMoney : NSObject

@property (nonatomic,readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;
-(id) initWithAmount:(NSInteger) amount currency:(NSString *) currency;
-(id) times:(NSInteger) multiplier;
@end
