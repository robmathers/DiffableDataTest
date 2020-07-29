//
//  PersonListController.swift
//  DiffableDataTest
//
//  Created by Rob Mathers on 2020-07-23.
//  Copyright © 2020 Rob Mathers. All rights reserved.
//

import UIKit

class PersonListController: UICollectionViewController {
    private lazy var dataSource = UICollectionViewDiffableDataSource<Section, Person>(collectionView: collectionView) { (collectionView, index, person) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonListCell.reuseIdentifier, for: index)
        if let personCell = cell as? PersonListCell {
            personCell.update(with: person.name)
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.register(UINib(nibName: "PersonListCell", bundle: .main), forCellWithReuseIdentifier: PersonListCell.reuseIdentifier)
        collectionView.collectionViewLayout = configureLayout()
    }
    
    private func configureLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 50)
        layout.minimumLineSpacing = 1
        return layout
    }
}

extension PersonListController {
    enum Section: CaseIterable {
        case main
    }
}
}
