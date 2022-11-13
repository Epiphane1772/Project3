//
//  Game.swift
//  project3
//
//  Created by Stephane Lefebvre on 10/8/22.
//
import Foundation

// Declaration of the main class Game.
final class Game {
    
    private let maxCharacters = 3
    private var rounds = 0
    private var player1: Player?
    private var player2: Player?
    private var playerStriking: Player?
    private var playerNotStriking: Player?
    private var winner = ""
    private var striker: Character?
    private var target: Character?
    
    var names = [String]()
    
    // Starting the game.
    func start() {
        print(rules)
        player1 = initializePlayer(playerNumber: 1)
        player2 = initializePlayer(playerNumber: 2)
        player1?.number = 1
        player2?.number = 2
        playerStriking = player1
        playerNotStriking = player2
        while !oneTeamIsDecimated() {
            // Starting the fight.
            fight()
        }
        // Recapping the game.
        recap()
    }
    
    // Making sure the choice is in the range of the nuber of characters
    func readInCharactersRange() -> String{
//        var choice: String!
        let numRange = 1...maxCharacters
        guard var choice = readLine() else { return "" }
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
        let player = Player(name: name)
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
        guard var name = readLine() else { return ""}
        // catching simple returns.
        while name == "" {
            print("You must enter something!")
            if let name = readLine() {}
        }
        // Not allowing already existing names.
        while names.contains(name) {
            print("This name is already taken, enter another name:")
            if let name = readLine() {}
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
        guard var choice = readLine() else {return ""}
        while !choice.isInt {
            print("You must enter an integer!")
            choice = readLine()!
        }
        return choice
    }
    
    // Only allolwing strings that represent an integer.
    // and limiting to available characters.
    func readChoice(player: Player) -> String{
//        var choice: String!
        let numRange = 1...player.team.count
        guard var choice = readLine() else {return ""}
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
            
            if striker is Magus {
                print("Choose who you are going to heal:")
                playerStriking?.displayTeam()
                choice = readChoice(player: playerStriking!)
                target = playerStriking!.team[Int(choice)! - 1]
            } else {
                print("Choose who you are going to strike:")
                playerNotStriking?.displayTeam()
                choice = readChoice(player: playerNotStriking!)
                target = playerNotStriking!.team[Int(choice)! - 1]
            }
            
            striker?.doAction(target: target)
            
            swap(&playerStriking, &playerNotStriking)
        }
    }
}
