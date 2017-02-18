//
//  DataDisplayManger.swift
//  DataDisplayManager
//
//  Created by sasha klavsut on 18.02.17.
//  Copyright © 2017 sasha klavsut. All rights reserved.
//

import UIKit


class DataDisplayManager: NSObject {
    

    // MARK:- class variables
    var sections: [DataSection] = []
    var table: UITableView!
    var collectionView: UICollectionView!
    var selectedIndexPaths: [IndexPath] = []
    
    
    // MARK:- init as tableView
    init(table: UITableView) {
        super.init()
        self.table = table
        self.table.delegate = self
        self.table.dataSource = self
    }
    
    init(collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    // MARK:- append new sections
    func append(_ section: DataSection) {
        self.sections.append(section)
    }
    func append(_ sections: [DataSection]) {
        self.sections.append(contentsOf: sections)
    }
    // MARK:- clear
    func clear() {
        self.sections = []
    }
    
    // MARK:- reload
    func reloadTable() {
        self.table.reloadData()
    }
}
// MARK:- UITableViewDataSource
extension DataDisplayManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item = self.sections[indexPath.section].rows[indexPath.row]
        
        var isSelected = false
        if self.selectedIndexPaths.contains(indexPath) { isSelected = true }
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        item.isSelected = isSelected
        item.configure(cell)
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    
}

// MARK:- UITableViewDelegate
extension DataDisplayManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var item = self.sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)!
        item.action(.select, cell: cell, indexPath: indexPath)
        if self.selectedIndexPaths.contains(indexPath) {
            let index = selectedIndexPaths.index(where: { $0 == indexPath })
            if let index  = index {
                item.isSelected = false
                self.selectedIndexPaths.remove(at: index)
            }
        } else {
            item.isSelected = true
            self.selectedIndexPaths.append(indexPath)
        }
    }
    
    // MARK:- titles
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].headerTitle
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.sections[section].footerTitle
    }
    // MARK; heights
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.sections[indexPath.section].rows[indexPath.row].rowHeight
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.sections[indexPath.section].rows[indexPath.row].estimatedHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let height = self.sections[section].headerHeight {
            return height
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if let height = self.sections[section].footerHeight {
            return height
        }
        return 0
    }
    // MARK;- views
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.sections[section].footerView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.sections[section].headerView
    }
    
}


// MARK:- UICollectionViewDelegate
extension DataDisplayManager: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item = self.sections[indexPath.section].rows[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath)!
        item.action(.select, cell: cell, indexPath: indexPath)
        if self.selectedIndexPaths.contains(indexPath) {
            let index = selectedIndexPaths.index(where: { $0 == indexPath })
            if let index  = index {
                item.isSelected = false
                self.selectedIndexPaths.remove(at: index)
            }
        } else {
            item.isSelected = true
            self.selectedIndexPaths.append(indexPath)
        }
        
    }
    

    
    
}

// MARK:- UICollectionViewDataSource
extension DataDisplayManager: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var item = self.sections[indexPath.section].rows[indexPath.row]
        
        var isSelected = false
        if self.selectedIndexPaths.contains(indexPath) { isSelected = true }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cellIdentifier, for: indexPath)
        item.isSelected = isSelected
        item.configure(cell)
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    
    


    
}

