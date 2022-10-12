//
//  Weapon.swift
//  sample
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

// Mother class for the different weapons.
class Weapon {
    let name: String
    let strikeStrength: Int
    
    init(name: String, strikeStrength: Int) {
        self.name = name
        self.strikeStrength = strikeStrength
    }
}
