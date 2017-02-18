//
//  TableViewElements.swift
//  DataDisplayManager
//
//  Created by sasha klavsut on 18.02.17.
//  Copyright © 2017 sasha klavsut. All rights reserved.
//

import Foundation
import UIKit


protocol ConfigurableCell {
    associatedtype T
    func configure(model: Model<T>, state: Bool)
    
    static var cellIdentifier: String { get }
    static var rowHeight: CGFloat { get }
    static var estimatedHeight: CGFloat { get }
}



protocol Row {
    var isSelected: Bool! { get set }
    func configure(_ cell: UITableViewCell)
    
    var cellIdentifier: String { get }
    var rowHeight: CGFloat { get }
    var estimatedHeight: CGFloat { get }

    func action(_ type: DataTableActionType, cell: UITableViewCell, indexPath: IndexPath)
}


class DataTableRow<CellType: ConfigurableCell>: Row where CellType: UITableViewCell {
    

    
    typealias T = CellType.T
    
    var isSelected: Bool!
    var viewModel: Model<T>!
    
    var cellIdentifier: String {
        return CellType.cellIdentifier
    }
    var rowHeight: CGFloat {
        return CellType.rowHeight
    }
    var estimatedHeight: CGFloat {
        return CellType.estimatedHeight
    }
    
    var block: ((CellType, IndexPath,Bool) -> ())?
    
    init(model: Model<T>) {
        self.viewModel = model
    }
    
    
    func configure(_ cell: UITableViewCell) {
        (cell as? CellType)?.configure(model: self.viewModel, state: isSelected)
    }
    
    func action(_ type: DataTableActionType, cell: UITableViewCell, indexPath: IndexPath) {
        if let block = block, let cellTypped = cell as? CellType {
            block(cellTypped,indexPath,isSelected)
        }
        
    }
    
    
}


open class DataTableSection {
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



enum DataTableActionType {
    case click
}



