//
//  GlobalSemaphore.swift
//  GCDDemo
//
//  Created by can.khac.nguyen on 4/1/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import Foundation

class GlobalSemaphore {
    static let shared = GlobalSemaphore()

    let semaphore = DispatchSemaphore(value: 3)

    let arrayVideo = [
        "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4",
        "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_30mb.mp4",
        "https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_10mb.mp4",
        "https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_20mb.mp4",
        "https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_30mb.mp4",
        "https://sample-videos.com/video123/mp4/360/big_buck_bunny_360p_10mb.mp4",
        "https://sample-videos.com/video123/mp4/360/big_buck_bunny_360p_20mb.mp4",
        "https://sample-videos.com/video123/mp4/360/big_buck_bunny_360p_30mb.mp4"
    ]
}
