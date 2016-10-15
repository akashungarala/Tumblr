//
//  FullScreenPhotoViewController.swift
//  Tumblr
//
//  Created by Akash Ungarala on 10/15/16.
//  Copyright © 2016 Akash Ungarala. All rights reserved.
//

import UIKit
import AFNetworking

class FullScreenPhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageUrl: NSURL!

    override func viewDidLoad() {
        super.viewDidLoad()
        photo.setImageWithURL(imageUrl!)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photo
    }

}