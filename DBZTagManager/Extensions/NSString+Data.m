//
//  NSString+Data.m
//  DBZTagManager
//
//  Created by Ahmed Omer on 1/15/18.
//  Copyright © 2018 Dubizzle. All rights reserved.
//

#import <DBZTagManager/DBZTagManager-Swift.h>
#import "NSString+Data.h"

@implementation NSString (Data)

- (NSString*)countryID {
  return [NSStringHelper countryIDFromString:self];
}

- (NSString*)cityID {
  return [NSStringHelper cityIDFromString:self];
}

- (NSString*)categoryID {
  return [NSStringHelper categoryIDFromString:self];
}

- (NSString*)listingID {
  return [NSStringHelper listingIDFromString:self];
}

@end
