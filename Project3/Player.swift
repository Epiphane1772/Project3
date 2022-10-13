//
//  Player.swift
//  project3
//
//  Created by Stephane Lefebvre on 10/9/22.
//
import Foundation

// Defining the players.
final class Player {
    let name: String
    var team = [Character]()
    
    init(name: String) {
        self.name = name
    }
    
    // Adding character to the team.
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
            print("You can only enter 1, 2 or 3, enter choice:")
            break
        }
        team.append(character)
    }
    
    // Getting the player;s name.
    func getPlayerName() -> String {
        let name = game.getName()
        game.names.append(name)
        return name
    }
    
    func displayTeam() {
        print("\(name)'s team:")
        if team.count > 0 {
            for i in 0...team.count - 1 {
                print("\(team[i].name) weapon: \(team[i].weapon.name), life: \(team[i].life) ")
            }
        }
    }
}
