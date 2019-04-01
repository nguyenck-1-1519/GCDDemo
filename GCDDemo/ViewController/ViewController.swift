//
//  ViewController.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 3/28/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var downloadButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onViewButtonClicked(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewImageViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func onDownloadButtonClicked(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DownloadImageViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}

