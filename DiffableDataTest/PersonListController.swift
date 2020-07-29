//
//  PersonListController.swift
//  DiffableDataTest
//
//  Created by Rob Mathers on 2020-07-23.
//  Copyright © 2020 Rob Mathers. All rights reserved.
//

import UIKit

class PersonListController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.register(UINib(nibName: "PersonListCell", bundle: .main), forCellWithReuseIdentifier: PersonListCell.reuseIdentifier)
    }
}
