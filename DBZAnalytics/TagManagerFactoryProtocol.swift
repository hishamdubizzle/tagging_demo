//
//  TagManagerFactoryProtocol.swift
//  DubizzleHorizontal
//
//  Created by Liemkhiet Tran on 3/8/18.
//  Copyright © 2018 dubizzle. All rights reserved.
//

import Foundation

@objc public protocol TagManagerFactoryProtocol: class {

  @objc func ninjaKeyExceptionHandler(reason: String)
}
