//
//  EventTests.swift
//  DBZTagManagerTests
//
//  Created by Liemkhiet Tran on 3/11/18.
//  Copyright © 2018 Dubizzle. All rights reserved.
//

import XCTest
@testable import DBZTagManager

class EventTests: XCTestCase {

  let event = Event()

  override func setUp() {
    super.setUp()

    event.eventName = "eventName"
    event.eventType = "eventType"
    event.attributes = ["attributeKey": "attributeValue"]
  }

  override func tearDown() {

    super.tearDown()
  }

  func testValues() {

    XCTAssertEqual(event.eventName, "eventName")
    XCTAssertEqual(event.eventType, "eventType")
    XCTAssertEqual(event.attributes["attributeKey"], "attributeValue")
  }
}
