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

}

extension DownloadImageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 21
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DownloadImageTableViewCell") as? DownloadImageTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(withTitle: "image \(indexPath.row + 1)",
            urlString: "http://192.168.15.71:8800/imageTest/image\(indexPath.row + 1).jpg")
        return cell
    }
}
