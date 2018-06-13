//
//  BaseNewTagObject.m
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/5/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import "BaseNewTagObject.h"
#import "BaseAgentInfo.h"
#import "BaseNewListing.h"
#import "BaseNewTagManager.h"
#import "BaseCategoryEntity.h"

@implementation BaseNewTagObject

- (instancetype)init {
  self = [super init];
  if (self) {
    // set default trackers
    self.allowedTrackers = (TagTrackerATI | TagTrackerGTM | TagTrackerNinja);
    self.tagSource = [BaseNewTagManager tagSource];
    self.xtor = [BaseNewTagManager tagXtor];
    self.listingPosition = -1;
  }
  return self;
}

+ (BaseNewTagObject*)tagObjectWithScreenName:(NSString *)screenName {
  
  BaseNewTagObject *tagObject = [[BaseNewTagObject alloc]init];
  tagObject.screenName = screenName;
  return tagObject;
}

+ (BaseNewTagObject*)tagObjectWithScreenName:(NSString *)screenName
                                 elementName:(NSString *)elementName {
  
  BaseNewTagObject *tagObject = [[BaseNewTagObject alloc]init];
  tagObject.screenName = screenName;
  tagObject.elementName = elementName;
  return tagObject;
}

+ (BaseNewTagObject*)tagObjectWithScreenName:(NSString *)screenName
                                 elementName:(NSString *)elementName
                                 categoryURI:(NSString *)categoryURI
                                  listingURI:(NSString *)listingURI {
  
  BaseNewTagObject *tagObject = [[BaseNewTagObject alloc]init];
  tagObject.screenName = screenName;
  tagObject.elementName = elementName;
  tagObject.categoryURI = categoryURI;
  tagObject.listing.uri = listingURI;
  return tagObject;
}

- (void)addTuneTracker {
  self.allowedTrackers |= TagTrackerTune;
}

- (id)copyWithZone:(nullable NSZone *)zone {
  
  BaseNewTagObject *tagObject = [[BaseNewTagObject alloc] init];
  tagObject.loggedInUserID = self.loggedInUserID;
  tagObject.filters = self.filters;
  tagObject.nbResults = self.nbResults;
  tagObject.listingPosition = self.listingPosition;
  tagObject.screenName = self.screenName;
  tagObject.elementName = self.elementName;
  tagObject.categoryURI = self.categoryURI;
  tagObject.listing = self.listing;
  tagObject.actionType = self.actionType;
  tagObject.keyword = self.keyword;
  tagObject.cityURI = self.cityURI;
  tagObject.allowedTrackers = self.allowedTrackers;
  tagObject.xtor = self.xtor;
  tagObject.tagSource = self.tagSource;
  tagObject.funnelSubSubSection = self.funnelSubSubSection;
  tagObject.funnelSubSection = self.funnelSubSection;
  tagObject.fbOrderID = self.fbOrderID;
  tagObject.sendToTune = self.sendToTune;
  tagObject.agentInfo = self.agentInfo;
  tagObject.categoryObjectTree = self.categoryObjectTree;
  
  
  return tagObject;
}

@end


