//
//  Player.swift
//  sample
//
//  Created by Stephane Lefebvre on 10/9/22.
//
import Foundation

final class Player {
    let name: String
    var team = [Character]()
    
    init(name: String) {
        self.name = name
    }
    
    func appendCharacter(name: String, userChoice: String) {
        var character: Character!
        
        switch userChoice {
        case "1":
            character = Warrior(name: name, life: 100, weapon: Weapon(name: "Sword", strikeStrength: 20))
        case "2":
            character = Magus(name: name, life: 200, weapon: Weapon(name: "Wand", strikeStrength: 50))
        case "3":
            character = Dwarf(name: name, life: 50, weapon: Weapon(name: "Axe", strikeStrength: 150))
        default:
            print("You can only enter 1, 2 enter choice")
            break
        }
        team.append(character)
    }
    
    func getPlayerName() -> String {
        let name = game.getName()
        game.names.append(name)
        return name
    
    }

}
