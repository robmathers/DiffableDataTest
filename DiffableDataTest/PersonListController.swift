//
//  PersonListController.swift
//  DiffableDataTest
//
//  Created by Rob Mathers on 2020-07-23.
//  Copyright © 2020 Rob Mathers. All rights reserved.
//

import UIKit

class PersonListController: UICollectionViewController {
    private enum SortState {
        case unsorted
        case ascending
        case descending
    }
    
    @IBOutlet private weak var sortButton: UIBarButtonItem!
    
    private let personService = PersonService()
    private var sorted: SortState = .unsorted {
        didSet {
            switch sorted {
            case .unsorted: sortButton.image = UIImage(systemName: "arrowtriangle.up")
            case .ascending: sortButton.image = UIImage(systemName: "arrowtriangle.up.fill")
            case .descending: sortButton.image = UIImage(systemName: "arrowtriangle.down.fill")
            }
        }
    }
    
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
    
    @IBAction func didTapSortButton(_ sender: Any) {
        sortList()
    }
    
    @IBAction func didTapShuffleButton(_ sender: Any) {
        shuffleList()
    }
    
    private func sortList() {
        var snapshot = dataSource.snapshot()
        var sortedList = snapshot.itemIdentifiers.sorted()
        
        if sorted == .ascending {
            sortedList.reverse()
            sorted = .descending
        }
        else {
            sorted = .ascending
        }
        
        snapshot.replaceWithItems(sortedList)
        dataSource.apply(snapshot)
    }
    
    private func shuffleList() {
        var snapshot = dataSource.snapshot()
        snapshot.replaceWithItems(snapshot.itemIdentifiers.shuffled())
        dataSource.apply(snapshot)
        sorted = .unsorted
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
