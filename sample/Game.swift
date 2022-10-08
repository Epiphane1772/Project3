//
//  Game.swift
//  sample
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

final class GameExample {
    var character: MotherClass
    
    init(character: MotherClass) {
        self.character = character
    }
    
    func start() {
        // read name...
        let name = readLine()!
        // then read type choice
        let userChoice = readLine()!
        // var character: MotherClass
        
        switch userChoice {
        case "1":
            character = FirstSubclass(name: name, life: 100, weapon: Weapon(name: "Axe", strenght: 20))
        case "2":
            character = SecondSubclass(name: name, life: 200, weapon: Weapon(name: "Rifle", strenght: 50))
        default: break // This case must be handled
        }
    }
    func printtype() {
       //  print(game.character)
    }

  }
