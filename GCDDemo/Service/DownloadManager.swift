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

    func addDownloadTask(at taskIndex: Int, cell: DownloadImageTableViewCell) {
        if getDownloadTask(at: taskIndex) == nil {
            tasks[String(taskIndex)] = VideoDownloadTask(taskIndex: taskIndex)
        }
        startDownloadTask(at: taskIndex, cell: cell)
    }

    func startDownloadTask(at taskIndex: Int, cell: DownloadImageTableViewCell) {
        tasks[String(taskIndex)]?.delegate = cell
        tasks[String(taskIndex)]?.startDownloadTask()
    }

    func setDelegateForDownloadingTask(_ cell: DownloadImageTableViewCell) {
        guard let indexTask = cell.index else { return }
        tasks[String(indexTask)]?.delegate = cell
    }
    
    
    func removeDownloadTask(at taskIndex: Int) {
        let key = String(taskIndex)
        tasks[String(taskIndex)]?.cancelDownload()
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
