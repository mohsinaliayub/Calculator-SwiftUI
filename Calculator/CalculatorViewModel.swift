//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Mohsin Ali Ayub on 09.10.24.
//

import Observation

@Observable
class CalculatorViewModel {
    /// The equations to display to the user.
    var output = ""
    
    func numberTapped(_ number: Int) {
        output += String(number)
    }
    
    func clearDisplay() {
        output = ""
    }
    
    func operationTapped(_ operation: Operation) {
        
    }
}

enum Operation {
    case addition
    case subtraction
    case multiplication
    case division
    case equal
}
