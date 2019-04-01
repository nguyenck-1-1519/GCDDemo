//
//  ViewImageViewController.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 3/29/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit
import Kingfisher

class ViewImageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewImageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 21
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ViewImageTableViewCell") as? ViewImageTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(withUrl: "http://192.168.15.71:8800/imageTest/image\(indexPath.row + 1).jpg")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
