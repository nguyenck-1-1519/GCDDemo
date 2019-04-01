//
//  ViewImageTableViewCell.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 3/29/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit
import Kingfisher

class ViewImageTableViewCell: UITableViewCell {

    @IBOutlet weak var contentImageView: UIImageView!

    var workItem: DispatchWorkItem?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        if let workItem = workItem {
            workItem.cancel()
        }
        contentImageView.image = nil
    }

    func configCell(withUrl urlString: String) {
        let placeHolderImage = #imageLiteral(resourceName: "placeHolder")
        workItem = DispatchWorkItem(block: { [weak self] in
            self?.contentImageView.kf.setImage(with: URL(string: urlString), placeholder: placeHolderImage, options: [
                    .processor(DownsamplingImageProcessor(size: CGSize(width: UIScreen.main.bounds.width, height: 200))),
                    .scaleFactor(UIScreen.main.bounds.width / 200),
                    .cacheOriginalImage
                ])
        })
        DispatchQueue.main.async(execute: workItem!)
    }

}
