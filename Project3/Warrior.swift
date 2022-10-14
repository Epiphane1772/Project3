//
//  Warrior.swift
//  project3
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

// Class representing the character warrior.
final class Warrior: Character {
    let kind = "Warrior"
    let typeChar = 1
    
    override func doAction(target: Character) {
        target.life -= weapon.strikeStrength
    }
}
