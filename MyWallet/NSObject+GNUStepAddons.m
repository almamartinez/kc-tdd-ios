//
//  NSObject+GNUStepAddons.m
//  MyWallet
//
//  Created by Iberfan on 28/7/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//
@import ObjectiveC;
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

-(id) subclassResponsibility: (SEL)aSel{
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    
    [NSException raise:NSInvalidArgumentException format:@"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    
    return self;
}
@end
