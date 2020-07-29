//
//  Person.swift
//  DiffableDataTest
//
//  Created by Rob Mathers on 2020-07-28.
//  Copyright © 2020 Rob Mathers. All rights reserved.
//

import Foundation

struct Person: Hashable {
    var name: String
}

extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.name < rhs.name
    }
}
