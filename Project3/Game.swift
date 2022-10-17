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
    var rounds = 0
    var player1: Player?
    var player2: Player?
    var swapper: Player?
    var playerStriking: Player?
    var playerNotStriking: Player?
    var names = [String]()
    var winner = ""
    var striker: Character?
    var target: Character?
    
    init() {}
    
    // Starting the game.
    func start() {
        player1 = initializePlayer(playerNumber: 1)
        player2 = initializePlayer(playerNumber: 2)
        player1?.number = 1
        player2?.number = 2
        player1?.saysItsHisTurn = true
        player2?.saysItsHisTurn = false
        playerStriking = player1
        playerNotStriking = player2
        while !oneTeamIsDecimated() {
            // Starting the fight.
            fight()
        }
        // Recapping the game.
        recap()
    }
    
    func readInCharactersRange() -> String{
        var choice: String!
        let numRange = 1...maxCharacters
        choice = readLine()!
        while !choice.isInt {
            print("You must enter an integer between 1 and \(maxCharacters) !")
            choice = readInt()
        }
        while !numRange.contains(Int(choice)!) {
            print("You can only enter a number between 1 and \(maxCharacters)")
            choice = readInt()
        }
        return choice
    }
    
    
    // Initialising player's team.
    private func initializePlayer(playerNumber: Int) -> Player {
        print("Player \(playerNumber) enter your name")
        var name = game.getName()
        let player = Player(name: name, saysItsHisTurn: true)
        print("\(player.name) choose your team!")
        for i in 0...maxCharacters - 1 {
            print("Enter character number \(i + 1)'s name:")
            name = game.getName()
            let characterName = name
            print("Enter 1 for warrior, 2 for magus, 3 for dwarf")
            let characterChoice = readInCharactersRange()
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
        print("Number of rounds: \(rounds)")
        print("\(player1?.name ?? ""):")
        player1?.displayTeam()
        player2?.displayTeam()
        if winner != "" {
            print("The winner is  \(winner)")
        }
    }
    
    // Checking if one of the player's team is decimated.
    func oneTeamIsDecimated() -> Bool {
        guard let player1, let player2 else { return false }
        
        if player1.isDead() {
            winner = player2.name
            return true
        } else if player2.isDead() {
            winner = player1.name
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
            choice = readChoice(player: player)
        }
        return choice
    }
    
    // The actual fight. Will run until a team is decimated.
    func fight() {
        var choice = ""
        recap()
        while !oneTeamIsDecimated() {
            rounds += 1
            print("\(playerStriking!.name):")
            print("Choose your striker:")
            playerStriking!.displayTeam()
            choice = readChoice(player: playerStriking!)
            striker = playerStriking!.team[Int(choice)! - 1]
            if striker!.weapon.name == "Wand" {
                print("Choose who you are going to heal:")
                playerStriking?.displayTeam()
                choice = readChoice(player: playerStriking!)
                target = playerStriking!.team[Int(choice)! - 1]
                target?.heal(striker: striker!)
                swapper = playerStriking
                playerStriking = playerNotStriking
                playerNotStriking = swapper
                recap()
            }
            else {
                print("Choose who you are going to strike:")
                playerNotStriking?.displayTeam()
                choice = readChoice(player: playerNotStriking!)
                target = playerNotStriking!.team[Int(choice)! - 1]
                target?.strike(striker: striker!)
                playerNotStriking!.removeIfDead(character: target!)
                recap()
                swapper = playerStriking
                playerStriking = playerNotStriking
                playerNotStriking = swapper
            }
        }
    }
}

