//
//  BaseCategoryEntity.h
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/9/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCategoryEntity : NSObject

@property (nonatomic, strong) NSString *staticIdentifier;
@property (nonatomic, strong) NSString *uri;
@property (nonatomic, strong) NSString *categoryID;
@property (nonatomic, retain) NSString *listingModel;

- (BOOL)isPropertyCategory;
@end
