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
    
    
    var headerHeight: CGFloat?
    var footerHeight: CGFloat?
    var headerView: UIView?
    var footerView: UIView?
    var headerTitle: String?
    var footerTitle: String?
    
    func append(_ row: Row) {
        self.rows.append(row)
    }
    
    func append(_ rows: [Row]) {
        self.rows.append(contentsOf: rows)
    }
    
    func clear() {
        self.rows = []
    }
}
