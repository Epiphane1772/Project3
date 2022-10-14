//
//  Gharacter.swift
//  project3
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

// Class representing the players.
class Character {
    let name: String
    var life: Int
    let weapon: Weapon
    
    init(name: String, life: Int, weapon: Weapon) {
        self.name = name
        self.life = life
        self.weapon = weapon
    }
    
    func doAction(target: Character) {}
    
    // Healing function for the magus.
    func heal(striker: Character) {
        life += (striker.weapon.strikeStrength)
    }

    // Striking function for the fighters.
    func strike(striker: Character) {
        life -= (striker.weapon.strikeStrength)
    }
}

extension Character: CustomStringConvertible {
    var description: String {
        "\(name) weapon: \(weapon), life: \(life)"
    }
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name && lhs.life == rhs.life
    }
}
