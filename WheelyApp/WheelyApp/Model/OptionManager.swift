//
//  OptionManager.swift
//  WheelyApp
//
//  Created by Daniel Lam on 25/01/22.
//

import Foundation

struct OptionManager {
    static var options: [Option] = []
    
    func addOption(_ option: Option) {
        OptionManager.options.append(option)
    }

}
