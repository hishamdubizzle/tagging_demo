//
//  BaseCategoryEntity.m
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/9/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import "BaseCategoryEntity.h"

@implementation BaseCategoryEntity

- (BOOL)isPropertyCategory {
  
  return [[self.listingModel lowercaseString] containsString:@"property"];
}

@end
