//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by ignasiperez.com on 22/11/2020.
//

import Foundation

func multiply(op1: Double,
              op2: Double) -> Double {
  
  return op1 * op2
}


class CalculatorBrain {
  
  private var accumulator: Double = 0.0
  
  private var operations: Dictionary<String, Operation> = [
    "π": Operation.Constant(Double.pi),
    "e": Operation.Constant(M_E),
    "±": Operation.UnaryOperation({ -$0 }),
    "√": Operation.UnaryOperation(sqrt),
    "cos": Operation.UnaryOperation(cos),
    "×": Operation.BinaryOperation({ $0 * $1 }),
    "÷": Operation.BinaryOperation({ $0 / $1 }),
    "+": Operation.BinaryOperation({ $0 + $1 }),
    "-": Operation.BinaryOperation({ $0 - $1 }),
    "=": Operation.Equals
  ]
  
  private enum Operation {
    case Constant(Double)
    case UnaryOperation((Double) -> Double)
    case BinaryOperation((Double, Double) -> Double)
    case Equals
  }
  
  
  private var pending: PendingBinaryOperationInfo?
  
  private struct PendingBinaryOperationInfo {
    var binaryFunction: (Double, Double) -> Double
    var firstOperand: Double
  }
  
  var result: Double {
    get {
      return accumulator
    }
  }
  
  func setOperand(operand: Double) {
    print("\n\nCalculatorBrain - \(#function)")
    
    accumulator = operand
    print(" - accumulator: \(accumulator)")
  }
  
  
  func performOperation(symbol: String) {
    print("\n\nCalculatorBrain - \(#function)")
    print(" - symbol: \(symbol)")
    
    if let operation = operations[symbol] {
      print(" - operation: \(operation)")
      switch operation {
      case .Constant(let value):
        accumulator = value
        print(" - case .Constant - accumulator: \(accumulator)")
      case .UnaryOperation(let function):
        print(" - case .UnaryOperation - function: \(String(describing: function))")
        print(" - case .UnaryOperation - accumulator: \(accumulator)")
        accumulator = function(accumulator)
        print(" - case .UnaryOperation - accumulator: \(accumulator)")
      case .BinaryOperation(let function):
        executePendingBinaryOperation()
        pending = PendingBinaryOperationInfo(binaryFunction: function,
                                             firstOperand: accumulator)
      case .Equals:
        executePendingBinaryOperation()
      }
    }
  }
  
  
  private func executePendingBinaryOperation() {
    if pending != nil {
      accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
      pending = nil
    }
  }
  
}
