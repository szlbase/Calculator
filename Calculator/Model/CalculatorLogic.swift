//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by LIN SHI ZHENG on 23/12/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    var intermediateCalculation: (operation: String, firstNumber: Double)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(using operation: String) -> Double? {
        
        if let number = number {
            switch operation {
            case "+/-":
                return number * -1
            case "AC":
                return 0
            case "%":
                return number * 0.01
            case "=":
                return performTwoNumCalculation(secondNumber: number)
            default:
                intermediateCalculation = (operation: operation, firstNumber: number)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(secondNumber: Double) -> Double {
        
        guard let firstNumber = intermediateCalculation?.firstNumber, let operation = intermediateCalculation?.operation else {
            fatalError("Cannot find operation or first number!")
        }
        
        switch operation {
        case "+":
            return firstNumber + secondNumber
        case "÷":
            return firstNumber / secondNumber
        case "×":
            return firstNumber * secondNumber
        case "-":
            return firstNumber - secondNumber
        default:
            fatalError("No matching operation!")
        }
        
    }
}
