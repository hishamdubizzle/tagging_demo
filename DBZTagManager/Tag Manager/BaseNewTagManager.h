//
//  BaseNewTagManager.h
//  DubizzleHorizontal
//
//  Created by Taimur Ajmal on 7/5/17.
//  Copyright © 2017 dubizzle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TagLeadType) {
  TagLeadTypeCall = 0,
  TagLeadTypeSMS,
  TagLeadTypeEmail,
  TqgLeadTypeChat,
  TagLeadTypeNoLead,
  TagLeadTypeChatCall,
  TagLeadTypeMakeAnOffer
};

@class BaseNewListing, BaseCategoryEntity, BaseNewTagObject;

@interface BaseNewTagManager : NSObject

+ (void)sendTag:(BaseNewTagObject*)tagObject;
+ (void)sendJobFieldValidationFailed:(NSString*)fieldName;
+ (void)sendFacebookEvent:(NSString*)event;
+ (void)sendFacebookEvent:(NSString *)event tagObject:(BaseNewTagObject *)tagObject;
+ (void)sendLeadFromPage:(NSString*)pageName
                category:(BaseCategoryEntity*)category
                 listing:(BaseNewListing*)listing
                leadType:(TagLeadType)leadType
         listingPosition:(NSInteger)listingPosition
        funnelSubSection:(NSString *)funnelSubSection
     funnelSubSubSection:(NSString *)funnelSubSubSection;
+ (void)sendApptimizeTag:(NSString*)tagName;
+ (void)sendNinjaTagWith:(NSString *)name
                  pushID:(NSString *)pushID
             resultCount:(NSNumber *)resultCount;

+ (NSString *)generateLeadTag:(NSString *)tagName listing:(BaseNewListing *)listing;

#pragma mark - Tag source getting and setter

+ (void)setTagSource:(NSString *)source;
+ (NSString *)tagSource;
+ (void)setTagXtor:(NSString*)xtor;
+ (NSString *)tagXtor;

@end
