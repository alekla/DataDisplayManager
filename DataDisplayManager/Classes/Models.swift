//
//  Model.swift
//  Pods
//
//  Created by sasha klavsut on 18.02.17.
//
//

import UIKit



open class Model<T> {
    public var data: T!
    public var action: ((Int) -> ())?
    
    
    public init(data: T,action:  ((Int) -> ())?) {
        self.data = data
        self.action = action
    }
}


open class ActionModel<CellType> {
    public var cell: CellType!
    public var state: Bool!
    public var indexPath: IndexPath!
    public init(cell: CellType!, state: Bool!, indexPath: IndexPath!) {
        self.cell = cell
        self.state = state
        self.indexPath = indexPath
    }
}
