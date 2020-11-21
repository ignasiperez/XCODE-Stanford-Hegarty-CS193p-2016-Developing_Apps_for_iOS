//
//  ViewController.swift
//  Calculator
//
//  Created by ignasiperez.com on 20/11/2020.
//

import UIKit

class ViewController: UIViewController {
  
  var isInTheMiddleOfTyping: Bool = false
  
  
  @IBOutlet weak var displayLabel: UILabel!
  

  @IBAction func digitTouched(_ sender: UIButton) {
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
  
  
  @IBAction func operationTouched(_ sender: UIButton) {
    isInTheMiddleOfTyping = false
    
    if let mathSymbol = sender.currentTitle {
      if mathSymbol == "π" {
        displayLabel.text = String(Double.pi)
      }
    }
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
}


