//
//  CollectionDataManager.swift
//  Pods
//
//  Created by sasha klavsut on 22.02.17.
//
//

import UIKit

open class CollectionDataManager: NSObject {
    
    
    // MARK:- class variables
    var sections: [DataSection] = []
    var collectionView: UICollectionView!
    var selectedIndexPaths: [IndexPath] = []
    
    // MARK:- init as collectionView
    public init(collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    // MARK:- append new sections
    public func append(_ section: DataSection) {
        self.sections.append(section)
    }
    public func append(_ sections: [DataSection]) {
        self.sections.append(contentsOf: sections)
    }
    // MARK:- clear
    public func clear() {
        self.sections.removeAll()
    }
    
    // MARK:- reload
    public func reloadCollection() {
        self.collectionView.reloadData()
    }
    
    deinit {
        clear()
        print("DDM deinited")
        
    }

}

// MARK:- UICollectionViewDelegate
extension CollectionDataManager: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        var item = self.sections[indexPath.section].rows[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath)!
//        item.action(.deselect, cell: cell, indexPath: indexPath)
        
        
        
    }
    
    
    
    
}

// MARK:- UICollectionViewDataSource
extension CollectionDataManager: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var item = self.sections[indexPath.section].rows[indexPath.row]
        
        var isSelected = false
        if self.selectedIndexPaths.contains(indexPath) { isSelected = true }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cellIdentifier, for: indexPath)
        item.isSelected = isSelected
        item.action(.configure, cell: cell, indexPath: indexPath)
        item.configure(cell)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
}
