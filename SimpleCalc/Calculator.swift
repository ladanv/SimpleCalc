//
//  Calculator.swift
//  SimpleCalc
//
//  Created by Vitaliy.Ladan on 15.11.14.
//  Copyright (c) 2014 Vitaliy.Ladan. All rights reserved.
//

import Foundation

public class Calculator {
    
    var firstOperand, secondOperand: Double
    var operation: String?
    
    init() {
        firstOperand = 0
        secondOperand = 0
    }
    
    public func calculate() -> Double? {
        var result: Double?
        if let op = operation {
            switch op {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case "×":
                result = firstOperand * secondOperand
            case "÷":
                // можно не проверять secondOperand на ноль, 
                // так как свифт это и так обработает и вернет "не число"
                result = firstOperand / secondOperand
            default:
                result = nil
            }
        }
        return result
    }
    
    public func reset() {
        firstOperand = 0
        secondOperand = 0
        operation = nil
    }
}