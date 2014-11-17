//
//  AppDelegate.swift
//  SimpleCalc
//
//  Created by Vitaliy.Ladan on 13.11.14.
//  Copyright (c) 2014 Vitaliy.Ladan. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var display: NSTextField!

    private var newDigit: Bool
    private let calc: Calculator
    
    override init() {
        calc = Calculator()
        newDigit = true
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func resetButtonClick(sender: NSButton) {
        display.stringValue = "0"
        calc.reset()
        newDigit = true
    }
    
    @IBAction func deleteButtonClick(sender: NSButton) {
        let strDisp = display.stringValue
        let countDigits = countElements(strDisp)
        if countDigits > 0 {
            display.stringValue = strDisp.substringToIndex(advance(strDisp.startIndex, countDigits - 1))
        }
    }
    
    @IBAction func changeSignButtonClick(sender: NSButton) {
        let strDisp = display.stringValue
        if strDisp.hasPrefix("-") {
            display.stringValue = strDisp.substringFromIndex(advance(strDisp.startIndex, 1))
        } else {
            display.stringValue = "-" + display.stringValue
        }
    }
    
    @IBAction func commaButtonClick(sender: NSButton) {
        if display.stringValue.rangeOfString(",") == nil {
            display.stringValue += ","
        }
    }
    
    @IBAction func equalButtonClick(sender: NSButton) {
        calc.secondOperand = stringToDouble(replaceCommaWithDot(display.stringValue))
        if let result = calc.calculate() {
            display.doubleValue = result
        }
        calc.firstOperand = calc.secondOperand
        calc.operation = nil
    }
    
    @IBAction func operationButtonClick(sender: NSButton) {
        calc.firstOperand = stringToDouble(replaceCommaWithDot(display.stringValue))
        calc.operation = sender.title
        newDigit = true
    }
    
    @IBAction func operandButtonClick(sender: NSButton) {
        if newDigit {
            display.stringValue = sender.title
            newDigit = false
        } else {
            display.stringValue += sender.title
        }
    }
    
    func replaceCommaWithDot(let str: String) -> String {
        return str.stringByReplacingOccurrencesOfString(",", withString: ".", options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func stringToDouble(let str: String) -> Double {
        return NSString(string: str).doubleValue
    }
    
}

