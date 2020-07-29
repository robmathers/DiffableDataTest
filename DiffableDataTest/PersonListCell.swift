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
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
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
    
    override func systemLayoutSizeFitting(
        _ targetSize: CGSize,
        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
        verticalFittingPriority: UILayoutPriority
    ) -> CGSize {
        // Use the target size with a large height, so the height is variable, and width is fixed
        var flexibleHeight = targetSize
        flexibleHeight.height = CGFloat.greatestFiniteMagnitude
        
        return super.systemLayoutSizeFitting(
            flexibleHeight,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
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
