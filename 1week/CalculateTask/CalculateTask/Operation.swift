//
//  Operation.swift
//  CalculateTask
//
//  Created by hong on 2023/07/20.
//

import Foundation

public enum CaculateType: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case none
}

protocol Operation {
    var type: CaculateType { get set }
    func calculate(x: Int, y: Int) -> Int
}

public class AbstractOperation: Operation {
    var type: CaculateType = .none
    public func calculate(x: Int, y: Int) -> Int { return -1 }
}

public final class AddOperation: AbstractOperation {
    override init() {
        super.init()
        type = .add
    }
    override public func calculate(x: Int, y: Int) -> Int {
//        print(#function)
        return x+y
    }
}

public final class SubtractOperation: AbstractOperation {
    override public init() {
        super.init()
        self.type = .subtract
    }
    override public func calculate(x: Int, y: Int) -> Int {
//        print(#function)
        return x-y
    }
}

public final class MultiplyOperation: AbstractOperation {
    override public init() {
        super.init()
        self.type = .multiply
    }
    override public func calculate(x: Int, y: Int) -> Int {
//        print(#function)
        return x*y
    }
}

public final class DivideOperation: AbstractOperation {
    override public init() {
        super.init()
        self.type = .divide
    }
    override public func calculate(x: Int, y: Int) -> Int {
//        print(#function)
        return x/y
    }
}
