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
    
    var doubleTapAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initialLabel.layer.cornerRadius = 10
        initialLabel.layer.cornerCurve = .continuous
        initialLabel.layer.masksToBounds = true
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapGesture)
    }

    override func prepareForReuse() {
        initialLabel.text = nil
        initialLabel.backgroundColor = .systemBackground
        
        nameLabel.text = nil
    }
    
    func update(with name: String) {
        initialLabel.text = name.first?.uppercased()
        nameLabel.text = name
        
        initialLabel.backgroundColor = UIColor.from(string: name)
    }
    
    @IBAction func didDoubleTap(_ sender: Any) {
        doubleTapAction?()
    }
}

fileprivate extension UIColor {
    static func from(string: String) -> UIColor {
        guard !string.isEmpty else { return .white }
        let hash: Int = string.hashValue
        let red: Int = (hash & 0xFF0000) >> 16
        let green: Int = (hash & 0x00FF00) >> 8
        let blue: Int = (hash & 0x0000FF)
        
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
    }
}
