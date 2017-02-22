//
//  DataTableSection.swift
//  Pods
//
//  Created by sasha klavsut on 18.02.17.
//
//

import Foundation


open class DataSection {
    private(set) var rows = [Row]()
    
    public init() {
        
    }
    public var headerHeight: CGFloat?
    public var footerHeight: CGFloat?
    public var headerView: UIView?
    public var footerView: UIView?
    public var headerTitle: String?
    public var footerTitle: String?
    
    public func append(_ row: Row) {
        self.rows.append(row)
    }
    
    public func append(_ rows: [Row]) {
        self.rows.append(contentsOf: rows)
    }
    
    public func clear() {
        self.rows.removeAll()
    }
}
