//
//  BaseCountry.m
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/9/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import "BaseCountry.h"

@implementation BaseCountry

-(void) setData:(NSDictionary *)dict {
  
  _data = [NSDictionary dictionaryWithDictionary:dict];
  _uri = [NSString stringWithFormat:@"%@", [dict objectForKey:@"uri"]];
  _order = [[NSString stringWithFormat:@"%@", [dict objectForKey:@"order"]]intValue];
  _currency = [NSString stringWithFormat:@"%@", [dict objectForKey:@"currencyID"]];
}

@end
