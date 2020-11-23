//
//  ViewController.swift
//  Calculator
//
//  Created by ignasiperez.com on 20/11/2020.
//

import UIKit

class ViewController: UIViewController {
  
  private var brain = CalculatorBrain()
  
  private var isInTheMiddleOfTyping: Bool = false
  
  private var displayValue: Double {
    get {
      return Double(displayLabel.text!)!
    }
    
    set {
      displayLabel.text = String(newValue)
    }
  }
  
  
  @IBOutlet private weak var displayLabel: UILabel!
  
  
  @IBAction private func digitTouched(_ sender: UIButton) {
    print("\n\nViewController - \(#function)")
    
    let digit = sender.currentTitle!
    print(" - digit: \(digit)")
    
    if isInTheMiddleOfTyping {
      let textCurrentlyInDisplay = displayLabel.text
      displayLabel.text = textCurrentlyInDisplay! + digit
    } else {
      displayLabel.text = digit
    }
    
    isInTheMiddleOfTyping = true
  }
  
  
  @IBAction private func operationTouched(_ sender: UIButton) {
    if isInTheMiddleOfTyping {
      brain.setOperand(operand: displayValue)
      
      isInTheMiddleOfTyping = false
    }
    
    if let mathSymbol = sender.currentTitle {
      brain.performOperation(symbol: mathSymbol)
    }
    
    displayValue = brain.result
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
}


