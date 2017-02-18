//
//  Model.swift
//  Pods
//
//  Created by sasha klavsut on 18.02.17.
//
//

import Foundation



struct Model<T> {
    private(set) var data: T!
    private(set) var action: ((Int) -> ())?
}
