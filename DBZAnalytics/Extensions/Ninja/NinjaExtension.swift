//
//  NinjaExtension.swift
//  DubizzleHorizontal
//
//  Created by Liemkhiet Tran on 3/6/18.
//  Copyright © 2018 dubizzle. All rights reserved.
//

import Foundation
import NCNinja
import DBZLogger

struct DBZTagManagerBundle {

  private static let identifier = "com.dubizzle.DBZTagManager"

  private static let resourceBundlePath = "DBZTagManager.bundle"

  static let main = Bundle(identifier: DBZTagManagerBundle.identifier)

  static let resources: Bundle? = {
    guard let resourceURL = DBZTagManagerBundle.main?.resourceURL?.appendingPathComponent(DBZTagManagerBundle.resourceBundlePath) else {
      return nil
    }
    return Bundle(url: resourceURL)
  }()
}

public class NinjaExtension: NSObject {

  typealias TMAttrNames = TagManagerConstants.AttributeNames

  var ninjaEventsMap = [String: String]()
  var ninjaDefaultAttributesMap = [String: String]()
  var ninjaCustomAttributesMap = [String: String]()
  var ninjaDao = NinjaDAO()
  var testEvent = Event()
  var isDebugScheme = false

  public convenience init(debugScheme: Bool) {
    
    self.init()
    isDebugScheme = debugScheme
    
    setupNinja()
    setupMaps()
  }

  func setupNinja() {

    if isDebugScheme == true {

      print("***************************")
      print("NCNinja.setEnvironment(.dev)")
      print("***************************")
      NCNinja.setEnvironment(.dev)
      NCNinja.debug(true)
    } else {

      print("***************************")
      print("NCNinja.setEnvironment(.prod)")
      print("***************************")
      NCNinja.setEnvironment(.prod)
      NCNinja.debug(false)
    }

    let config = NCConfig().configure()
    config.regionCode = "uae"
    config.streamName = "h-dubizzle-ios"
    config.packageName = "com.dubizzle.DubizzleHorizontal"
    config.countryCode = NCNinjaCountryCodeAE

    NCNinja.configure(config)
  }

  func setupMaps() {

    if let nEvents = loadFromJson(fileName: "ninja_events") {

      ninjaEventsMap = nEvents
    }

    ninjaDefaultAttributesMap = [
      TMAttrNames.adId: NCNINJA_AD_ID,
      TMAttrNames.categoryId: NCNINJA_CATEGORY_ID,
      TMAttrNames.categoryLevel1Id: NCNINJA_CATEGORY_1_ID,
      TMAttrNames.categoryLevel2Id: NCNINJA_CATEGORY_2_ID,
      TMAttrNames.categoryLevel3Id: NCNINJA_CATEGORY_3_ID,
      TMAttrNames.categoryLevel4Id: NCNINJA_CATEGORY_4_ID,
      TMAttrNames.cityId: NCNINJA_CITY_ID,
      TMAttrNames.imagesCount: NCNINJA_IMAGES_COUNT,
      TMAttrNames.resultset: NCNINJA_LISTING,
      TMAttrNames.messageForm: NCNINJA_MESSAGE_FORM,
      TMAttrNames.pushId: NCNINJA_PUSH_ID,
      TMAttrNames.reply: NCNINJA_REPLY,
      TMAttrNames.resultCount: NCNINJA_RESULT_COUNT,
      TMAttrNames.resultSetType: NCNINJA_RESULT_SET,
      TMAttrNames.tapCall: NCNINJA_TAP_CALL,
      TMAttrNames.tapSms: NCNINJA_TAP_SMS,
      TMAttrNames.userId: NCNINJA_USER_ID
    ]

    ninjaCustomAttributesMap = [
      "NCNINJA_MATCHER_ID": "matcher_id",
      "NCNINJA_SMS_RESULT_CODE": "smsResultCode"
    ]

    if let customAttributes = loadFromJson(fileName: "NinjaCustomAttributes") {

      ninjaCustomAttributesMap = customAttributes
    }
  }

  func loadFromJson(fileName: String) -> [String: String]? {

    if let path = DBZTagManagerBundle.main?.path(forResource: fileName, ofType: "json") {

      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path),
                            options: .mappedIfSafe)
        let jsonResult = try JSONSerialization.jsonObject(with: data,
                                                          options: .mutableLeaves)
        if let jsonResult = jsonResult as? Dictionary<String, String> {
          // do stuff

          return jsonResult
        }
      } catch {

        DBZLogger.error(eventName: "ninja_extension_load_from_json",
                        error: error as NSError,
                        attributes: ["fileName": fileName])
        return nil
      }
    }
    return nil
  }

  func getNCNinjaValueFor(key: String) -> String? {

    // step 1: check in default attributes
    if let defaultValue = ninjaDefaultAttributesMap[key] {

      print("***************************")
      print("getNCNinjaValueFor defaultValue")
      print("***************************")
      return defaultValue

      // step 2: check in custom attributes
    } else if let customValue = ninjaCustomAttributesMap[key] {

      print("***************************")
      print("getNCNinjaValueFor customValue")
      print("***************************")
      return customValue
    }

    print("***************************")
    print("The given Attribute key \(key) doesn't matched any of NCNinja Attribute keys.")
    print("***************************")
    TagManagerFactoryDelegate.shared.protocolHandler?.ninjaKeyExceptionHandler(reason: "The given Attribute key \(key) doesn't matched any of NCNinja Attribute keys.")

    return nil
  }
}

extension NinjaExtension: BaseExtension {

  func getEventNames() -> [String]? {

    return Array(ninjaEventsMap.keys)
  }

  func publishEvent(event: Event) {

    print("***************************")
    print("*****[Ninja Extension]*****\nEvent name: \(event.eventName)")
    print("***************************")
    print("*****[Ninja Extension]*****\nEvent type: \(event.eventType)")
    print("***************************")
    print("*****[Ninja Extension]*****\nEvent attributes: \(event.attributes)")
    print("***************************")

    let mappedEvent = Event()

    mappedEvent.eventType = event.eventType // use the same type

    if let mappedEventName = ninjaEventsMap[event.eventName] {

      mappedEvent.eventName = mappedEventName // use the mapped event name
    } else {

      print("***************************")
      print("The given Event name \(event.eventName) doesn't matched any of NCNinja Event keys.")
      print("***************************")
      TagManagerFactoryDelegate.shared.protocolHandler?.ninjaKeyExceptionHandler(reason: "The given Event name \(event.eventName) doesn't matched any of NCNinja Event names.")
    }

    var mappedAttributes = [String: String]()
    for key in event.attributes.keys {

      if let mappedKey = getNCNinjaValueFor(key: key) { // get the mapped "KEY"
        
        mappedAttributes[mappedKey] = event.attributes[key] // use the mapped "KEY" to store the SAME value back in the dictionary
      } else if key == TMAttrNames.resultSetType,
        let value = event.attributes[key] {

        mappedAttributes[key] = ninjaEventsMap[value]
      } else {

        mappedAttributes[key] = event.attributes[key]
      }
    }

    mappedEvent.attributes = mappedAttributes

    testEvent = mappedEvent

    ninjaDao.publishEvent(event: mappedEvent)
  }
}
