//
//  main.swift
//  CalculateTask
//
//  Created by hong on 2023/07/17.
//

import Foundation

DependencyInjector().inject()

main()

public func main() {
    
    let calculator = DependencyContainer.shared.find(Calculator.self)

    while true {
        print("------------------------------")
        print("\n4칙연산을 할 수 있는 계산기입니다.\n계산하고 싶은 연산을 입력해주세요.\n아래와 같은 형식으로 입력해주세요.\n예) 1 + 3\n종료하고 싶으시다면 -1을 입력해주세요.\n")
        let n = readLine()!
        if n == "-1" {
            print("이용해주셔서 감사합니다.")
            break
        }
        do {
            try calculator.inputProcess(n)
        } catch let error {
            print(error.localizedDescription)
        }
        print("------------------------------")
    }

}
