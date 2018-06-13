//
//  BaseNewListing.h
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/6/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseAgentInfo;
@interface BaseNewListing : NSObject

@property (nonatomic, strong, nullable) NSString *name;
@property (nonatomic, strong, nullable) NSString *phoneNumber;
@property (nonatomic, strong, nullable) NSString *listingUserID;
@property (nonatomic, strong, nullable) NSString *neighbourhoodURI;
@property (nonatomic, strong, nullable) NSString *neighbourhoodName;
@property (nonatomic, strong, nullable) NSString *uri;
@property (nonatomic, strong, nullable) NSNumber *photoCount;
@property (strong, nonatomic, nullable) NSString *feedID;
@property (nonatomic, strong, nullable) NSString *permaLink;
@property (nonatomic, strong, nullable) NSString *listingID;

@property (nonatomic) BOOL featuredListing;
@property (nonatomic) BOOL highlightedAd;
@property (nonatomic) BOOL promotedAd;
@property (nonatomic) BOOL verifiedAd;

@property (nonatomic, strong,nullable)  BaseAgentInfo *agentInfo;


@end
