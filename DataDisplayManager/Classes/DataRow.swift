//
//  DataTableRow.swift
//  Pods
//
//  Created by sasha klavsut on 18.02.17.
//
//

import UIKit


protocol Row {
    var isSelected: Bool! { get set }
    func configure(_ cell: UITableViewCell)
    func configure(_ cell: UICollectionViewCell)
    
    var cellIdentifier: String { get }
    var rowHeight: CGFloat { get }
    var estimatedHeight: CGFloat { get }
    
    func action(_ type: DataTableActionType, cell: UITableViewCell, indexPath: IndexPath)
    func action(_ type: DataTableActionType, cell: UICollectionViewCell, indexPath: IndexPath)
}



// where CellType: UITableViewCell
class DataRow<CellType: ConfigurableCell>: Row  {
    
    
    
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
    func configure(_ cell: UICollectionViewCell) {
        (cell as? CellType)?.configure(model: self.viewModel, state: isSelected)
    }
    
    
    func action(_ type: DataTableActionType, cell: UITableViewCell, indexPath: IndexPath) {
        if let block = block, let cellTypped = cell as? CellType {
            block(cellTypped,indexPath,isSelected)
        }
        
    }
    func action(_ type: DataTableActionType, cell: UICollectionViewCell, indexPath: IndexPath) {
        if let block = block, let cellTypped = cell as? CellType {
            block(cellTypped,indexPath,isSelected)
        }
    }
    
    
}
