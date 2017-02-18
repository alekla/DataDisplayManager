//
//  Model.swift
//  Pods
//
//  Created by sasha klavsut on 18.02.17.
//
//

import Foundation



public struct Model<T> {
    public var data: T!
    public var action: ((Int) -> ())?
    
    
    public init(data: T,action:  ((Int) -> ())?) {
        self.data = data
        self.action = action
    }
}
