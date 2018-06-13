//
//  TagManagerTests.swift
//  DBZTagManagerTests
//
//  Created by Liemkhiet Tran on 3/13/18.
//  Copyright © 2018 Dubizzle. All rights reserved.
//

import XCTest
import NCNinja
@testable import DBZTagManager

class TagManagerTests: XCTestCase {

  typealias TMEventNames = TagManagerConstants.EventNames
  typealias TMEventTypes = TagManagerConstants.EventTypes
  typealias TMAttrNames = TagManagerConstants.AttributeNames

  let tagManager = TagManager()

  override func setUp() {

    super.setUp()
  }

  override func tearDown() {

    super.tearDown()
  }

  func testRegisterExtension() {

    let ninjaExtension = NinjaExtension()

    tagManager.registerExtension(ext: ninjaExtension)

    XCTAssertNotNil(tagManager, "tagManager should not be nil")
    XCTAssertNotNil(tagManager.eventsRegistryMap, "eventsRegistryMap should not be nil")
    XCTAssertEqual(tagManager.eventsRegistryMap.count, ninjaExtension.ninjaEventsMap.count, "Count should be equal")
  }

 func testFailExtensionRegistration() {

    let ninjaExtension = NinjaExtension()
    //force to fail registration
    ninjaExtension.ninjaEventsMap.removeAll()
    tagManager.eventsRegistryMap.removeAll()

    tagManager.registerExtension(ext: ninjaExtension)

    XCTAssertNotNil(tagManager, "tagManager should not be nil")
    XCTAssertEqual(tagManager.eventsRegistryMap.count, 0, "eventsRegistryMap should be empty")
  }

  /* func testTagManagerPublishEvent() {

    let mockEvent = Event()
    mockEvent.eventName = TMEventNames.addToFavorites
    mockEvent.eventType = TMEventTypes.event
    mockEvent.attributes = [
      "NCNINJA_AD_ID": TMAttrNames.adId,
      "NCNINJA_CITY_ID": TMAttrNames.cityId
    ]

    let ninjaExtension = NinjaExtension()

    tagManager.registerExtension(ext: ninjaExtension)
    
    do {
      
      let _ = try tagManager.publishEvent(event: mockEvent)
      
      XCTAssertEqual(ninjaExtension.testEvent.eventName, TMEventNames.addToFavorites, "testEvent object's property eventName should be \(TMEventNames.addToFavorites)")
      XCTAssertEqual(ninjaExtension.testEvent.eventType, TMEventTypes.event, "testEvent object's eventType should be an event")
      
      if let mappedNinjaAdIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.adId] {
        
        XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaAdIdKey), "testEvent object's attributes should contain a key adId")
        XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaAdIdKey],
                       TMAttrNames.adId,
                       "testEvent object's attributes should return value adId for NCNINJA_AD_ID key")
      } else {
        
        XCTFail()
      }
      
      if let mappedNinjaCityIdKey = ninjaExtension.ninjaDefaultAttributesMap[TMAttrNames.cityId] {
        
        XCTAssertTrue(ninjaExtension.testEvent.attributes.keys.contains(mappedNinjaCityIdKey), "testEvent object's attributes should contain a key cityId")
        XCTAssertEqual(ninjaExtension.testEvent.attributes[mappedNinjaCityIdKey],
                       TMAttrNames.cityId,
                       "testEvent object's attributes should return value cityId for NCNINJA_CITY_ID key")
      } else {
        
        XCTFail()
      }
    } catch let error as TaggingError {
      
      print("\n\n**********************************\nTagManager publish event throws an exception:\n\(error.description)\n**********************************\n\n")
    } catch {
      
      print("\n\n**********************************\nTagManager publish event throws an exception\n\(error.localizedDescription)\n**********************************\n\n")
    }
  }*/
}
