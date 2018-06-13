//
//  BaseSnowPlow.m
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/6/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import "BaseSnowPlow.h"
#import "SPEmitter.h"
#import "SPEvent.h"
#import "SPSelfDescribingJson.h"
#import "SPSubject.h"
#import "SPTracker.h"
#import "BaseAgentInfo.h"
#import "NSString+Data.h"
#import "NSDictionary+Check.h"

#import <DBZTagManager/DBZTagManager-Swift.h>

@implementation BaseSnowPlow
+ (instancetype)sharedInstance {
  
  static BaseSnowPlow *sharedInstance = nil;
  static dispatch_once_t once;
  
  if (sharedInstance) {
    return sharedInstance;
  }
  
  dispatch_once(&once, ^{
    
    sharedInstance = [[BaseSnowPlow alloc] init];
    [sharedInstance initSectionsDictionary];
  });
  
  return sharedInstance;
}

- (void)initSectionsDictionary {
  // Custom initialization
  _snowplowSectionsDictionary = @{
                                  @"classifieds" : @"CL",
                                  @"property for sale" : @"SP",
                                  @"property for rent" : @"RP",
                                  @"jobs" : @"JB",
                                  @"jobs wanted" : @"JW",
                                  @"community" : @"CO",
                                  @"motors" : @"MT"};
  
  _kLPVURLPageNotification = @"kLPVURLPageNotification";
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(setPageURL:)
                                               name:[[BaseSnowPlow sharedInstance] kLPVURLPageNotification]
                                             object:nil];
}

- (void)setPageURL:(NSNotification *)notification {
  NSDictionary *userInfo = [notification userInfo];
  
  if ([userInfo objectForKey:@"pageUrl"]) {
    NSString *purl = [[NSString alloc] initWithFormat:@"%@", [userInfo objectForKey:@"pageUrl"]];
    _pageURL = purl;
  }
}

#pragma mark - SETTINGS

+ (NSString *)getSnowplowTrackerEndpoint {
#if DEBUG
  return @"dbz-stage-analytics.elasticbeanstalk.com";
#else
  return @"tracker.dbzstatic.com";
#endif
}

+ (NSString *)getSnowplowLeadContextSchema {
  return @"iglu:com.dubizzle/lead_tracking/jsonschema/1-0-0";
}

+ (NSString *)getSnowplowDPVContextSchema {
  return @"iglu:com.dubizzle/detail_page_view/jsonschema/1-0-0";
}

+ (NSString *)getSnowplowLPVContextSchema {
  return @"iglu:com.dubizzle/list_page_view/jsonschema/1-0-0";
}

#pragma mark - EMITTER

+ (SPEmitter *)getSnowplowEmitterForUrl:(NSString *)url {
  return [SPEmitter build:^(id<SPEmitterBuilder> builder) {
    
    if (![BaseSnowPlow getSnowplowTrackerEndpoint].length) {
      
      return;
    }
    
    [builder setUrlEndpoint:[BaseSnowPlow getSnowplowTrackerEndpoint]]; // Required
    [builder setHttpMethod:SPRequestPost]; // Optional
    [builder setProtocol:SPHttps]; // Optional
    //    [builder setCallback:self]; // Optional
    [builder setEmitThreadPoolSize:1]; // Optional
  }];
}

#pragma mark - TRACKER

+ (SPTracker *)getSnowplowTrackerWithEmitter:(SPEmitter *)emitter {
  return [SPTracker build:^(id<SPTrackerBuilder> builder) {
    [builder setEmitter:emitter]; //required
    
    //    SPSubject *subject = [[SPSubject alloc] init];
    //    [subject setUserId:listing.listingUserID];
    //    [builder setSubject:subject]; //optional
  }];
}

#pragma mark - STRUCTURED EVENT

+ (SPStructured *)getSnowplowStructuredEventWithCategory:(NSString *)category
                                                  action:(NSString *)action
                                    structuredDictionary:(NSDictionary *)structuredDictionary
                                           contextSchema:(NSString *) contextSchema {
  if (!category.length) {
    // #warning @"Snowplow : Category cannot be nil or empty."
    //    @throw NSInternalInconsistencyException;
    //    exit(0);
    return nil;
  }
  
  return [SPStructured build: ^(id<SPStructuredBuilder> builder) {
    
    if (category.length)
      [builder setCategory:category];
    
    if (action.length)
      [builder setAction:action];
    
    // NOTE : All contexts must be SelfDescribingJson objects.
    SPSelfDescribingJson *sdj = [[SPSelfDescribingJson alloc] initWithSchema:contextSchema
                                                                     andData:structuredDictionary];
    
    [builder setContexts:[NSMutableArray arrayWithArray:@[sdj]]];
  }];
}

#pragma mark - PAGE VIEW EVENT

+ (SPPageView *)getSnowplowPageViewEventWithPageURL:(NSString *)pageURL
                                     customContexts:(NSDictionary *)customContexts
                                             schema:(NSString *)schema {
  
  if (!pageURL.length) {
    // #warning @"Snowplow : PageURL cannot be nil or empty."
    //    @throw NSInternalInconsistencyException;
    //    exit(0);
    return nil;
  }
  
  return [SPPageView build:^(id<SPPageViewBuilder> builder) {
    [builder setPageUrl:pageURL];
    
    // NOTE : All contexts must be SelfDescribingJson objects.
    SPSelfDescribingJson *sdj = [[SPSelfDescribingJson alloc] initWithSchema:schema
                                                                     andData:customContexts];
    
    [builder setContexts:[NSMutableArray arrayWithArray:@[sdj]]];
  }];
}

#pragma mark - LEAD

+ (void)sendSnowplowLeadWithCategory:(BaseCategoryEntity *)category
                             listing:(BaseNewListing *)listing
                            leadType:(NSString*)leadType {
  
  NSString *listingEncoded = [[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:listing.uri];
  
  if ([listingEncoded categoryID] && listingEncoded.length) {
    
    SPEmitter *emitter = [BaseSnowPlow getSnowplowEmitterForUrl:[BaseSnowPlow getSnowplowTrackerEndpoint]];
    
    if (!emitter) {
      
      return;
    }
    
    SPTracker *tracker = [BaseSnowPlow getSnowplowTrackerWithEmitter:emitter];
    
    NSString *actionType = [NSString stringWithFormat:@"%@-lead", leadType];
    
    // NOTE : All properties are required to be set as integer primitive type.
    NSMutableDictionary *structuredDictionary = [NSMutableDictionary new];
    
    if ([listingEncoded categoryID].length) {
      [structuredDictionary setObject:[NSNumber numberWithInt:[[listingEncoded categoryID] intValue]]
                               forKey:@"categoryId"];
    }
    if ([listingEncoded listingID].length) {
      [structuredDictionary setObject:[NSNumber numberWithInt:[[listingEncoded listingID] intValue]]
                               forKey:@"listingId"];
    }
    if ([listingEncoded cityID].length) {
      [structuredDictionary setObject:[NSNumber numberWithInt:[[listingEncoded cityID] intValue]]
                               forKey:@"siteId"];
    }
    if (listing.listingUserID.length) {
      [structuredDictionary setObject:[NSNumber numberWithInt:listing.listingUserID.intValue]
                               forKey:@"userId"];
    }
    
    if (listing.agentInfo.ID && listing.agentInfo.ID.integerValue > 0) {
      [structuredDictionary setObject:listing.agentInfo.ID
                               forKey:@"agentId"];
    }
    if (listing.feedID.length) {
      [structuredDictionary setObject:[NSNumber numberWithInt:listing.feedID.intValue]
                               forKey:@"feedId"];
    }
    
    SPStructured *structured = [BaseSnowPlow getSnowplowStructuredEventWithCategory:@"leads"
                                                                            action:actionType
                                                              structuredDictionary:structuredDictionary
                                                                     contextSchema:[BaseSnowPlow getSnowplowLeadContextSchema]];
    [tracker trackStructuredEvent:structured];
  }
}

#pragma mark - DPV

+ (void)sendSnowplowDPVWithCategory:(BaseCategoryEntity *)category
                            listing:(BaseNewListing *)listing
                            section:(NSString *)section {
  
  NSString *listingEncoded = [[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:listing.uri];
  
  // categoryId + listingId + section are required
  if (listingEncoded.length &&
      [listingEncoded categoryID] &&
      [listingEncoded listingID] &&
      section.length) {
    
    SPEmitter *emitter = [BaseSnowPlow getSnowplowEmitterForUrl:[BaseSnowPlow getSnowplowTrackerEndpoint]];
    
    if (!emitter) {
      
      return;
    }
    
    SPTracker *tracker = [BaseSnowPlow getSnowplowTrackerWithEmitter:emitter];
    
    // NOTE : All properties are required to be set as integer primitive type.
    NSMutableDictionary *customContexts = [NSMutableDictionary new];
    
    if ([listingEncoded categoryID].length) {
      [customContexts setObject:[NSNumber numberWithInt:[[listingEncoded categoryID] intValue]]
                         forKey:@"categoryId"];
    }
    if ([listingEncoded listingID].length) {
      [customContexts setObject:[NSNumber numberWithInt:[[listingEncoded listingID] intValue]]
                         forKey:@"listingId"];
    }
    if (listing.listingUserID.length) {
      [customContexts setObject:[NSNumber numberWithInt:listing.listingUserID.intValue]
                         forKey:@"userId"];
    }
    if (section.length)
      [customContexts setObject:section
                         forKey:@"section"];
    
    if (customContexts != nil) {
      SPPageView *pageView = [BaseSnowPlow getSnowplowPageViewEventWithPageURL:listing.permaLink ?: @"https://kombi.dubizzle.com/"
                                                               customContexts:customContexts
                                                                       schema:[BaseSnowPlow getSnowplowDPVContextSchema]];
      [tracker trackPageViewEvent:pageView];
    }
  }
}

#pragma mark - LPV

+ (void)sendSnowplowLPVWithSearchCategoryIDs:(NSArray <NSNumber *> *)searchCategoryIDs
                            mainCategoryName:(NSString *)mainCategoryName
                           dictionaryFilters:(NSDictionary *)dictionaryFilters
                               arrayListings:(NSArray *)arrayListings
               snowplowMultiplierLoadMoreAds:(NSInteger)snowplowMultiplierLoadMoreAds
                                      userID:(NSString *)userID {
  
  SPEmitter *emitter = [BaseSnowPlow getSnowplowEmitterForUrl:[BaseSnowPlow getSnowplowTrackerEndpoint]];
  
  if (!emitter) {
    
    return;
  }
  
  SPTracker *tracker = [BaseSnowPlow getSnowplowTrackerWithEmitter:emitter];
  
  // NOTE : All properties are required to be set as integer primitive type.
  NSMutableDictionary *customContexts = [NSMutableDictionary new];
  
  //*********
  
  if ([searchCategoryIDs count] > 0) {
    [customContexts setObject:[searchCategoryIDs objectAtIndex:0] forKey:@"rc"];
  }
  
  if ([searchCategoryIDs count] > 1) {
    [customContexts setObject:[searchCategoryIDs objectAtIndex:1] forKey:@"c1"];
  }
  
  if ([searchCategoryIDs count] > 2) {
    [customContexts setObject:[searchCategoryIDs objectAtIndex:2] forKey:@"c2"];
  }
  
  if ([searchCategoryIDs count]) {
    
    [customContexts setObject:[NSNumber numberWithInt:1]
                       forKey:@"isSearch"];
    
    NSString *section = mainCategoryName;
    
    if (section.length) {
      [customContexts setObject:section
                         forKey:@"section"];
    }
  }
  
  // KOMBI FORMAT FOR FILTERS
  if (dictionaryFilters.allKeys.count) {
    
    NSMutableArray *arrayPlaces = [NSMutableArray new];
    
    if ([dictionaryFilters checkKey:@"keywords"]) {
      [customContexts setObject:[dictionaryFilters checkAndSet:@"keywords"] forKey:@"keywords"];
    }
    
    if ([dictionaryFilters objectForKey:@"price__gte"]) {
      
      //      [customContexts setObject:[dictionaryFilters checkAndSet:@"price__gte"] forKey:@"priceGTE"];
      
      NSNumber *pGTE = [NSNumber numberWithInteger:[[dictionaryFilters checkAndSet:@"price__gte"] integerValue]];
      [customContexts setObject:pGTE forKey:@"priceGTE"];
    }
    
    if ([dictionaryFilters objectForKey:@"price__lte"]) {
      
      //      [customContexts setObject:[dictionaryFilters checkAndSet:@"price__lte"] forKey:@"priceLTE"];
      NSNumber *pGTE = [NSNumber numberWithInteger:[[dictionaryFilters checkAndSet:@"price__lte"] integerValue]];
      [customContexts setObject:pGTE forKey:@"priceLTE"];
    }
    
    
    if ([dictionaryFilters checkKey:@"year__gte"]) {
      [customContexts setObject:[NSNumber numberWithInt:[[dictionaryFilters checkAndSet:@"year__gte"] intValue]]
                         forKey:@"yearGTE"];
    }
    if ([dictionaryFilters checkKey:@"year__lte"]) {
      [customContexts setObject:[NSNumber numberWithInt:[[dictionaryFilters checkAndSet:@"year__lte"] intValue]]
                         forKey:@"yearLTE"];
    }
    if ([dictionaryFilters checkKey:@"bedrooms__gte"]) {
      
      //      [customContexts setObject:[dictionaryFilters checkAndSet:@"bedrooms__gte"]
      //                         forKey:@"bedroomsGTE"];
      NSString *bGTE = [dictionaryFilters checkAndSet:@"bedrooms__gte"];
      
      if ([bGTE isEqualToString:@"Studio"] || [bGTE isEqualToString:@"استوديو"]) {
        
        [customContexts setObject:[NSNumber numberWithInteger:0]
                           forKey:@"bedroomsGTE"];
      } else {
        
        [customContexts setObject:[NSNumber numberWithInteger:bGTE.integerValue]
                           forKey:@"bedroomsGTE"];
      }
    }
    if ([dictionaryFilters checkKey:@"bedrooms__lte"]) {
      
      //      [customContexts setObject:[dictionaryFilters checkAndSet:@"bedrooms__lte"]
      //                         forKey:@"bedroomsLTE"];
      NSString *bLTE = [dictionaryFilters checkAndSet:@"bedrooms__lte"];
      
      if ([bLTE isEqualToString:@"Studio"] || [bLTE isEqualToString:@"استوديو"]) {
        
        [customContexts setObject:[NSNumber numberWithInteger:0]
                           forKey:@"bedroomsLTE"];
      } else {
        
        [customContexts setObject:[NSNumber numberWithInteger:bLTE.integerValue]
                           forKey:@"bedroomsLTE"];
      }
    }
    
    if ([dictionaryFilters objectForKey:@"cities"]) {
      
      NSString *cityUri = [dictionaryFilters checkAndSet:@"cities"];
      
      NSString *cityID = [[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:cityUri];
      
      if ([cityID intValue]) {
        [customContexts setObject:[NSNumber numberWithInt:[cityID intValue]]
                           forKey:@"cityId"];
      }
    }
    
    //**************
    // NEIGHBOURHOOD
    //**************
    if ([dictionaryFilters checkKey:@"places.en"] || [dictionaryFilters checkKey:@"places.ar"]) {
      
      id neighbourhoods = [[[DBZTagManagerDelegate shared] protocolHandler] isDeviceLanguageRTL] ?
      [dictionaryFilters checkAndSet:@"places.ar"] :
      [dictionaryFilters checkAndSet:@"places.en"];
      
      if ([neighbourhoods isKindOfClass:[NSString class]]) {
        
        NSString *neighbourhoodURI = (NSString *)neighbourhoods;
        
        NSString *neighbourhoodID = [[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:neighbourhoodURI];
        
        if ([neighbourhoodID intValue]) {
          [arrayPlaces addObject:[NSNumber numberWithInt:[neighbourhoodID intValue]]];
        }
        
      } else if ([neighbourhoods isKindOfClass:[NSArray class]]) {
        
        for (NSString *uri in neighbourhoods) {
          
          NSString *neighbourhoodID = [[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:uri];
          
          if ([neighbourhoodID intValue]) {
            [arrayPlaces addObject:[NSNumber numberWithInt:[neighbourhoodID intValue]]];
          }
        }
        
      }
    }
    
    if (arrayPlaces.count) {
      [customContexts setObject:arrayPlaces
                         forKey:@"places"];
    }
  }
  
  //**************
  
  //*********
  // LISTINGS
  //*********
  if (arrayListings.count) {
    
    NSMutableArray *listings = [NSMutableArray new];
    
    for (int idx = 0; idx < arrayListings.count; idx++) {
      
      BaseNewListing *listing = arrayListings[idx];
      NSString *listingEncoded = [[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:listing.uri];
      
      BOOL isFeaturedAd = listing.promotedAd || listing.featuredListing || listing.highlightedAd ? YES : NO;
      
      [listings addObject:@{
                            @"position" : [NSNumber numberWithInteger:(snowplowMultiplierLoadMoreAds * arrayListings.count) + idx + 1],
                            @"featured" : [NSNumber numberWithBool:isFeaturedAd],
                            @"categoryId" : [NSNumber numberWithInt:[[listingEncoded categoryID] intValue]],
                            @"listingId" : [NSNumber numberWithInt:[[listingEncoded listingID] intValue]]}];
    }
    
    [customContexts setObject:listings
                       forKey:@"listings"];
  }
  //*********
  
  NSLog(@"customContexts: %@", [customContexts description]);
  
  if (userID.length) {
    [customContexts setObject:[NSNumber numberWithInt:userID.intValue]
                       forKey:@"userId"];
  }
  
  if (customContexts != nil) {
    SPPageView *pageView = [BaseSnowPlow getSnowplowPageViewEventWithPageURL:[[BaseSnowPlow sharedInstance] pageURL].length ?
                            [NSString stringWithFormat:@"https://kombi.dubizzle.com/%@", [[BaseSnowPlow sharedInstance] pageURL]] :
                            @"https://kombi.dubizzle.com/"
                                                             customContexts:customContexts
                                                                     schema:[BaseSnowPlow getSnowplowLPVContextSchema]];
    [tracker trackPageViewEvent:pageView];
  }
}

@end
