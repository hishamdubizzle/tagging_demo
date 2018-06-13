//
//  TuneTracker.swift
//  DubizzleHorizontal
//
//  Created by Fawad Suhail on 4/13/16.
//  Copyright © 2016 dubizzle. All rights reserved.
//

import Foundation


@objc public class TuneTracker: NSObject {

  fileprivate let kTuneAdvertisingId = "192473"
  fileprivate let kTuneConversionKey = "c85ae014c4799eaad87d330c38cb44f5"
  @objc public static let sharedInstance = TuneTracker()

  override init() {
    super.init()
    setup()
  }

  fileprivate func setup() {

   
  }

  @objc public func sendPropertyTag(_ tagObject: BaseNewTagObject) {

  
  }

  @objc public class func handleApplicationDidBecomeActive() {
   
  }

  @objc public class func handleOpenURL(_ url: URL?, sourceApplication: String?) {

  
  }

}
