//
//  BaseCountry.h
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/9/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StringLang;

@interface BaseCountry : NSObject

@property (nonatomic, strong) NSString *uri;
@property (nonatomic) int order;
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSString *currency;

-(void) setData:(NSDictionary*)dict;

                 
@end
