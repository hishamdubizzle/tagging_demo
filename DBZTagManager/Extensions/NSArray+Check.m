//
//  NSArray+Check.m
//  DubizzleHorizontal
//
//  Created by Fawad Suhail on 8/20/14.
//  Copyright (c) 2014 dubizzle. All rights reserved.
//

#import <DBZTagManager/DBZTagManager-Swift.h>
#import "NSArray+Check.h"

@implementation NSArray (Check)

-(id) HGObjectAtIndex:(NSUInteger)index {
  
  if ((int)index < 0) {
    
    return nil;
  }
  
  if (index < [self count]) {
    
    return [self objectAtIndex:index];
  }
  
  else
    
    return nil;
}

- (NSMutableDictionary*)queryDictionary {
  return [NSArrayHelper queryDictionaryFromArray:self];
}

@end
