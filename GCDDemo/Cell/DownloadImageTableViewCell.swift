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

    var urlString: String!
    var originalTitle: String = ""
    var index: Int!

    override func prepareForReuse() {
        super.prepareForReuse()
        contentLabel.text = nil
    }

    func configCell(withTitle title: String, urlString: String) {
        originalTitle = title
        contentLabel.text = title
        switch DownloadManager.shared.downloadTasks[index] {
        case .downloaded:
            contentLabel.text = "\(title) - (100.0%)"
        case .pending:
            contentLabel.text = "\(title) - (0.0%)"
        default:
            break
        }
        self.urlString = urlString
    }

    @IBAction func onDownloadButtonClicked(_ sender: Any) {
        contentLabel.text = "\(originalTitle) - (0%)"
        downloadButton.isEnabled = false
        DownloadManager.shared.downloadTasks[index] = .pending
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            GlobalSemaphore.shared.semaphore.wait()
            DownloadManager.shared.downloadTasks[self?.index ?? 0] = .downloading
            let downloadTask = ImageDownloader.default
            guard let url = URL(string: self?.urlString ?? "") else {
                return
            }
            downloadTask.downloadImage(with: url, progressBlock: { (current, total) in
                let progress: CGFloat = CGFloat(current) / CGFloat(total)
                self?.contentLabel.text = "\(self?.originalTitle ?? "") - (\(progress * 100)%)"
            }, completionHandler: { (_) in
                GlobalSemaphore.shared.semaphore.signal()
                DownloadManager.shared.downloadTasks[self?.index ?? 0] = .downloaded
                self?.downloadButton.isEnabled = true
            })
        }
    }
}
