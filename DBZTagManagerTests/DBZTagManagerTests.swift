//
//  DBZTagManagerTests.swift
//  DBZTagManagerTests
//
//  Created by Ahmed Omer on 1/15/18.
//  Copyright © 2018 Dubizzle. All rights reserved.
//

import XCTest
@testable import DBZTagManager

class DBZTagManagerTests: XCTestCase {

  let tagManager = TagManager()
  let factory = TagManagerFactory(debugScheme: true)

  override func setUp() {
    super.setUp()

    if factory.isDebugScheme == true {

      print("we are in debug for testing")
    } else {

      print("we are in production")
    }
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testTagManagerExistence() {

    XCTAssertNotNil(factory.tagManager, "TagManager not initialized")
  }

  func testEventRegistration() {

    let tagManager = TagManager()

    XCTAssertEqual(tagManager.eventsRegistryMap.count, 0, "eventsRegistryMap not empty")

    let ninjaExtension = NinjaExtension()
    tagManager.registerExtension(ext: ninjaExtension)

    if let eventNames = ninjaExtension.getEventNames() {

      XCTAssertEqual(tagManager.eventsRegistryMap.count, eventNames.count, "Events not registered")
    }
  }

}
