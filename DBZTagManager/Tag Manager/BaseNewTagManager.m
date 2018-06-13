//
//  BaseNewTagManager.m
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/5/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import "BaseNewTagManager.h"

#import <Apptimize/Apptimize.h>
#import <FBSDKCoreKit/FBSDKAppEvents.h>
#import <NCNinja/NCNinja.h>
#import <NCNinja/NCParams.h>


#import "BaseCategoryEntity.h"
#import "BaseSnowPlow.h"
#import "BaseNewTagObject.h"
#import "BaseNewListing.h"
#import "BaseAgentInfo.h"
#import "BaseNewListing.h"
#import "NSString+Data.h"
#import "ATIConstants.h"

#import <DBZTagManager/DBZTagManager-Swift.h>

@implementation BaseNewTagManager

static NSString *tagSource = nil;
static NSString *tagXtor = nil;

//*****************************************************
// EXCEPTION FOR ONE SPECIAL TAG FOR GOOGLE TAG MANAGER
//*****************************************************
+ (NSString *)generateLeadTag:(NSString *)tagName listing:(BaseNewListing *)listing {
  NSMutableString *tagString = [NSMutableString stringWithFormat:@"%@", tagName];
  if ([listing.name length]) {
    [tagString appendFormat:@"_%@", listing.name];
    if ([listing.phoneNumber length]) {
      [tagString appendFormat:@"_%@", listing.phoneNumber];
    }
  }
  return tagString;
}

+ (void)sendTag:(BaseNewTagObject *)tagObject {
  
  // if the category is not there
  // and listing URI is there
  // get it from the URI
  
  

  

  
  //************************
  // Send Screen Tags to Tune
  //************************
 
  
 
  
//  // if we have the tracking type specified as Ninja tracker then we fire the tag.
//  if(tagObject.allowedTrackers & TagTrackerNinja || !tagObject.allowedTrackers) {
//    // element name represents our event and screen name represents a page view.
//    NSDictionary *ninjaParams = [BaseNewTagManager buildParams:tagObject];
//    NSString *ninjaEvent = (tagObject.elementName != nil && tagObject.elementName.length) ? tagObject.elementName : tagObject.screenName;
//    NSLog(@"Ninja params: %@", ninjaParams);
//    NSLog(@"Ninja event: %@", ninjaEvent);
//    [NCNinja trackEvent:ninjaEvent params:ninjaParams];
//  }
}

//+ (NSDictionary*) buildParams:(BaseNewTagObject*)tagObject {
//
//  NSMutableDictionary* params = [[NSMutableDictionary alloc] init];
//
//  NSString *ninjaCategoryID = [[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:tagObject.categoryURI];
//  params[NCNINJA_CATEGORY_ID] = ninjaCategoryID;
//
//  NSString *ninjaAdID = tagObject.listing.listingID;
//  params[NCNINJA_AD_ID] = ninjaAdID;
//
//  if (tagObject.fbOrderID.length && ![tagObject.fbOrderID hasPrefix:@"l-"]) {
//    params[@"matcher_id"] = [tagObject.fbOrderID substringFromIndex:2];
//  }
//
//  NSString *listingType = [[NSString alloc] init];
//  if (tagObject.listing.promotedAd){
//    listingType =  [NSMutableString stringWithString: @"promoted"];
//  }
//
//  if ([tagObject.funnelSubSubSection hasPrefix:@"CF_"]) {
//    params[@"userPath"] = @"ContentFirst";
//    NSString *cfAlgorithm = [tagObject.funnelSubSubSection substringFromIndex:3];
//    [cfAlgorithm stringByReplacingOccurrencesOfString:@"|" withString:@","];
//    params[@"CFalgorithm"] = cfAlgorithm;
//  }
//
//  if (tagObject.listing.featuredListing) {
//    listingType = listingType.length > 0 ? [NSString stringWithFormat:@"%@,featured",listingType] : @"featured" ;
//  }
//
//  if (tagObject.listing.verifiedAd) {
//    listingType = listingType.length > 0 ? [NSString stringWithFormat:@"%@,verified",listingType] : @"verified" ;
//  }
//
//  if (listingType.length) {
//    params[@"listingType"] = listingType;
//  }
//
//  NSString *userID = [[[DBZTagManagerDelegate shared] protocolHandler] getUserId];
//
//  if (userID.length) {
//    params[NCNINJA_USER_ID] = userID;
//  }
//
//  NSInteger i = 1;
//
//  for (BaseCategoryEntity *category in tagObject.categoryObjectTree) {
//    NSString *keyFormat = [NSString stringWithFormat:@"cL%ldId", (long)i];
//    params[keyFormat] = category.categoryID;
//    i++;
//  }
//
//  NSString *cityId = [[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:tagObject.cityURI];
//
//  if (cityId.length) {
//    params[NCNINJA_CITY_ID] = cityId;
//  }
//
//  if (tagObject.pageName.length) {
//
//    params[NCNINJA_RESULT_SET] = [tagObject.pageName isEqualToString:@"Search_LPV"] ? @"search" : @"browse";
//  } else if (tagObject.screenName.length) {
//
//    params[NCNINJA_RESULT_SET] = [tagObject.screenName isEqualToString:@"Search_LPV"] ? @"search" : @"browse";
//  }
//
//  params[NCNINJA_IMAGES_COUNT] = @([tagObject.listing.photoCount integerValue]);
//
//  return params;
//}

+ (void)sendJobFieldValidationFailed:(NSString *)fieldName {
  
  NSString *tagName = [NSString stringWithFormat:JOBS_APPLY_FAILED_VALIDATION, fieldName];
  
  BaseNewTagObject *tagObject =
  [BaseNewTagObject tagObjectWithScreenName:JOB_APPLY_PAGE
                            elementName:tagName];
  [BaseNewTagManager sendTag:tagObject];
}

+ (void)sendFacebookEvent:(NSString *)event {
  if (![event length]) {
    return;
  }
  [FBSDKAppEvents logEvent:event];
}

+ (void)sendFacebookEvent:(NSString *)event tagObject:(BaseNewTagObject *)tagObject {
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^ {
    if (![event length]) {
      return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    // tag listing ID
    if ([tagObject.listing.listingID length]) {
      [params setObject:tagObject.listing.listingID forKey:FB_TAG_CONTANT_LISTING_ID];
    } else if ([tagObject.listing.uri length] && [[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:tagObject.listing.uri].length) {
      [params setObject:[[[DBZTagManagerDelegate shared] protocolHandler] getLastElementFromURI:tagObject.listing.uri].listingID forKey:FB_TAG_CONTANT_LISTING_ID];
    }
    
    // tag categories
    if ([tagObject.categoryObjectTree count]) {
      //NSManagedObjectContext *context = [[[CoreDataWrapper alloc] init] createContext];
      //BaseCategoryEntity *category = [[DubizzleData sharedInstance] getBaseCategoryWithURI:tagObject.categoryURI inContext:context];
      NSArray<BaseCategoryEntity*>  *categoryTree = tagObject.categoryObjectTree;
      if (categoryTree.count > 0) {
        
        //NSArray<BaseCategoryEntity*> *categoryTree = category.categoryObjectTree;
        
        if (categoryTree.count > 0 && categoryTree[0].staticIdentifier.length) {
          [params setObject:categoryTree[0].staticIdentifier forKey:FB_TAG_CONSTANT_L1];
        }
        
        if (categoryTree.count > 1 && categoryTree[1].staticIdentifier.length) {
          [params setObject:categoryTree[1].staticIdentifier forKey:FB_TAG_CONSTANT_L2];
        }
        
        if (categoryTree.count > 2 && categoryTree[2].staticIdentifier.length) {
          [params setObject:categoryTree[2].staticIdentifier forKey:FB_TAG_CONSTANT_L3];
        }
        
        if (categoryTree.count > 3 && categoryTree[3].staticIdentifier.length) {
          [params setObject:categoryTree[3].staticIdentifier forKey:FB_TAG_CONSTANT_L4];
        }
      }
    }
    
    if ([tagObject.fbOrderID length]) {
      [params setObject:tagObject.fbOrderID forKey:@"fb_order_id"];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^ {
      NSLog(@"FACEBOOK PARAMS : %@ event name : %@", params, event);
    });
    
    [FBSDKAppEvents logEvent:event parameters:params];
  });
  
}

+ (void)sendLeadFromPage:(NSString*)pageName
                category:(BaseCategoryEntity*)category
                 listing:(BaseNewListing*)listing
                leadType:(TagLeadType)leadType
         listingPosition:(NSInteger)listingPosition
        funnelSubSection:(NSString *)funnelSubSection
     funnelSubSubSection:(NSString *)funnelSubSubSection {

       if (![pageName length]) {
    return;
  }
  
  [Apptimize track:@"property_cta_all_leads"];
    
  BaseNewTagObject *leadtag = [BaseNewTagObject tagObjectWithScreenName:pageName];
  leadtag.categoryURI   = category.uri;
  leadtag.listing       = listing;
  leadtag.listingPosition = listingPosition;
  leadtag.funnelSubSection = funnelSubSection;
  
  if (funnelSubSection.length) {
    
    leadtag.funnelSubSection = funnelSubSection;
  }
  
  if (funnelSubSubSection.length) {
    
    leadtag.funnelSubSubSection = funnelSubSubSection;
  }
  
  NSString *actionType = nil, *elementName = nil;
  
  if (leadType == TagLeadTypeSMS) {
    actionType  = ATIActionTypeSMS;
    elementName = ATISMSSent;
    [BaseNewTagManager sendFacebookEvent:FACEBOOK_SMS_LEAD tagObject:leadtag];
    
    [Apptimize track:@"property_cta_sms_lead"];
    
  } else if (leadType == TagLeadTypeEmail) {
    actionType  = ATIActionTypeEmail;
    elementName = ATIEmailSent;
    [BaseNewTagManager sendFacebookEvent:FACEBOOK_EMAIL_LEAD tagObject:leadtag];
    
    [Apptimize track:@"property_cta_email_lead"];
    
  } else if (leadType == TagLeadTypeCall){
    actionType  = ATIActionTypeCall;
    elementName = ATIPageCallMade;
    [BaseNewTagManager sendFacebookEvent:FACEBOOK_CALL_LEAD tagObject:leadtag];
    
    [Apptimize track:@"property_cta_call_lead"];
  }
  
  leadtag.elementName     = elementName;
  leadtag.actionType      = actionType;
  // Include specified trackers to send to.
  leadtag.allowedTrackers = TagTrackerATI | TagTrackerGTM;// | TrackerTune | TrackerNinja;
  // removed tune and ninja ans they will be sent later in the code below
  
  [[[DBZTagManagerDelegate shared] protocolHandler] addCategoryTreeWithCategoryURI:category.uri tagObject:leadtag];
  
  [BaseNewTagManager sendTag:leadtag];
  
  [BaseSnowPlow sendSnowplowLeadWithCategory:category
                                     listing:listing
                                    leadType:elementName];
  
  // new facebook tag
  // this string is not public in the SDK
  // thats why manually set to align with android
  [BaseNewTagManager sendFacebookEvent:@"fb_mobile_purchase" tagObject:leadtag];
  // facebook order ID
  NSString *fbOrderID = [[NSProcessInfo processInfo] globallyUniqueString];
  BaseNewTagObject *fbLeadTag = [leadtag copy];
  fbLeadTag.fbOrderID = [NSString stringWithFormat:@"r-%@", fbOrderID];
  fbLeadTag.allowedTrackers = TagTrackerTune | TagTrackerNinja;
  [BaseNewTagManager sendTag:fbLeadTag];
  [BaseNewTagManager sendFacebookEvent:FBSDKAppEventNameAddedPaymentInfo
                         tagObject:fbLeadTag];
}

+ (void)sendNinjaTagWith:(NSString *)name
                  pushID:(NSString *)pushID
             resultCount:(NSNumber *)resultCount {
  
  NSString *userID = [[[DBZTagManagerDelegate shared] protocolHandler] getUserId];
  
  NSMutableDictionary *params = [NSMutableDictionary dictionary];
  if ([userID length]) {
    [params setObject:userID forKey:NCNINJA_USER_ID];
  }
  if ([pushID length]) {
    [params setObject:pushID forKey:NCNINJA_PUSH_ID];
  }
  if (resultCount) {
    [params setObject:resultCount forKey:NCNINJA_RESULT_COUNT];
  }
  
  [NCNinja trackEvent:name params:params];
}

+ (void)sendApptimizeTag:(NSString *)tagName {
  
  if (![tagName length]) {
    return;
  }
  
  [Apptimize track:tagName];
}

#pragma mark - Tag source getting and setter

+ (void)setTagSource:(NSString *)source {
  tagSource = source;
}

+ (NSString *)tagSource {
  return tagSource;
}

+ (void)setTagXtor:(NSString*)xtor {
  tagXtor = xtor;
}

+ (NSString *)tagXtor {
  return tagXtor;
}

@end

