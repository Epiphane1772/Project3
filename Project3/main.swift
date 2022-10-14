//
//  main.swift
//  project3
//
//  Created by Stephane Lefebvre on 10/8/22.
//

import Foundation

// Extensionn to check if the string input represents an integer.
extension String {
    var isInt: Bool {
        Int(self) != nil
    }
}

var game = Game()

game.start()

