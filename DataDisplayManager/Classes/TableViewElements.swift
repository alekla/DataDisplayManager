//
//  TableViewElements.swift
//  DataDisplayManager
//
//  Created by sasha klavsut on 18.02.17.
//  Copyright © 2017 sasha klavsut. All rights reserved.
//

import Foundation
import UIKit


public protocol ConfigurableCell {
    associatedtype T
    
    func configure(model: Model<T>, state: Bool)
    
    static var cellIdentifier: String { get }
    static var rowHeight: CGFloat { get }
    static var estimatedHeight: CGFloat { get }
}



public enum DataTableActionType {
    case select
}



