//
//  TagManager.swift
//  DubizzleHorizontal
//
//  Created by Liemkhiet Tran on 3/6/18.
//  Copyright © 2018 dubizzle. All rights reserved.
//

import Foundation

protocol TagManagerProtocol: class {

  func registerExtension(ext: BaseExtension)
  func publishEvent(event: Event) throws -> TaggingError?
}
