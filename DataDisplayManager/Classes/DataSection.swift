//
//  DataTableSection.swift
//  Pods
//
//  Created by sasha klavsut on 18.02.17.
//
//

import Foundation


open class DataSection {
    open private(set) var rows = [Row]()
    
    
    public init() {  }
    open var headerHeight: CGFloat?
    open var footerHeight: CGFloat?
    open var headerView: UIView?
    open var footerView: UIView?
    open var headerTitle: String?
    open var footerTitle: String?
    
    
    open var numberOfRows: Int {
        return rows.count
    }
    
    open func append(_ row: Row) {
        self.rows.append(row)
    }
    
    open func append(_ rows: [Row]) {
        self.rows.append(contentsOf: rows)
    }
    
    open func clear() {
        self.rows.removeAll()
    }
}
