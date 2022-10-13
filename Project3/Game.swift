//
//  Game.swift
//  project3
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

// Declaration of the main class Game.
final class Game {
    let maxCharacters = 3
    var player1: Player?
    var player2: Player?
    var names = [String]()
    var winner = ""
    var looser = ""
    var turn = 1
    var striker: Character?
    var target: Character?
    
    init() {}
    
    // Starting the game.
    func start() {
        player1 = initializePlayer(playerNumber: 1)
        player2 = initializePlayer(playerNumber: 2)
        while !oneTeamIsDead() {
            // Starting the kfight.
            fight()
        }
        // Recapping the game.
        recap()
    }
    
    // Initialising player's team.
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
            let characterChoice = readInt()
            player.appendCharacter(name: characterName, userChoice: characterChoice)
        }
        return player
    }
    
    // Getting the name and making sure it is unique.
    func getName() -> String {
        var name = readLine()!
        // catching simple returns.
        while name == "" {
            print("You must enter something!")
            name = readLine()!
        }
        // Not allowing already existing names.
        while names.contains(name) {
            print("This name is already taken, enter another name:")
            name = readLine()!
        }
        // Adding name to the list.
        names.append(name)
        return name
    }
    
    // Building the recapping of the game.
    func recap() {
        print("")
        print("RECAP:")
        print("")
        print("\(player1!.name):")
        player1?.displayTeam()
        player2?.displayTeam()
        if winner != "" {
            print("The winner is  \(winner)")
        }
    }
    
    // Checking if one of the player's team is decimated.
    func oneTeamIsDead() -> Bool {
        if player1?.team.count == 0 {
            winner = player2!.name
            looser = player1!.name
            return true
        }
        if player2?.team.count == 0 {
            winner = player1!.name
            looser = player2!.name
          return true
        }
        return false
    }
    
    // Allowing only strings that represent an integer.
    func readInt() -> String {
        var choice = readLine()!
        while !choice.isInt {
            print("You must enter an integer!")
            choice = readLine()!
        }
        return choice
    }
    
    // Only allolwing strings that represent an integer.
    // and limiting to available characters.
    func readChoice(player: Player) -> String{
        var choice: String!
        let numRange = 1...player.team.count
        choice = readLine()!
        while !choice.isInt {
            print("You must enter an integer!")
            choice = readLine()!
        }
        while !numRange.contains(Int(choice)!) {
            print("You can only enter a number between 1 and \(player.team.count)")
            choice = readLine()!
        }
        return choice
    }
    
    // The actual fight. Will run until a team is decimated.
    func fight() {
        var choice = ""
        recap()
        while !oneTeamIsDead() {
            print("DEBUG")
            print(player1!.team.count)
          print("DEBUG")
            print(player2!.team.count)
        
            if (turn == 1) {
                print("Player 1:")
                print("Choose your striker:")
                player1?.displayTeam()
                choice = readChoice(player: player1!)
                striker = player1!.team[Int(choice)! - 1]
                if striker!.weapon.name == "Wand" {
                    print("Choose who you are going to heal:")
                    player1?.displayTeam()
                    choice = readChoice(player: player1!)
                    target = player1!.team[Int(choice)! - 1]
                    target?.heal(striker: striker!)
                    turn = 2
                    recap()
                }
                else {
                    print("Choose who you are going to strike:")
                    player2?.displayTeam()
                    choice = readChoice(player: player2!)
                    target = player2!.team[Int(choice)! - 1]
                    target?.strike(striker: striker!)
                    removeIfDead(character: target!)
                    recap()
                    turn = 2
                }
            }
            else {
                print("Player 2:")
                print("Choose your striker:")
                player2?.displayTeam()
                choice = readChoice(player: player2!)
                striker = player2!.team[Int(choice)! - 1]
                if striker!.weapon.name == "Wand" {
                    print("Choose who you are going to heal:")
                    player2?.displayTeam()
                    choice = readChoice(player: player2!)
                    target = player2!.team[Int(choice)! - 1]
                    target?.heal(striker: striker!)
                    turn = 1
                    recap()
                }
                else {
                    print("Choose who you are going to strike:")
                    player1?.displayTeam()
                    choice = readChoice(player: player1!)
                    target = player1!.team[Int(choice)! - 1]
                    target?.strike(striker: striker!)
                    removeIfDead(character: target!)
                    turn = 1
                    recap()
                }
            }
        }
    }
    
//    // Striking function for the fighters.
//    func strike(character: Character) {
//        character.life -= (striker?.weapon.strikeStrength)!
//    }
//    
    // Removing the dead characters from the teams.
    func removeIfDead(character: Character) {
        for i in 0...(player2?.team.count)! - 1 {
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
