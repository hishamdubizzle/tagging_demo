//
//  NSString+Base64Info.swift
//  DubizzleHorizontal
//
//  Created by Fawad Suhail on 4/17/16.
//  Copyright © 2016 dubizzle. All rights reserved.
//

import Foundation

// gets the country, city,

extension NSString {

//  func listingID() -> String? {
//
//    guard let components = NSStringHelper.components(fromString: self) else {
//      return nil
//    }
//    return components[4]
//  }
}

@objc public class NSStringHelper: NSObject {

  @objc class func components(fromString string: NSString) -> [String]? {

    var array: [String] = []

    if string.contains("item") == false {
      guard let decodedData = Data(base64Encoded: string as String, options: NSData.Base64DecodingOptions(rawValue: 0)),
        let decodedString = String(data: decodedData, encoding: String.Encoding.utf8)  else {
          return nil
      }

      array = decodedString.components(separatedBy: ":")
    } else {

      array = string.components(separatedBy: ":")
    }
    // array should have 5 elements
    if array.count == 0 || array.count != 5 {
      return nil
    }

    return array
  }

  @objc public class func countryID(fromString string: NSString) -> String? {

    guard let components = NSStringHelper.components(fromString: string) else {
      return nil
    }
    return components[1]
  }

  @objc public class func cityID(fromString string: NSString) -> String? {

    guard let components = NSStringHelper.components(fromString: string) else {
      return nil
    }
    return components[2]
  }

  @objc public class func categoryID(fromString string: NSString) -> String? {

    guard let components = NSStringHelper.components(fromString: string) else {
      return nil
    }
    return components[3]
  }

  @objc public class func listingID(fromString string: NSString) -> String? {

    guard let components = NSStringHelper.components(fromString: string) else {
      return nil
    }
    return components[4]
  }
}
