//
//  OptionManager.swift
//  WheelyApp
//
//  Created by Daniel Lam on 25/01/22.
//

import Foundation

struct OptionManager {
    static let shared = OptionManager()
    
    private var options: [Option] = []
    
    mutating func addOption(_ option: Option) {
        options.append(option)
    }
    
    func getAllOptions() -> [Option] {
        return options
    }

}
