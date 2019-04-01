//
//  GlobalSemaphore.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 4/1/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation

class GlobalSemaphore {
    static let shared = GlobalSemaphore()

    let semaphore = DispatchSemaphore(value: 3)
}
