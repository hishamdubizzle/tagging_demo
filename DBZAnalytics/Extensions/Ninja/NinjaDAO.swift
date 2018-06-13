//
//  NinjaDAO.swift
//  DubizzleHorizontal
//
//  Created by Liemkhiet Tran on 3/6/18.
//  Copyright © 2018 dubizzle. All rights reserved.
//

import Foundation
import NCNinja

public class NinjaDAO: NSObject {

  typealias TMEventTypes = TagManagerConstants.EventTypes
  func publishEvent(event: Event) {

    let eventType = event.eventType.lowercased()

    if eventType == TMEventTypes.pageView {

      print("TRACK_PAGELOAD")
      print("\(event.attributes)")
      print("\(event.eventName)")
      trackPage(event: event)
    } else {

      print("TRACK_EVENT")
      print("\(event.attributes)")
      print("\(event.eventName)")
      trackEvent(event: event)
    }
  }

  func trackEvent(event: Event) {

    NCNinja.trackEvent(event.eventName, params: event.attributes)
  }

  func trackPage(event: Event) {

    NCNinja.trackPageView(event.eventName, params: event.attributes)
  }
}
