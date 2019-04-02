//
//  DownloadImageTableViewCell.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 3/29/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit
import Kingfisher

class DownloadImageTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!

    var originalTitle: String? = ""
    var index: Int?

    override func prepareForReuse() {
        super.prepareForReuse()
        contentLabel.text = nil
        downloadButton.isEnabled = true
        index = nil
        originalTitle = nil
    }

    func configCell(withTitle title: String) {
        originalTitle = title
        contentLabel.text = title
        
        guard let index = index else { return }
        if DownloadManager.shared.checkTaskIsInQueue(at: index) {
            downloadButton.isEnabled = false
            DownloadManager.shared.setDelegateForDownloadingTask(self)
        }
        if let statusTask = DownloadManager.shared.getDownloadTask(at: index)?.downloadStatus {
            switch statusTask {
            case .downloaded:
                contentLabel.text = "\(title) - (100.0%)"
            case .pending:
                contentLabel.text = "\(title) - (0.0%)"
            default:
                break
            }
        }
    }

    @IBAction func onDownloadButtonClicked(_ sender: Any) {
        contentLabel.text = "\(originalTitle ?? "") - (0.0%)"
        downloadButton.isEnabled = false
        DownloadManager.shared.addDownloadTask(at: index ?? 0, cell: self)
    }
}

extension DownloadImageTableViewCell: VideoDownloadTaskDelegate {
    func onImageDownloadProgress(progress: CGFloat, at taskIndex: Int) {
        if index == taskIndex {
            contentLabel.text = "\(originalTitle ?? "") - (\(progress))"
        }
    }

    func onDownloadCompleted(isSuccess: Bool, at taskIndex: Int) {
        if index == taskIndex {
            downloadButton.isEnabled = true
            DownloadManager.shared.removeDownloadTask(at: taskIndex)
        }
    }
}
