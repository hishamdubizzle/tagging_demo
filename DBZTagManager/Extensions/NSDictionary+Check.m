//
//  NSDictionary+Check.m
//  NullTest
//
//  Created by Fawad Suhail on 4/25/14.
//  Copyright (c) 2014 Dubizzle. All rights reserved.
//

#import "NSDictionary+Check.h"

@implementation NSDictionary (Check)

-(id) checkAndSet:(NSString *)key {
    
    return [self checkKey:key] ? [self objectForKey:key] : nil;
}

-(BOOL) checkKey:(NSString *)key {
    
    if (!key) {
        
        return NO;
    }
    
    if ([self objectForKey:key] && [self objectForKey:key] != [NSNull null]) {
        
        return YES;
    }
    
    return NO;
}

@end
