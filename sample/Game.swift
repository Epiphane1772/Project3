//
//  Game.swift
//  sample
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

final class Game {
    let maxCharacters = 3
    var player1: Player?
    var player2: Player?
    var names = [String]()
    var winner = 0
    var looser = 0
    var turn = 1
    var striker: Character?
    var target: Character?
    
    init() {
        
    }
    
    func start() {
        player1 = initializePlayer(playerNumber: 1)
        player2 = initializePlayer(playerNumber: 2)
        while !oneTeamIsDead() {
            fight()
        }
        recap()
        
    }
    
    private func initializePlayer(playerNumber: Int) -> Player {
        print("Player \(playerNumber) enter your name")
        var name = game.getName()
        let player = Player(name: name)
        print("\(player.name) choose your team!")
        for i in 0...maxCharacters - 1 {
            print("Enter character number \(i + 1)'s name:")
            name = game.getName()
            let characterName = name
            print("Enter 1 for warrior, 2 for magus, 3 for dwarf")
            let characterChoice = readLine()!
            player.appendCharacter(name: characterName, userChoice: characterChoice)
        }
        
        return player
    }
    
    func getName() -> String {
        var name = readLine()!
        while names.contains(name) {
            print("This name is already taken, enter another name:")
            name = readLine()!
        }
        names.append(name)
        return name
    }
    
    func printtype() {
        //  print(game.character)
    }
    
    func recap() {
        func displayTeam(player: Player) {
            print("\(player.name)'s team:")
            for i in 0...player.team.count - 1 {
                print("\(player.team[i].name) weapon: \(player.team[i].weapon), life: \(player.team[i].life) ")
            }
        }
        print("")
        print("RECAP:")
        print("")
        print("\(player1!.name):")
        displayTeam(player: player1!)
        displayTeam(player: player2!)
        
    }
    
    func oneTeamIsDead() -> Bool {
        if (isDead(character: player1!.team[0]) &&
            isDead(character: player1!.team[1]) &&
            isDead(character: player1!.team[2])) {
            return true
        }
        if (isDead(character: player2!.team[0]) &&
            isDead(character: player2!.team[1]) &&
            isDead(character: player2!.team[2])) {
            return true
        }
        return false
    }
    
    func fight() {
        var choice = ""
        recap()
        repeat {
            if (turn == 1) {
                print("Player 1:")
                print("Choose your striker:")
                displayTeam(player: player1!)
                choice = readLine()!
                striker = player1!.team[Int(choice)! - 1]
                if striker!.weapon.name == "Wand" {
                    print("Choose who you are going to heal:")
                    displayTeam(player: player1!)
                    choice = readLine()!
                    target = player1!.team[Int(choice)! - 1]
                    heal(character: target!)
                    turn = 2
                    recap()
                }
                else {
                    print("Choose who you are going to strike:")
                    displayTeam(player: player2!)
                    choice = readLine()!
                    target = player2!.team[Int(choice)! - 1]
                    strike(character: target!)
                    removeIfDead(character: target!)
                    recap()
                    turn = 2
                }
            }
            else {
                print("Player 2:")
                print("Choose your striker:")
                displayTeam(player: player2!)
                choice = readLine()!
                striker = player2!.team[Int(choice)! - 1]
                if striker!.weapon.name == "Wand" {
                    print("Choose who you are going to heal:")
                    displayTeam(player: player2!)
                    choice = readLine()!
                    target = player2!.team[Int(choice)! - 1]
                    heal(character: target!)
                    turn = 1
                    recap()
                }
                else {
                    print("Choose who you are going to strike:")
                    displayTeam(player: player1!)
                    choice = readLine()!
                    target = player1!.team[Int(choice)! - 1]
                    strike(character: target!)
                    removeIfDead(character: target!)
                    turn = 1
                    recap()
                }
                
            }
        } while !oneTeamIsDead()
    }
    
    func displayTeam(player: Player) {
        for i in 0...player.team.count - 1 {
            print("\(i + 1) for \(player.team[i]) )")
        }
    }
    func isDead(character: Character) -> Bool {
        var status = false
        if character.life <= 0 {
            status = true
        }
        else {
            status = false
        }
        return status
    }
    
    func chooseCharacter(player: Player) {
        for i in 0...player.team.count - 1 {
            print("\(i + 1) for \(player.team[i])")
        }
    }
    
    func heal(character: Character) {
        character.life += (striker?.weapon.strikeStrength)!
    }
    
    func strike(character: Character) {
        character.life -= (striker?.weapon.strikeStrength)!
    }
    
    func removeIfDead(character: Character) {
        for i in 1...(player2?.team.count)! - 1 {
            if (player2?.team[i].life)! <= 0 {
                player2?.team.remove(at: i)
            }
            for i in 0...(player1?.team.count)! - 1 {
                if (player1?.team[i].life)! <= 0 {
                    player1?.team.remove(at: i)
                }
            }
        }
    }
}
