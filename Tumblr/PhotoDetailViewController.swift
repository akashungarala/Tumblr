//
//  PhotoDetailViewController.swift
//  Tumblr
//
//  Created by Akash Ungarala on 10/12/16.
//  Copyright © 2016 Akash Ungarala. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var publishDate: UILabel!
    @IBOutlet weak var photo: UIImageView!

    var post: NSDictionary!
    var imageUrl: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 30;
        avatar.layer.borderColor = UIColor(white: 0.7, alpha: 0.8).CGColor
        avatar.layer.borderWidth = 1;
        avatar.setImageWithURL(NSURL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/avatar")!)
        publishDate.text = convertDateFormater(post["date"] as! String)
        let image = post["photos"] as! [NSDictionary]
        let photoDetail = image[0]
        let original = photoDetail["original_size"] as! NSDictionary
        let url = original["url"] as! String
        imageUrl = NSURL(string: url)
        photo.setImageWithURL(imageUrl!)
    }
    
    @IBAction func onTapFullScreen(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("FullScreenSegue", sender: PhotoDetailViewController.self)
    }
    
    func convertDateFormater(date: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        guard let date = dateFormatter.dateFromString(date) else {
            assert(false, "no date from string")
            return ""
        }
        dateFormatter.dateFormat = "MMM d, yyyy HH:mm:ss z"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let timeStamp = dateFormatter.stringFromDate(date)
        return timeStamp
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? FullScreenPhotoViewController {
            destination.imageUrl = imageUrl!
        }
    }
    
    @IBAction func close(sender: UIStoryboardSegue) {}
    
}