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
    var number = 1
    var saysItsHisTurn: Bool
    
    init(name: String, saysItsHisTurn: Bool) {
        self.name = name
        self.saysItsHisTurn = saysItsHisTurn
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
    func getPlayerName(){
        let name = game.getName()
        game.names.append(name)
    }
    
    func displayTeam() {
        // making sure team is not empty. if it is stop here.
        guard !team.isEmpty else {
            return
        }
        
        print("\(name)'s team:")
        
        // Iterating through team an displaying content.
        for (index, character) in team.enumerated() {
            print("\(index + 1) - \(character)")
        }
    }
    
    // Removing the dead characters from the teams.
    func removeIfDead(character: Character) {
        // Setting index to character with life smaller thean or equal to zero.
        guard let index = team.firstIndex(where: { $0 == character && $0.life <= 0 }) else {
            return
        }
                              
        team.remove(at: index)
    }
    
    func isDead() -> Bool {
        return team.isEmpty
    }
}
