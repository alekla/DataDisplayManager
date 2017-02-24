//
//  DataTableRow.swift
//  Pods
//
//  Created by sasha klavsut on 18.02.17.
//
//

import UIKit


public protocol Row {
    var isSelected: Bool! { get set }
    func configure(_ cell: UIView)
    
    var cellIdentifier: String { get }
    var rowHeight: CGFloat? { get }
    var estimatedHeight: CGFloat? { get }
    
    
    func action(_ type: DataTableActionType, cell: UIView, indexPath: IndexPath)
}


open class DataRow<CellType: SettableCell>: Row  {
    
    typealias T = CellType.T
    
    open var isSelected: Bool!
    open let viewModel: Model<T>!
    
    open var cellIdentifier: String {
        return CellType.cellIdentifier
    }
    open var rowHeight: CGFloat? {
        return CellType.rowHeight
    }
    open var estimatedHeight: CGFloat? {
        return CellType.estimatedHeight
    }
    open var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
    
    
    open var actions: [DataTableActionType: ( (ActionModel<CellType>) -> () )?] = [:]
    
    public init(model: Model<T>) {
        self.viewModel = model
    }
    
    
    open func configure(_ cell: UIView) {
        (cell as? CellType)?.configure(model: self.viewModel, state: isSelected)
    }
    
    
    public func action(_ type: DataTableActionType, cell: UIView, indexPath: IndexPath) {
        if let cellTypped = cell as? CellType {
            let model = ActionModel(cell: cellTypped, state: isSelected, indexPath: indexPath)
            if let action = self.actions[type] {
                if let block = action {
                    block(model)
                }
            }
        }
    }
    
 
}
