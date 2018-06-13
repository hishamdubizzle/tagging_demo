//
//  BaseSnowPlow.h
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/6/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNewListing.h"
#import "BaseCategoryEntity.h"

@class BaseAgentInfo;

@interface BaseSnowPlow : NSObject
@property (strong, nonatomic) NSDictionary *snowplowSectionsDictionary;
@property (strong, nonatomic) NSString *kLPVURLPageNotification;
@property (strong, nonatomic) NSString *pageURL;

+ (instancetype)sharedInstance;

#pragma mark - LEAD
+ (void)sendSnowplowLeadWithCategory:(BaseCategoryEntity *)category
                             listing:(BaseNewListing *)listing
                            leadType:(NSString*)leadType;

#pragma mark - DPV
+ (void)sendSnowplowDPVWithCategory:(BaseCategoryEntity *)category
                            listing:(BaseNewListing *)listing
                            section:(NSString *)section;

#pragma mark - LPV

+ (void)sendSnowplowLPVWithSearchCategoryIDs:(NSArray <NSNumber *> *)searchCategoryIDs
                            mainCategoryName:(NSString *)mainCategoryName
                           dictionaryFilters:(NSDictionary *)dictionaryFilters
                               arrayListings:(NSArray *)arrayListings
               snowplowMultiplierLoadMoreAds:(NSInteger)snowplowMultiplierLoadMoreAds
                                      userID:(NSString *)userID;
@end
