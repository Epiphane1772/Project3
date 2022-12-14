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
    
    func doAction(target: Character?) {
        target?.life -= weapon.strikeStrength
    }
}
