//
//  PersonListCell.swift
//  DiffableDataTest
//
//  Created by Rob Mathers on 2020-07-28.
//  Copyright © 2020 Rob Mathers. All rights reserved.
//

import UIKit

final class PersonListCell: UICollectionViewCell {
    static let reuseIdentifier = "PersonListCell"
    
    @IBOutlet private weak var initialLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initialLabel.layer.cornerRadius = 10
        initialLabel.layer.cornerCurve = .continuous
        initialLabel.layer.masksToBounds = true
    }

    override func prepareForReuse() {
        initialLabel.text = nil
        initialLabel.backgroundColor = .white
        
        nameLabel.text = nil
    }
    
    func update(with name: String) {
        initialLabel.text = name.first?.uppercased()
        nameLabel.text = name
    }
}
