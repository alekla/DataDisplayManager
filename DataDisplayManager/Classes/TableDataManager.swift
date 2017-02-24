//
//  TableDataManager.swift
//  Pods
//
//  Created by sasha klavsut on 22.02.17.
//
//

import UIKit

open class TableDataManager: NSObject {
    
    
    // MARK:- class variables
    open fileprivate(set) var sections = [DataSection]()
    open private(set) weak var table: UITableView?
    open fileprivate(set) var selected: [IndexPath] = []
    
    
    // MARK:- init as tableView
    public init(table: UITableView) {
        super.init()
        self.table = table
        self.table?.delegate = self
        self.table?.dataSource = self
        
    }
    
    
    // MARK:- append new sections
    open func append(_ section: DataSection) {
        self.sections.append(section)
    }
    open func append(_ sections: [DataSection]) {
        self.sections.append(contentsOf: sections)
    }
    // MARK:- clear
    open func clear() {
        self.sections.removeAll()
    }
    
    // MARK:- reload
    open func reloadTable() {
        self.table?.reloadData()
    }
    
    open func selectedModels() -> [IndexPath] {
        return selected
    }
    open func selectedCount() -> Int {
        return selected.count
    }
    
    deinit {
        clear()
        print("DDM deinited")
        
    }
    
}


// MARK:- UITableViewDataSource
extension TableDataManager: UITableViewDataSource {
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("indexPath: \(indexPath)")
        var item = sections[indexPath.section].rows[indexPath.row]
        var isSelected = false
        if self.selected.contains(indexPath) { isSelected = true }
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        item.isSelected = isSelected
        item.configure(cell)
        item.action(.configure, cell: cell, indexPath: indexPath)
        return cell
    }
    
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].numberOfRows
    }
    
}


// MARK:- UITableViewDelegate
extension TableDataManager: UITableViewDelegate {

    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var item = self.sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)!
        item.action(.select, cell: cell, indexPath: indexPath)
        if self.selected.contains(indexPath) {
            let index = selected.index(where: { $0 == indexPath })
            if let index  = index {
                item.isSelected = false
                self.selected.remove(at: index)
            }
        } else {
            item.isSelected = true
            self.selected.append(indexPath)
        }
    }
    
    // MARK:- titles
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].headerTitle
    }
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.sections[section].footerTitle
    }
    // MARK; heights
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let height = self.sections[indexPath.section].rows[indexPath.row].rowHeight else { return UITableViewAutomaticDimension }
        return height
    }
    open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let height = self.sections[indexPath.section].rows[indexPath.row].estimatedHeight else { return UITableViewAutomaticDimension }
        return height
        
    }
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let height = self.sections[section].headerHeight else { return 0 }
        return height
    }
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let height = self.sections[section].footerHeight else { return 0 }
        return height
    }
    // MARK:- views
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.sections[section].footerView
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.sections[section].headerView
    }
    
}

    

    

    

    


