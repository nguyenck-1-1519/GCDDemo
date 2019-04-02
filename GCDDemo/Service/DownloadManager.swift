//
//  DownloadManager.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 4/1/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation
import Kingfisher

class DownloadManager {
    static let shared = DownloadManager()
    var tasks = [String : VideoDownloadTask]()

    func addDownloadTask(at taskIndex: Int) {
        if getDownloadTask(at: taskIndex) == nil {
            tasks[String(taskIndex)] = VideoDownloadTask()
        }
        startDownloadTask(at: taskIndex)
    }

    func startDownloadTask(at taskIndex: Int) {
        tasks[String(taskIndex)]?.startDownloadTask()
    }

    func removeDownloadTask(at taskIndex: Int) {
        let key = String(taskIndex)
        tasks.removeValue(forKey: key)
    }

    func checkTaskIsInQueue(at taskIndex: Int) -> Bool {
        return tasks[String(taskIndex)] != nil
    }

    func getDownloadTask(at taskIndex: Int) -> VideoDownloadTask? {
        return tasks[String(taskIndex)]
    }

    func removeAllTask() {
        for task in tasks {
            task.value.cancelDownload()
        }
        tasks.removeAll()
    }
}
