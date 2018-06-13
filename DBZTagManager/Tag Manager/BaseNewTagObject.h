//
//  BaseNewTagObject.h
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/5/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, TagAllowedTrackers) {
  TagTrackerATI      = 1 << 0,
  TagTrackerAdjust   = 1 << 1,
  TagTrackerSnowplow = 1 << 2,
  TagTrackerTune     = 1 << 3,
  TagTrackerGTM      = 1 << 4,
  TagTrackerNinja    = 1 << 5
};

@class BaseCategoryEntity, BaseNewListing, BaseAgentInfo;

@interface BaseNewTagObject : NSObject <NSCopying>

@property (strong, nonatomic, nullable) NSString *loggedInUserID;

@property (strong, nonatomic, nullable) NSString *filters;
@property (strong, nonatomic, nullable) NSString *nbResults;
@property (nonatomic, strong, nonnull)  NSString *screenName;
@property (nonatomic, strong, nonnull)  NSString *pageName;
@property (nonatomic, strong, nullable) NSString *pageIndex;
@property (nonatomic, strong, nullable) NSString *elementName;

@property (nonatomic, strong, nullable) NSString *categoryURI; // Removed categoryEntity as it was causing problems with threads
@property (nonatomic, strong, nullable) BaseNewListing *listing; // Listing

@property (nonatomic, assign) NSInteger listingPosition;

@property (nonatomic, strong, nullable) NSString *actionType;
@property (nonatomic, strong, nullable) NSString *keyword;
@property (nonatomic, strong, nullable) NSString *cityURI;
@property (nonatomic, strong, nullable) NSString *cityName;

@property (nonatomic) TagAllowedTrackers allowedTrackers;
@property (nonatomic, strong, nullable) NSString *xtor;
@property (nonatomic, strong, nullable) NSString *tagSource; // used for x13 custom_payload stc
@property (nonatomic, strong, nullable) NSString *funnelSubSection;
@property (nonatomic, strong, nullable) NSString *funnelSubSubSection;
@property (nonatomic, strong, nullable) NSString *funnelPage;

// added tune boolean due to difficulties reading NS_Options in swift
@property (nonatomic, assign) BOOL sendToTune;
@property (strong, nonatomic, nullable) NSString *numberOfPhotos;
//@property (strong, nonatomic, nullable) NSString *;

@property (nonatomic, strong, nullable) BaseAgentInfo * agentInfo;
@property (nonatomic, strong, nullable) NSArray<BaseCategoryEntity*> *categoryObjectTree;
// new facebook params
@property (nonatomic, strong, nullable) NSString *fbOrderID;


+ (nonnull BaseNewTagObject*)tagObjectWithScreenName:(nonnull NSString*)screenName;
+ (nonnull BaseNewTagObject*)tagObjectWithScreenName:(nonnull NSString *)screenName
                                         elementName:(nonnull NSString*)elementName;

// use this method only when you don't have the whole listing object
// still required for situations when you only have the listing URI
+ (nonnull BaseNewTagObject*)tagObjectWithScreenName:(nonnull NSString*)screenName
                                         elementName:(nonnull NSString*)elementName
                                         categoryURI:(nonnull NSString *)categoryURI
                                          listingURI:(nonnull NSString*)listingURI;

// Had to create this method because TrackerTune tuples are
// not accessible in Swift
- (void)addTuneTracker;

@end

