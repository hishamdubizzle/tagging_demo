//
//  NSDictionary+Check.h
//  NullTest
//
//  Created by Fawad Suhail on 4/25/14.
//  Copyright (c) 2014 Dubizzle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Check)

-(BOOL) checkKey:(NSString*)key;
-(id) checkAndSet:(NSString*)key;

@end
