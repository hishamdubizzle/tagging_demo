//
//  DBZTagManagerProtocol.swift
//  DBZTagManager
//
//  Created by Ahmed Omer on 1/15/18.
//  Copyright © 2018 Dubizzle. All rights reserved.
//

import UIKit

@objc public protocol DBZTagManagerProtocol: class {

  @objc func getUserId() -> NSString?
  @objc func getLastElement(fromURI uri: String) -> NSString?
  @objc func selectedLanguage() -> NSString?
  @objc func isDeviceLanguageRTL() -> Bool
  @objc func getSelectedCityName() -> NSString?
  @objc func isUserLoggedIn() -> Bool
  @objc func getUserFirstName() -> String?
  @objc func getUserLastName() -> String?
  @objc func getUserEmail() -> String?
  @objc func addCategoryTree(withCategoryURI uri: String, tagObject: BaseNewTagObject)
}
