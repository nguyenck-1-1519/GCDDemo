//
//  DownloadManager.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 4/1/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation
import Kingfisher

enum DownloadTaskStatus {
    case none
    case downloaded
    case downloading
    case pending
}

class DownloadManager {
    static let shared = DownloadManager()
    var downloadTasks: [DownloadTaskStatus] = Array(repeating: .none, count: 9)
    
}
