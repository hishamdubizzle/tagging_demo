//
//  NSArrayFilterExtension.swift
//  DubizzleHorizontal
//
//  Created by Fawad Suhail on 3/28/16.
//  Copyright © 2016 dubizzle. All rights reserved.
//

import Foundation

@objc public class NSArrayHelper: NSObject {

  @objc public class func queryDictionary(fromArray array: NSArray) -> NSMutableDictionary {

    let queryDict = NSMutableDictionary()

    for object in array {

      guard let string = object as? NSString else {
        continue
      }

      let components = string.components(separatedBy: "=")

      if components.count != 2 {
        continue
      }

      if queryDict.object(forKey: components[0]) != nil {

        if let stringValue = queryDict.object(forKey: components[0]) as? NSString {

          let arrayValue = NSMutableArray()

          arrayValue.add(stringValue)
          arrayValue.add(components[1])

          queryDict.setObject(arrayValue, forKey: components[0] as NSCopying)

        } else if let arrayValue = queryDict.object(forKey: components[0]) as? NSMutableArray {

          arrayValue.add(components[1])

          queryDict.setObject(arrayValue, forKey: components[0] as NSCopying)
        }

      } else {
        queryDict.setObject(components[1], forKey: components[0] as NSCopying)
      }
    }

    return queryDict
  }
}
