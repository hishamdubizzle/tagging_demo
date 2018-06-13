//
//  TagManagerFactory.swift
//  DubizzleHorizontal
//
//  Created by Liemkhiet Tran on 3/6/18.
//  Copyright © 2018 dubizzle. All rights reserved.
//

import Foundation

@objc public class TagManagerFactory: NSObject {

  public var tagManager: TagManager!
  public var isDebugScheme = false

  public convenience init(debugScheme: Bool) {

    self.init()

    isDebugScheme = debugScheme
    tagManager = TagManager()

    let ninjaExtension = NinjaExtension(debugScheme: debugScheme)
    ninjaExtension.isDebugScheme = debugScheme
    tagManager.registerExtension(ext: ninjaExtension)
  }
}
