//
//  ViewController.swift
//  Calculator
//
//  Created by ignasiperez.com on 14/11/2020.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private weak var displayLabel: UILabel!
  
  private var brain = CalculatorBrain()
  
  private var userIsInTheMiddleOfTyping = false
  
  private var displayValue: Double {
    get {
      return Double(displayLabel.text!)!
    }
    
    set {
      displayLabel.text = String(newValue)
    }
  }
  
  
  @IBAction private func digitTouched(_ sender: UIButton) {
    print("\(#function)")
    
    let digit = sender.currentTitle!
    
    if userIsInTheMiddleOfTyping {
      let textCurrentlyInDisplay = displayLabel.text!
      displayLabel.text = textCurrentlyInDisplay + digit
      
    } else {
      displayLabel.text = digit
    }
    
    userIsInTheMiddleOfTyping = true
  }
  
  
  @IBAction private func performOperationTouched(_ sender: UIButton) {
    if userIsInTheMiddleOfTyping {
      brain.setOperand(operand: displayValue)
      userIsInTheMiddleOfTyping = false
    }
    
    if let mathematicalSymbol = sender.currentTitle {
      brain.performOperation(symbol: mathematicalSymbol)
    }
    
    displayValue = brain.result
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
}

