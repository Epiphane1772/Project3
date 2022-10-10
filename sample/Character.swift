//
//  MotherClass.swift
//  sample
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

class Character {
    let name: String
    let life: Int
    let weapon: Weapon
    
    init(name: String, life: Int, weapon: Weapon) {
        self.name = name
        self.life = life
        self.weapon = weapon
    }
}
