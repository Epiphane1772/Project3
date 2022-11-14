//
//  extensions.swift
//  sample
//
//  Created by Stephane Lefebvre on 11/13/22.
//

//  ---------

// Extensionn to check if the string input represents an integer.
extension String {
    var isInt: Bool {
        Int(self) != nil
    }
}

extension Character: CustomStringConvertible {
    var description: String {
        "\(name) weapon: \(weapon), life: \(life)"
    }
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name && lhs.life == rhs.life
    }
}
