//
//  DetailInformationTableViewCell.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import UIKit

class DetailInformationTableViewCell: UITableViewCell {
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var statusOfPerson: UILabel!
    @IBOutlet weak var imageOfPerson: ImageOfFriendsUIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(withModel model: FriendsItems) {
        nameOfPerson.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        statusOfPerson.text = model.onlineStr
        imageOfPerson.downloadedFrom(link: model.photoBig ?? "")
    }
    
}
