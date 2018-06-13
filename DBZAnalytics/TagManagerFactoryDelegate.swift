//
//  TagManagerFactoryDelegate.swift
//  DubizzleHorizontal
//
//  Created by Liemkhiet Tran on 3/8/18.
//  Copyright © 2018 dubizzle. All rights reserved.
//

import Foundation

@objc public class TagManagerFactoryDelegate: NSObject {

  @objc public static let shared = TagManagerFactoryDelegate()
  @objc public var protocolHandler: TagManagerFactoryProtocol?
}
