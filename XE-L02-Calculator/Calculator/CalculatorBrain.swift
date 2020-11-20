//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by ignasiperez.com on 15/11/2020.
//

import Foundation

//enum Optional<T> {
//  case None
//  case Some(T)
//}

class CalculatorBrain {
  
  private var accumulator = 0.0
  
  private var operations: Dictionary<String, Operation> = [
    "π": Operation.Constant(Double.pi),
    "e": Operation.Constant(M_E),
    "√": Operation.UnaryOperation(sqtr),
    "cos": Operation.UnaryOperation(cos),
  ]
  
  
  enum Operation {
    case Constant(Double)
    case UnaryOperation((Double) -> Double)
    case BinaryOperation
    case Equals
  }
  
  
  var result: Double {
    get {
      return accumulator
    }
  }
  
  
  func setOperand(operand: Double) {
    accumulator = operand
  }
  
  
  func performOperation(symbol: String) {
//    switch symbol {
//    case "π":
//      accumulator = Double.pi
//    case "√":
//      accumulator = sqrt(accumulator)
//    default:
//      break
//    }
    
    
//    if let constant = operations[symbol] {
//      accumulator = constant
//    }
    
    
    if let operation = operations[symbol] {
      switch operation {
      case .Constant(let value): accumulator = value
      case .UnaryOperation(let function): accumulator = function(accumulator)
      case .BinaryOperation:
        break
      case .Equals:
        break
      }
    }
    
  }
  
}
