//
//  DetailCollectionViewCell.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameOfItems: UILabel!
    @IBOutlet weak var numberOfItems: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    public func configure(withModel model: CollectionPersonality) {
        nameOfItems.text = model.categories
        numberOfItems.text = "\(model.numbersInCategories ?? 0)"
    }
    
}
