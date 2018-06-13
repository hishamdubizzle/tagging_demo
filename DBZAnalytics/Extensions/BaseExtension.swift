//
//  BaseExtension.swift
//  DubizzleHorizontal
//
//  Created by Liemkhiet Tran on 3/6/18.
//  Copyright © 2018 dubizzle. All rights reserved.
//

import Foundation

protocol BaseExtension: class {

  func getEventNames() -> [String]?
  func publishEvent(event: Event)
}
