//
//  Calculator.swift
//  CalculateTask
//
//  Created by hong on 2023/07/20.
//

import Foundation


public final class Calculator {
    
    private enum InputReadLineError: LocalizedError, Error {
        case typeConversionError
        case inputError
        case calculateTypeError
        case numberInputError
        case unkownError
        
        var errorDescription: String? {
            switch self {
            case .typeConversionError:
                return "변환 오류가 발생했습니다."
            case .inputError:
                return "잘못된 입력이 발생했습니다."
            case .calculateTypeError:
                return "연산자 입력 오류가 발생했습니다."
            case .numberInputError:
                return "숫자 입력 오류가 발생했습니다."
            case .unkownError:
                return "알 수 없는 오류가 발생했습니다."
            }
        }
    }
    private let addOperation: Operation
    private let subtractOperation: Operation
    private let multiplyOperation: Operation
    private let divideOperation: Operation
    
    init(
        addOperation: Operation,
        subtractOperation: Operation,
        multiplyOperation: Operation,
        divideOperation: Operation
    ) {
        self.addOperation = addOperation
        self.subtractOperation = subtractOperation
        self.multiplyOperation = multiplyOperation
        self.divideOperation = divideOperation
    }
    
    private func operation(x: Int, y: Int, type: CaculateType) {
//        print(#function)
        var equation = "\(x) \(type.rawValue) \(y) = "
        switch type {
        case .add:
            equation += String(addOperation.calculate(x: x, y: y))
        case .subtract:
            equation += String(subtractOperation.calculate(x: x, y: y))
        case .multiply:
            equation += String(multiplyOperation.calculate(x: x, y: y))
        case .divide:
            equation += String(divideOperation.calculate(x: x, y: y))
        case .none:
            equation = "계산할 수 없습니다."
        }
        print(equation)

    }
    
    public func inputProcess(_ inputMessage: String) throws {
//        print(#function)
        do {
            let messages = inputMessage.components(separatedBy: " ")
            if messages.count != 3 {
                throw InputReadLineError.inputError
            }
            guard let x = Int(messages[0]),
                  let y = Int(messages[2]) else {
                throw InputReadLineError.numberInputError
            }
            guard let calculateType = CaculateType(rawValue: messages[1]) else {
                throw InputReadLineError.calculateTypeError
            }
            operation(x: x, y: y, type: calculateType)
        } catch let error {
            guard let errorOcurred = error as? InputReadLineError else {
                throw InputReadLineError.unkownError
            }
            throw errorOcurred
        }
        
    }
    
}

