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

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configCell(withTitle title: String, urlString: String) {
        contentLabel.text = title
        self.urlString = urlString
    }

    @IBAction func onDownloadButtonClicked(_ sender: Any) {
        let currentTitle = contentLabel.text ?? ""
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            GlobalSemaphore.shared.semaphore.wait()
            let downloadTask = ImageDownloader.default
            guard let url = URL(string: self?.urlString ?? "") else {
                return
            }
            downloadTask.downloadImage(with: url, progressBlock: { (current, total) in
                let progress: CGFloat = CGFloat(current) / CGFloat(total)
                self?.contentLabel.text = "\(currentTitle) - (\(progress * 100)%)"
            })
            GlobalSemaphore.shared.semaphore.signal()
        }
    }
}
