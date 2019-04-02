//
//  VideoDownloadTask.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 4/2/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

enum DownloadTaskStatus {
    case none
    case downloaded
    case downloading
    case pending
}

protocol VideoDownloadTaskDelegate: class {
    func onImageDownloadProgress(progress: CGFloat, at taskIndex: Int)
    func onDownloadCompleted(isSuccess: Bool, at taskIndex: Int)
}

class VideoDownloadTask {

    weak var delegate: VideoDownloadTaskDelegate?
    var downloadStatus: DownloadTaskStatus = .none
    var taskIndex: Int = 0
    var downloadTask: DownloadTask?

    func startDownloadTask() {
        downloadStatus = .pending
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            GlobalSemaphore.shared.semaphore.wait()
            self?.downloadStatus = .downloading
            guard let taskIndex = self?.taskIndex,
                let url = URL(string: GlobalSemaphore.shared.arrayVideo[taskIndex])  else {
                return
            }
            self?.downloadTask = ImageDownloader.default.downloadImage(with: url, progressBlock: { (current, total) in
                let progress: CGFloat = CGFloat(current) / CGFloat(total)
                self?.delegate?.onImageDownloadProgress(progress: progress * 100, at: taskIndex)
            }, completionHandler: { (result) in
                GlobalSemaphore.shared.semaphore.signal()
                self?.downloadStatus = .downloaded
                self?.delegate?.onDownloadCompleted(isSuccess: result.isSuccess, at: taskIndex)
            })
        }
    }

    func cancelDownload() {
        downloadTask?.cancel()
        GlobalSemaphore.shared.semaphore.signal()
    }

}
