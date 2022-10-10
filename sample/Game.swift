//
//  Game.swift
//  sample
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

final class GameExample {
    let maxCharacters = 3
    var player1: Player?
    var player2: Player?
    var names = [String]()
    
    init() {}
    
    func start() {
        player1 = initializePlayer(playerNumber: 1)
        player2 = initializePlayer(playerNumber: 2)
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
        print("")
        print("RECAP:")
        print("")
        print("\(player1!.name):")
        print("\(player1!.team[0]):")
    }
  }
