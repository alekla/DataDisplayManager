//
//  TableViewElements.swift
//  DataDisplayManager
//
//  Created by sasha klavsut on 18.02.17.
//  Copyrhs © 2017 sasha klavsut. All rhss reserved.
//

import Foundation
import UIKit


public protocol SettableCell {
    associatedtype T
    
    func configure(model: Model<T>, state: Bool)
    static var cellIdentifier: String { get }
    static var rowHeight: CGFloat? { get }
    static var estimatedHeight: CGFloat? { get }
}



public enum DataTableActionType {
    case select
    case deselect
    case configure
    
    func name() -> String {
        switch self {
        case .select:
            return "select"
        case .deselect:
            return "deselect"
        default:
            fatalError("Unexpected index")
        }
    }
}


public func += (lhs: CollectionDataManager, rhs: DataSection) {
    lhs.append(rhs)
}

public func += (lhs: CollectionDataManager, rhs: [DataSection]) {
    lhs.append(rhs)
}

public func += (lhs: TableDataManager, rhs: DataSection) {
    lhs.append(rhs)
}

public func += (lhs: TableDataManager, rhs: [DataSection]) {
    lhs.append(rhs)
}



