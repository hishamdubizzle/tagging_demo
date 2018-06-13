//
//  DBZTagManagerDelegate.swift
//  DBZTagManager
//
//  Created by Ahmed Omer on 1/15/18.
//  Copyright © 2018 Dubizzle. All rights reserved.
//

import UIKit

@objc public class DBZTagManagerDelegate: NSObject {

  @objc public static let shared = DBZTagManagerDelegate()
  @objc public var protocolHandler: DBZTagManagerProtocol?
}
