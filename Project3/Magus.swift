//
//  Magus.swift
//  project3
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

// Class representing the character magus.
final class Magus: Character {
    let kind = "Magus"
    
    override func doAction(striker: Character) {
        life += (striker.weapon.strikeStrength)
    }
}
