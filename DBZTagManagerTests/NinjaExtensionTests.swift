//
//  NinjaExtensionTests.swift
//  DBZTagManagerTests
//
//  Created by Liemkhiet Tran on 3/11/18.
//  Copyright © 2018 Dubizzle. All rights reserved.
//

import XCTest
import NCNinja
@testable import DBZTagManager

class NinjaExtensionTests: XCTestCase {

  typealias TMEventTypes = TagManagerConstants.EventTypes
  typealias TMEventNames = TagManagerConstants.EventNames
  typealias TMAttrNames = TagManagerConstants.AttributeNames

  let ninjaExtension = NinjaExtension(debugScheme: true)

  override func setUp() {

    super.setUp()
  }

  override func tearDown() {

    super.tearDown()
  }

  func testNinjaSetup() {

    if let ninjaConfig = NCNinja.currentConfig() {

      XCTAssertEqual(ninjaConfig.regionCode,
                     "uae",
                     "Region code should be set as uae in Ninja configuration")
      XCTAssertEqual(ninjaConfig.streamName,
                     "h-dubizzle-ios",
                     "Stream name should be set as h-dubizzle-ios in Ninja configuration")
      XCTAssertEqual(ninjaConfig.packageName,
                     "com.dubizzle.DubizzleHorizontal",
                     "Package name should be set as com.dubizzle.DubizzleHorizontal in Ninja configuration")
      XCTAssertEqual(ninjaConfig.countryCode,
                     NCNinjaCountryCodeAE,
                     "Country code should be set as NCNinjaCountryCodeAE in Ninja configuration")
    }
  }

  func testNinjaEventsMap() {

    wait(for: [], timeout: 3.0)
    XCTAssertNotNil(ninjaExtension.ninjaEventsMap, "We should have an events map set up!")
    XCTAssert(ninjaExtension.ninjaEventsMap.keys.count > 0, "Ninja events map should contain more than 0 key value pairs!")
  }

  func testPublishEvent() {

    let mockEvent = Event()
    mockEvent.eventName = "addToFavorites"
    mockEvent.eventType = TMEventTypes.event
    mockEvent.attributes = [
      TMAttrNames.adId: TMAttrNames.adId,
      TMAttrNames.cityId: TMAttrNames.cityId
    ]

    ninjaExtension.publishEvent(event: mockEvent)

    XCTAssertEqual(ninjaExtension.testEvent.eventName, "add-to-favourites", "testEvent object's property eventName should be add-to-favourites")
    XCTAssertEqual(ninjaExtension.testEvent.eventType, TMEventTypes.event, "testEvent object's eventType should be an event")

    if let mappedNinjaAdIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.adId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaAdIdKey), "testEvent object's attributes should contain a key adId")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaAdIdKey],
                     TMAttrNames.adId,
                     "testEvent object's attributes should return value adId for adId key")
    }

    if let mappedNinjaCityIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.cityId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaCityIdKey),
                    "testEvent object's attributes should contain a key cityId")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaCityIdKey],
                     TMAttrNames.cityId,
                     "testEvent object's attributes should return value cityId for NCNINJA_CITY_ID key")
    }
  }

  func testPublishPageCase() {

    let mockEvent = Event()
    mockEvent.eventName = TMEventNames.dpv
    mockEvent.eventType = TMEventTypes.pageView
    mockEvent.attributes = [
      TMAttrNames.adId: TMAttrNames.adId,
      TMAttrNames.cityId: TMAttrNames.cityId
    ]

    ninjaExtension.publishEvent(event: mockEvent)

    XCTAssertEqual(ninjaExtension.testEvent.eventName, "DPV", "testEvent object's property eventName should be dpv")
    XCTAssertEqual(ninjaExtension.testEvent.eventType, TMEventTypes.pageView, "testEvent object's eventType should be a page load")

    if let mappedNinjaAdIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.adId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaAdIdKey), "testEvent object's attributes should contain a key adId")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaAdIdKey],
                     TMAttrNames.adId,
                     "testEvent object's attributes should return value NCNINJA_AD_ID for adId key")
    }

    if let mappedNinjaCityIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.cityId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaCityIdKey),
                    "testEvent object's attributes should contain a key cityId")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaCityIdKey],
                     TMAttrNames.cityId,
                     "testEvent object's attributes should return value NCNINJA_CITY_ID for cityId key")
    }
  }

  func testPublishExistingAttributes() {

    let mockEvent = Event()
    mockEvent.eventName = "addToFavorites"
    
    mockEvent.eventType = TMEventTypes.event
    mockEvent.attributes = [
      TMAttrNames.adId: TMAttrNames.adId,
      TMAttrNames.categoryId: TMAttrNames.categoryId,
      TMAttrNames.cityId: TMAttrNames.cityId,
      TMAttrNames.imagesCount: TMAttrNames.imagesCount,
      TMAttrNames.resultset: TMAttrNames.resultset,
      TMAttrNames.matcherId: TMAttrNames.matcherId,
      TMAttrNames.messageForm: TMAttrNames.messageForm,
      TMAttrNames.pushId: TMAttrNames.pushId,
      TMAttrNames.reply: TMAttrNames.reply,
      TMAttrNames.resultCount: TMAttrNames.resultCount,
      TMAttrNames.resultSetType: TMAttrNames.resultSetType,
      TMAttrNames.smsResultCode: TMAttrNames.smsResultCode,
      TMAttrNames.tapCall: TMAttrNames.tapCall,
      TMAttrNames.tapSms: TMAttrNames.tapSms,
      TMAttrNames.userId: TMAttrNames.userId
    ]

    ninjaExtension.publishEvent(event: mockEvent)

    if let mappedNinjaAdIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.adId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaAdIdKey), "testEvent object's attributes should contain a key adId")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaAdIdKey],
                     TMAttrNames.adId,
                     "testEvent object's attributes should return value NCNINJA_AD_ID for adId key")
    }

    if let mappedNinjaCategoryIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.categoryId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaCategoryIdKey), "testEvent object's attributes should contain a key categoryId")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaCategoryIdKey],
                     TMAttrNames.categoryId,
                     "testEvent object's attributes should return value NCNINJA_CATEGORY_ID for categoryId key")
    }

    if let mappedNinjaCityIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.cityId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaCityIdKey),
                    "testEvent object's attributes should contain a key cityId")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaCityIdKey],
                     TMAttrNames.cityId,
                     "testEvent object's attributes should return value NCNINJA_CITY_ID for cityId key")
    }

    if let mappedNinjaImagesCountKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.imagesCount] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaImagesCountKey), "testEvent object's attributes should contain a key imagesCount")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaImagesCountKey],
                     TMAttrNames.imagesCount,
                     "testEvent object's attributes should return value NCNINJA_IMAGES_COUNT for imagesCount key")
    }

    if let mappedNinjaListingKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.resultset] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaListingKey), "testEvent object's attributes should contain a key resultset")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaListingKey],
                     TMAttrNames.resultset,
                     "testEvent object's attributes should return value NCNINJA_LISTING for resultset key")
    }

    if let mappedNinjaMatcherIdKey = ninjaExtension.ninjaCustomAttributesMap[TMAttrNames.matcherId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaMatcherIdKey), "testEvent object's attributes should contain a key matcher_id")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaMatcherIdKey],
                     TMAttrNames.matcherId,
                     "testEvent object's attributes should return value NCNINJA_MATCHER_ID for matcher_id key")
    }

    if let mappedNinjaMessageFormKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.messageForm] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaMessageFormKey), "testEvent object's attributes should contain a key replyform")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaMessageFormKey],
                     TMAttrNames.messageForm,
                     "testEvent object's attributes should return value NCNINJA_MESSAGE_FORM for replyform key")
    }

    if let mappedNinjaPushIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.pushId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaPushIdKey), "testEvent object's attributes should contain a key pushId")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaPushIdKey],
                     TMAttrNames.pushId,
                     "testEvent object's attributes should return value NCNINJA_PUSH_ID for pushId key")
    }

    if let mappedNinjaReplyKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.reply] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaReplyKey), "testEvent object's attributes should contain a key replysent")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaReplyKey],
                     TMAttrNames.reply,
                     "testEvent object's attributes should return value NCNINJA_REPLY for replysent key")
    }

    if let mappedNinjaResultCountKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.resultCount] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaResultCountKey), "testEvent object's attributes should contain a key NCNINJA_RESULT_COUNT")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaResultCountKey],
                     TMAttrNames.resultCount,
                     "testEvent object's attributes should return value NCNINJA_RESULT_COUNT for resultCount key")
    }

    if let mappedNinjaResultSetKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.resultSetType] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaResultSetKey), "testEvent object's attributes should contain a key resultSetType")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaResultSetKey],
                     TMAttrNames.resultSetType,
                     "testEvent object's attributes should return value NCNINJA_RESULT_SET for resultSetType key")
    }

    if let mappedNinjaSMSResultCodeKey = ninjaExtension.ninjaCustomAttributesMap[TMAttrNames.smsResultCode] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaSMSResultCodeKey), "testEvent object's attributes should contain a key NCNINJA_SMS_RESULT_CODE")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaSMSResultCodeKey],
                     TMAttrNames.smsResultCode,
                     "testEvent object's attributes should return value NCNINJA_SMS_RESULT_CODE for smsResultCode key")
    }

    if let mappedNinjaTapCallKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.tapCall] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaTapCallKey), "testEvent object's attributes should contain a key tapCall")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaTapCallKey],
                     TMAttrNames.tapCall,
                     "testEvent object's attributes should return value NCNINJA_TAP_CALL for tapCall key")
    }

    if let mappedNinjaTapSMSKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.tapSms] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaTapSMSKey), "testEvent object's attributes should contain a key tapSMS")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaTapSMSKey],
                     TMAttrNames.tapSms,
                     "testEvent object's attributes should return value NCNINJA_TAP_CALL for tapSMS key")
    }

    if let mappedNinjaUserIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.userId] {

      XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaUserIdKey), "testEvent object's attributes should contain a key userId")
      XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaUserIdKey],
                     TMAttrNames.userId,
                     "testEvent object's attributes should return value NCNINJA_USER_ID for userId key")
    }
  }

  func testMappingCustomAttribute() {

    let mockEvent = Event()
    mockEvent.eventName = "addToFavorites"
    mockEvent.eventType = TMEventTypes.event
    mockEvent.attributes = ["blabla": "blabla"]

    ninjaExtension.publishEvent(event: mockEvent)

    XCTAssertEqual(ninjaExtension.testEvent.attributes.keys.count, 1, "testEvent object's attributes should be empty")
    let attributeKey = Array(ninjaExtension.testEvent.attributes.keys)[0]
    XCTAssertEqual(attributeKey, "blabla", "testEvent unique attribute key should be \"blabla\".")
  }
}
