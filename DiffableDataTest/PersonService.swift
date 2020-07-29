//
//  PersonService.swift
//  DiffableDataTest
//
//  Created by Rob Mathers on 2020-07-28.
//  Copyright © 2020 Rob Mathers. All rights reserved.
//

import Foundation

class PersonService {
    func loadPeople(count: Int = 15) -> [Person] {
        var list: [Person] = []
        
        while list.count < count && !people.isEmpty {
            let next = Int.random(in: 0 ..< people.count)
            list.append(people.remove(at: next))
        }
        
        return list
    }
    
    private var people = [
        Person(name: "Mathilde Dufour"),
        Person(name: "Marvin Mendoza"),
        Person(name: "Torsten Akkermans"),
        Person(name: "Olive Taylor"),
        Person(name: "Louison David"),
        Person(name: "Jakob Black"),
        Person(name: "Maya Muller"),
        Person(name: "Liam Ortiz"),
        Person(name: "Elsie Hernandez"),
        Person(name: "پریا احمدی"),
        Person(name: "Gabe Hill"),
        Person(name: "Hudson Patel"),
        Person(name: "Cecil Anderson"),
        Person(name: "Wilson Costa"),
        Person(name: "Phoebe Harvey"),
        Person(name: "Etienne Gill"),
        Person(name: "Aaron Tucker"),
        Person(name: "Ceylan Fahri"),
        Person(name: "Hudson Chan"),
        Person(name: "Cindy Reichardt"),
        Person(name: "Alma Thomsen"),
        Person(name: "Ceyhun Duygulu"),
        Person(name: "Türkan Steinmetz"),
        Person(name: "Gertrud Masson"),
        Person(name: "Jessie Morris"),
        Person(name: "Ewald Fellner"),
        Person(name: "Isac Hatlestad"),
        Person(name: "Nino Gaillard"),
        Person(name: "Thea Patel"),
        Person(name: "Dawid Natvig"),
        Person(name: "Darren May"),
        Person(name: "Wade Edwards"),
        Person(name: "Ece Kutlay"),
        Person(name: "Eddie Gabriel"),
        Person(name: "Virgil Rose"),
        Person(name: "Mille Pedersen"),
        Person(name: "Julia Horton"),
        Person(name: "Austin Holland"),
        Person(name: "Liam Richards"),
        Person(name: "Olivia Miller"),
        Person(name: "Aracema Santos"),
        Person(name: "Aiden Pelletier"),
        Person(name: "Samuel Colin"),
        Person(name: "Dieter Tiedemann"),
        Person(name: "Silvan Legrand"),
        Person(name: "Jannis Bock"),
        Person(name: "Teo Skretting"),
        Person(name: "Brittany Wheeler"),
        Person(name: "Don Garrett"),
        Person(name: "Holly Hanson")
    ]
}
