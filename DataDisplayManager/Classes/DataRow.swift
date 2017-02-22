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
    var rowHeight: CGFloat { get }
    var estimatedHeight: CGFloat { get }
    
    func action(_ type: DataTableActionType, cell: UIView, indexPath: IndexPath)
}


open class DataRow<CellType: SettableCell>: Row  {
    
    typealias T = CellType.T
    
    public var isSelected: Bool!
    var viewModel: Model<T>!
    
    public var cellIdentifier: String {
        return CellType.cellIdentifier
    }
    public var rowHeight: CGFloat {
        return CellType.rowHeight
    }
    public var estimatedHeight: CGFloat {
        return CellType.estimatedHeight
    }
    
    public var blocks: [String: ActionModel<CellType>?] = [:]
    
    public init(model: Model<T>) {
        self.viewModel = model
    }
    
    
    public func configure(_ cell: UIView) {
        (cell as? CellType)?.configure(model: self.viewModel, state: isSelected)
    }
   
    
    
    public func action(_ type: DataTableActionType, cell: UIView, indexPath: IndexPath) {
        if let cellTypped = cell as? CellType {
            let model = ActionModel(cell: cellTypped, state: isSelected, indexPath: indexPath)
            self.blocks[type.name()] = model
        }
  
        
        
      
        
    }
    
    
    
    
    public func actionFor(type: DataTableActionType, action: @escaping (ActionModel<CellType>)-> ()) {
        print("BLOCK ACTION")
        let index  = type.name()
        print("blocks: \(blocks)")
        if let block = self.blocks[index] {
            action(block!)
            print("actionInsert")
            
        }
        print("nope")
    }
    
    
}
