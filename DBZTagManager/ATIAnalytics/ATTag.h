//+---------------------------------------------------------------------------+
//| Copyright (c) 2014 AT Internet.											  |
//| All rights reserved.                                                      |
//| For help with this library contact support@atinternet.com                 |
//| Version Tag 1.5.000                                                       |
//+---------------------------------------------------------------------------+
/*! \mainpage 
 *
 * \section intro_sec Introduction
 *
 * This is a AT Internet documentation about its iOS library 
 */
/*!
 @file ATTag.h
 \brief Helper class to send stats.
 
 This class has the singleton containing all main data and configuration in order to send hits. It's the main class of this library. You use it for functionnality settings (e.g. offline, background task, debug) or configuration settings (e.g. siteId, server subdomain, uniqueId) or functionnality using (e.g. getNbHitsOffline, sendNow, deleteHitsOffline, setDebug)
 Tagging is to do with ATParams class.
 */

#import <Foundation/Foundation.h>
#import <sqlite3.h>
/*! @enum OfflineMode used to set/check offline mode */
typedef enum {
    /*! Never store hits, even if network is offline */
	OfflineModeNever,
    /*! Store hits when network is offline, try to send stored hits when network is online (at the moment the application is trying to send a hit) */
	OfflineModeRequired,
    /*! Always store hits, you send them with the sendNow function */
	OfflineModeAlways,
} OfflineMode;
/*!
	@class ATTag 
	\brief Helper class to send stats.
 
	This class has the singleton containing all main data and configuration in order to send hits. It's the main class of this library. You use it for functionnality settings (e.g. offline, background task, debug) or configuration settings (e.g. siteId, server subdomain, uniqueId) or functionnality using (e.g. getNbHitsOffline, sendNow, deleteHitsOffline, setDebug)
        Tagging is to do with ATParams class.
	*/
@interface ATTag : NSObject{
    /*! Receiving server subdomain */
	NSString *subdomain;
    /*! log domain */
	NSString *logDomain;
    /*! Site id */
	NSString *siteId;
    /*! Visitor id */
	NSString *uniqueId;
    /*! Protocol Url */
    NSString *protocolUrl;
    /*! Phone information */
	NSDictionary *phoneInfos;
    /*! Operation queue */
	NSOperationQueue *operationQueue;
    /*! Offline mode (never/required/always) */
	OfflineMode offlineMode;
    /*! Check for debug use */
	BOOL AT_debug;
    /*! Check if background task is allowed */
    BOOL bgTaskEnabled;
    /*! Background task */
    UIBackgroundTaskIdentifier bgTask;
}
/*! @property subdomain */
@property (nonatomic, retain) NSString *subdomain;
/*! @property logdomain */
@property (nonatomic, retain) NSString *logDomain;
/*! @property siteId */
@property (nonatomic, retain) NSString *siteId;
/*! @property phoneInfos */
@property (nonatomic, retain) NSDictionary *phoneInfos;
/*! @property operationQueue */
@property (retain,nonatomic) 	NSOperationQueue *operationQueue;
/*! @property offlineMode */
@property (nonatomic) OfflineMode offlineMode;
/*! @property AT_debug */
@property (nonatomic, assign) BOOL AT_debug;
/*! @property bgTaskEnabled */
@property (nonatomic, assign) BOOL bgTaskEnabled;
/*! @property bgTask */
@property (nonatomic, assign) UIBackgroundTaskIdentifier bgTask;
/*! @property uniqueId */
@property (nonatomic, retain) NSString *uniqueId;
/*! @property protocolUrl */
@property (nonatomic, retain) NSString *protocolUrl;

@property (nonatomic, retain) NSMutableString *output;

// Flag permettant d'indiquer si iOS effectue un background fetch
@property (nonatomic, assign) BOOL isPerformingBackgroundFetch;

/*! Subdomain key in plist file */
#define ATTagInfoSubDomain	@"ATTagInfoSubDomain"
/*! Site ID key in plist file */
#define ATTagInfoSiteId		@"ATTagInfoSiteId"


/*!
 @function
 \brief   Singleton
 
 Init only one instance of ATTag
 @return     Return the instance of ATTag
 */
+ (ATTag *)sharedATTag;
/*!
 @function
 \brief Get visitor ID
 
 If the ID doesn't exist in [[NSUserDefaults standardUserDefaults] objectForKey:\@"ATIdclient"], it is created and stored.
 @return self.uniqueId
 */
- (NSString *)getUniqueId;
/*!
 @function
 \brief initialize the ATTag singleton attributes
 @param subDomain
 @param siteIdIn
 */
- (ATTag *) initWithATSubDomain:(NSString *)subDomain  siteId:(NSString *)siteIdIn;
/*!
 @function
 \brief It only calls [self tagPage:page withDictionary:nil];
 
 just useless, do not use it, the tagging methodology should be the same for pages, clicks or other things, and so you should use ATParams to tag your pages/views
 @param page
 */
- (void) tagPage:(NSString *)page;
/*!
 @function
 \brief It only calls [self tagWithDefaultPath:[NSString stringWithFormat:\@"&p=%\@", page] otherParameters:aDictionary];
 
 just useless, do not use it, the tagging methodology should be the same for pages, clicks or other things, and so you should use ATParams to tag your pages. This function is directly used by ATParams
 @param page : value='' when the call comes from ATParams
 @param aDictionary : ATParams when the call comes from ATParams
 */
- (void) tagPage:(NSString*) page withDictionary:(NSDictionary *)aDictionary;
/*!
 @function
 \brief Construct a querystring
 
 It fills the variable hl (local hour) and calls [self launchRequest:path] where path is a querystring which contains filled tagging variables
 @param defaultPath Should be empty
 @param aDictionary Should be ATParams
 */
- (void) tagWithDefaultPath:(NSString *)defaultPath otherParameters:(NSDictionary *)aDictionary;
/*!
 @function
 \brief Constructs URL to request and creates the associated ATTagOperation
 
 It adds the tag version (vtag=1.x.xxx int hits) and phone information, and it checks network to send stored hits if necessary (because hits must be sent in the order they have been created)
 @param toAppend Querystring to add
 */
- (void) launchRequest:(NSString *)toAppend;
/*!
 @function
 \brief Try to send offlines hits
 
 Try to send offlines hits, it can continue in background if allowed. Also, there is a check on quantity to send and the time remaining in background, if not enought time we don't send anything in order to not loose data. This function is directly called by ATTag when sending hits.
 */
- (void) loadOfflineHits;
/*!
 @function
 \brief Set mode offline (mode never by default)
 
 This function should be called at the launching of your application
 @param offmode Wanted offline mode
 */
- (void) setOfflineMode:(OfflineMode)offmode;
/*!
 @function
 \brief Create ATTagOperations from sendNow call with offline hits
 @param hitsArray Offline hits
 */
- (void) loadOfflineHitsToOperationQueueSendNow:(NSMutableArray*)hitsArray;
/*!
 @function
 \brief Create ATTagOperations from sendNow call with offline hits
 @param hitsArray Offline hits
 */
- (void) loadOfflineHitsToOperationQueue:(NSMutableArray*)hitsArray;
/*!
 @function
 \brief Try to send offlines hits
 
 Try to send offlines hits, it can continue in background if allowed. Also, there is a check on quantity to send and the time remaining in background, if not enought time we don't send anything in order to not loose data.
 */
- (void) sendNow;
/*!
 @function
 \brief Set mode debug on or off (off by default)
 
 This function should be called just before the tagging code you need to debug
 @param debug Boolean
 */
- (void) setDebug:(BOOL)debug;
/*!
 @function
 \brief Set HTTP/HTTPS protocol
    true for https, false for http
 */
-(void)setModeHttps:(BOOL)mode;
/*!
 @function
 \brief Get count of offline hits stored
 */
- (int) getNbHitsOffline;
/*!
 @function
 \brief Delete a wanted number of hits from database (beginning by oldest)
 @param nbToDel Wanted number to delete
 */
- (void) deleteHitsOffline:(int)nbToDel;
/*!
 @function
 \brief Get the date from an offline hits stored
 @param numHit Number of the row in database (oldest hit is the first one)
 @return dateHit or nil if the row doesn't exist
 */
- (NSDate *) getDateFromHit:(int)numHit;
/*!
 @function
 \brief Enable background task in order to send hit even if the application is left (disabled by default)
 @param bgTaskEnabled YES or NO
 */
- (void) setBgTaskEnabled:(BOOL)bgTaskEnabled;
@end
