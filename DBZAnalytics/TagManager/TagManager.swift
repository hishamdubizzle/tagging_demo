//
//  TagManagerImpl.swift
//  DubizzleHorizontal
//
//  Created by Liemkhiet Tran on 3/6/18.
//  Copyright © 2018 dubizzle. All rights reserved.
//

import Foundation
import DBZLogger

public class TagManager: NSObject {

  var eventsRegistryMap = [String: [BaseExtension]]()
  var eventsAttributesValidationMap = [String: Any]()

  override init() {

    super.init()

    setupEventsAttributesValidation()
  }

  func setupEventsAttributesValidation() {

    if let eventsAttributes = loadFromJson(fileName: "events_validation") {

      eventsAttributesValidationMap = eventsAttributes
    }
  }
}

public enum TaggingError: Error {

  case missingEventType
  case unknownEventType
  case unknownEventName
  case missingMandatoryAttributes
  case missingOptionalAttributes
}

extension TaggingError: CustomStringConvertible {

  public var description: String {

    switch self {

    case .missingEventType:
      return "Event does not contain a specified Event type."
    case .unknownEventType:
      return "Event contains an unknown Event type."
    case .unknownEventName:
      return "Event contains an unknown Event name."
    case .missingMandatoryAttributes:
      return "Event does not contain all required mandatory attributes."
    case .missingOptionalAttributes:
      return "Event does not contain all optional attributes."
    }
  }
}

extension TagManager: TagManagerProtocol {

  typealias TMEventTypes = TagManagerConstants.EventTypes

  func registerExtension(ext: BaseExtension) {

    guard let eventNames = ext.getEventNames() else {
      return
    }

    for key in eventNames {

      var value = eventsRegistryMap[key]

      if value != nil {

        value?.append(ext)
      } else {

        eventsRegistryMap[key] = [ext]
      }
    }
  }

  public func publishEvent(event: Event) throws -> TaggingError? {

    do {

      _ = try validateEventObject(event: event)

      let eventName = event.eventName

      if let extensions = eventsRegistryMap[eventName] {

        for ext in extensions {

          ext.publishEvent(event: event)
        }
      }

      return nil
    } catch let error as TaggingError {

      throw error
    }
  }

  func loadFromJson(fileName: String) -> [String: Any]? {

    if let path = DBZTagManagerBundle.main?.path(forResource: fileName, ofType: "json") {

      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path),
                            options: .mappedIfSafe)
        let jsonResult = try JSONSerialization.jsonObject(with: data,
                                                          options: .mutableLeaves)
        if let jsonResult = jsonResult as? Dictionary<String, Any> {
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

  func validateEventObject(event: Event) throws -> TaggingError? {

    if event.eventType.count == 0 {

      throw TaggingError.missingEventType
    }

    if event.eventType !=  TMEventTypes.event &&
      event.eventType !=  TMEventTypes.pageView {

      throw TaggingError.unknownEventType
    }

    if let eventAttributesDict = eventsAttributesValidationMap[event.eventName] as? [String: [String]],
      let mandatoryAttributes = eventAttributesDict["mandatory"],
      mandatoryAttributes.count > 0 {

      for mAttr in mandatoryAttributes {

        if !event.attributes.keys.contains(mAttr) {

          throw TaggingError.missingMandatoryAttributes
        }
      }
    }

    // TODO : Check if we should validate optional attributes later on, and how
//    if let eventAttributesDict = eventsAttributesValidationMap[event.eventName] as? [String: Any],
//      let optionalAttributes = eventAttributesDict["optional"] as? [String],
//      optionalAttributes.count > 0 {
//
//      for mAttr in optionalAttributes {
//
//        if !event.attributes.keys.contains(mAttr) {
//
//          throw TaggingError.missingOptionalAttributes
//        }
//      }
//    }

    if !eventsAttributesValidationMap.keys.contains(event.eventName) {

      throw TaggingError.unknownEventName
    }

    return nil
  }
}
