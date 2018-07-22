//
//  CollectionDetailInformationTableViewCell.swift
//  TestProjectVKSwift
//
//  Created by Максим Савченко on 22.07.2018.
//  Copyright © 2018 Максим Савченко. All rights reserved.
//

import UIKit

class CollectionDetailInformationTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionOfPerson: UICollectionView!
    
    private let categories: [String] = ["Друзья", "Общие", "Подписчики", "Фото", "Видео", "Аудио"]
    private let numbersInCategories: [Int] = [15, 522, 145, 42, 421, 53]
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionOfPerson.delegate = self
        collectionOfPerson.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbersInCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionCell", for: indexPath) as? DetailCollectionViewCell else { fatalError("Невозможно создать ячейку") }
        cell.configure(withModel: CollectionPersonality(categories: categories[indexPath.row], numbersInCategories: numbersInCategories[indexPath.row]))
        return cell
    }
    
}

struct CollectionPersonality {
    var categories: String?
    var numbersInCategories: Int?
}

