//
//  DownloadImageViewController.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 3/29/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class DownloadImageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        DownloadManager.shared.removeAllTask()
    }

}

extension DownloadImageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalSemaphore.shared.arrayVideo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DownloadImageTableViewCell") as? DownloadImageTableViewCell else {
            return UITableViewCell()
        }
        cell.index = indexPath.row
        cell.configCell(withTitle: "video \(indexPath.row + 1)")
        return cell
    }
}
