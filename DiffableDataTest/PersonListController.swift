//
//  PersonListController.swift
//  DiffableDataTest
//
//  Created by Rob Mathers on 2020-07-23.
//  Copyright © 2020 Rob Mathers. All rights reserved.
//

import UIKit

class PersonListController: UICollectionViewController {
    private let personService = PersonService()
    
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
        loadInitialData()
    }
    
    private func configureLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 50)
        layout.minimumLineSpacing = 1
        return layout
    }
    
    private func loadInitialData() {
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(personService.loadPeople())
        dataSource.apply(snapshot)
    }
    
    @IBAction func didTapShuffleButton(_ sender: Any) {
        shuffleList()
    }
    
    private func shuffleList() {
        var snapshot = dataSource.snapshot()
        let shuffled = snapshot.itemIdentifiers.shuffled()
        snapshot.deleteAllItems()
        snapshot.appendSections([.main])
        snapshot.appendItems(shuffled)
        dataSource.apply(snapshot)
    }
}

extension PersonListController {
    enum Section: CaseIterable {
        case main
    }
}

fileprivate extension NSDiffableDataSourceSnapshot
    where ItemIdentifierType == Person, SectionIdentifierType == PersonListController.Section
{
    mutating func replaceWithItems(_ newItems: [ItemIdentifierType]) {
        deleteAllItems()
        appendSections([.main])
        appendItems(newItems)
    }
}
