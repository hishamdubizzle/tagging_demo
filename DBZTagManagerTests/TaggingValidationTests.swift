//
//  TaggingValidationTests.swift
//  DBZTagManagerTests
//
//  Created by Liemkhiet Tran on 5/22/18.
//  Copyright © 2018 Dubizzle. All rights reserved.
//

import XCTest
import NCNinja
@testable import DBZTagManager

class TaggingValidationTests: XCTestCase {
  
  typealias TMEventTypes = TagManagerConstants.EventTypes
  typealias TMEventNames = TagManagerConstants.EventNames
  typealias TMAttrNames = TagManagerConstants.AttributeNames
  
  let tagManager = TagManager()
  let ninjaExtension = NinjaExtension(debugScheme: true)
  var event: Event?
  var eventMissingMandatoryAttributes: Event?
  var eventPageLoad: Event?
  var eventInvalidType: Event?
  var eventNoEventType: Event?
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    event = Event()
    if let ev = event {
      
      ev.eventType = TMEventTypes.event
      ev.eventName = TMEventNames.addToFavorites
      
      ev.attributes = ["adId" : "adId",
                       "categoryId" : "categoryId",
                       "cityId" : "cityId",
                       "categoryLevelOneId" : "categoryLevelOneId",
                       "categoryLevelTwoId" : "categoryLevelTwoId",
                       "categoryLevelThreeId" : "categoryLevelThreeId",
                       "categoryLevelFourId" : "categoryLevelFourId",
                       "imagesCount" : "imagesCount",
                       "resultSetType" : "resultSetType",
                       "userId" : "userId"]
    }
    
    eventMissingMandatoryAttributes = Event()
    if let evmma = eventMissingMandatoryAttributes {
      
      evmma.eventType = TMEventTypes.event
      evmma.eventName = TMEventNames.addToFavorites
      
      evmma.attributes = ["adId" : "adId"]
    }
    
    eventPageLoad = Event()
    if let evpl = eventPageLoad {
      
      evpl.eventType = TMEventTypes.pageView
      evpl.eventName = TMEventNames.addToFavorites
    }
    
    eventInvalidType = Event()
    if let evi = eventInvalidType {
      
      evi.eventType = "invalidType"
      evi.eventName = TMEventNames.addToFavorites
    }
    
    eventNoEventType = Event()
    if let evne = eventNoEventType {
      
      evne.eventName = TMEventNames.addToFavorites
    }
  }
  
  override func tearDown() {
    
    event = nil
    eventPageLoad = nil
    eventInvalidType = nil
    eventNoEventType = nil
    
    super.tearDown()
  }
  
  func testTagEventNameExistence() {
    
    if let ev = event {
      
      XCTAssertEqual(ninjaExtension.ninjaEventsMap.keys.contains(ev.eventName),
                     true,
                     "Fail: Event name addToFavorites cannot be found in ninjaEventsMap")
    } else {
      
      XCTFail("Fail: Event object failed to be initialized")
    }
  }
  
  func testTagEventTypeExistence() {
    
    if let ev = event {
      
      XCTAssertGreaterThan(ev.eventType.count,
                           0,
                           "Fail: Event type should not be an empty string")
    } else {
      
      XCTFail("Fail: Event object failed to be initialized")
    }
  }
  
  func testTagEmptyEventType() {
    
    if let evne = eventNoEventType {
      
      XCTAssertEqual(evne.eventType.count,
                     0,
                     "Fail: Event type should be an empty string")
    } else {
      
      XCTFail("Fail: Event object failed to be initialized")
    }
  }
  
  func testTagValidEventType() {
    
    if let ev = event {
      
      XCTAssertEqual(ev.eventType,
                     TMEventTypes.event,
                     "Fail: Event type should be equal to \(TMEventTypes.event)")
    } else {
      
      XCTFail("Fail: Event object failed to be initialized")
    }
  }
  
  func testTagValidPageLoadEventType() {
    
    if let evpl = eventPageLoad {
      
      XCTAssertEqual(evpl.eventType,
                     TMEventTypes.pageView,
                     "Fail: Event type should be equal to \(TMEventTypes.pageView)")
    } else {
      
      XCTFail("Fail: Event object failed to be initialized")
    }
  }
  
  func testTagInvalidEventType() {
    
    if let evi = eventInvalidType {
      
      XCTAssertEqual(evi.eventType,
                     "invalidType",
                     "Fail: Event type should be equal to \"invalidType\"")
    } else {
      
      XCTFail("Fail: Event object failed to be initialized")
    }
  }
  
  func testTagEventWitAllMandatoryAttributes() {
    
    if let ev = event {
      
      do {
        
        let _ = try tagManager.publishEvent(event: ev)
        
        XCTAssertTrue(true)
      } catch let error as TaggingError {
        
        print("\n\n**********************************\nTagManager publish event \(ev.eventName) throws an exception:\n\(error.description)\n**********************************\n\n")
        XCTFail("Failed to find all mandatory attributes in the event object.\n Description: \(error.description)")
      } catch {
        
        print("\n\n**********************************\nTagManager publish event \(ev.eventName) throws an exception\n\(error.localizedDescription)\n**********************************\n\n")
        XCTFail("Failed to find all mandatory attributes in the event object.\n Description: \(error.localizedDescription)")
      }
    } else {
      
      XCTFail("Fail: Event object failed to be initialized")
    }
  }
  
    //TODO: will be implemented later with mock validation json
  /*func testTagEventWitMissingMandatoryAttributes() {
    
    if let evmma = eventMissingMandatoryAttributes {
      
      do {
        
        let _ = try tagManager.publishEvent(event: evmma)
        
        XCTFail("Failed: this scope should be caught since there are missing mandatory attributes.")
      } catch let error as TaggingError {
        
        print("\n\n**********************************\nTagManager publish event throws an exception:\n\(error.description)\n**********************************\n\n")
        XCTAssertNotNil(error.description, "Test expected to fail because of missing mandatory attributes in the event object.\n Description: \(error.description)")
      } catch {
        
        print("\n\n**********************************\nTagManager publish event throws an exception\n\(error.localizedDescription)\n**********************************\n\n")
        XCTAssertNotNil(error.localizedDescription, "Test expected to fail because of missing mandatory attributes in the event object.\n Description: \(error.localizedDescription)")
      }
    } else {
      
      XCTFail("Fail: Event object failed to be initialized")
    }
  }*/
}
