//
//  PostTableViewCell.swift
//  instagram
//
//  Created by 渡邊翼 on 2016/04/27.
//  Copyright © 2016年 渡邊翼. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    var postData: PostData?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func commentButton(sender: AnyObject) {
        let ud = NSUserDefaults.standardUserDefaults()
        let name = ud.objectForKey(CommonConst.DisplayNameKey) as! String
        commentLabel.text = "comment: \(commentField!.text!)"
        nameLabel.text = "name: \(name)"
        
    }


    override func layoutSubviews() {
        
        postImageView.image = postData!.image
        captionLabel.text = "\(postData!.name!) : \(postData!.caption!)"
        
        let likeNumber = postData!.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP")
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.stringFromDate(postData!.date!)
        dateLabel.text = dateString
        
        if postData!.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            likeButton.setImage(buttonImage, forState: UIControlState.Normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            likeButton.setImage(buttonImage, forState: UIControlState.Normal)
        }
        
        super.layoutSubviews()
    }
}
