//
//  FriendsTableViewCell.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 20.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
   
    @IBOutlet weak var nameOfFriend: UILabel!
    @IBOutlet weak var imageOfFriend: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(withModel model: FriendsItems)
    {
        nameOfFriend.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        imageOfFriend.downloadedFrom(link: model.photoSmall ?? "")
    }
    
}
