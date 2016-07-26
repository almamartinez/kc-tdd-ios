//
//  AMSEuro.h
//  MyWallet
//
//  Created by Iberfan on 26/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

@import Foundation;

@interface AMSEuro : NSObject

-(id) initWithAmount:(NSInteger) amount;

-(AMSEuro *) times:(NSInteger) multiplier;
@end
