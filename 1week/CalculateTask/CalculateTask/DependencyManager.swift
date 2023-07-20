//
//  DependencyInjector.swift
//  CalculateTask
//
//  Created by hong on 2023/07/20.
//

import Foundation

public final class DependencyContainer {
    
    static let shared = DependencyContainer()
    
    private var container: [Dependency: Any] = [:]
    
    private init() {}
    
    
    public func regist<T>(
        _ type: T.Type,
        implement: Any
    ) {
        let dependency = Dependency(type)
        container[dependency] = implement
    }
    
    public func find<T>(
        _ type: T.Type
    ) -> T {
        let dependency = Dependency(type)
        if let implement = container[dependency] as? T {
            return implement
        } else {
            fatalError("\(type) 오류 발생")
        }
    }
    
    public func remove<T>(
        _ type: T.Type
    ) {
        let dependency = Dependency(type)
        container.removeValue(forKey: dependency)
    }
    
}

final public class Dependency: Hashable, Equatable {
    
    private let identity: String
    private let type: Any.Type
    
    public init(_ type: Any.Type) {
        self.identity = String(describing: type)
        self.type = type
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identity)
    }
    static public func == (lhs: Dependency, rhs: Dependency) -> Bool {
        return lhs.type == rhs.type && lhs.identity == rhs.identity
    }
    
}

final public class DependencyInjector {
    
    public func inject() {
        let dependencyContainer = DependencyContainer.shared
        
        dependencyContainer.regist(AddOperation.self, implement: AddOperation())
        dependencyContainer.regist(SubtractOperation.self, implement: SubtractOperation())
        dependencyContainer.regist(MultiplyOperation.self, implement: MultiplyOperation())
        dependencyContainer.regist(DivideOperation.self, implement: DivideOperation())
    }
    
}
