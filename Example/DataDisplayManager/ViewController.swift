//
//  ViewController.swift
//  DataDisplayManager
//
//  Created by alekla on 02/18/2017.
//  Copyright (c) 2017 alekla. All rights reserved.
//

import UIKit
import DataDisplayManager
class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            dataDisplayManager = CollectionDataManager(collectionView: collectionView)
        }
    }
    var dataDisplayManager: CollectionDataManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let section = DataSection()
        
        for i in 0...30 {
//            
//            let model = Model<String>(data: "\(i)", action: nil)
//            let row = DataRow<customCell>(model: model)
//            row.actionFor(type: .select, action: { t in
//                
//                print("result type: \(t.indexPath)")
//            
//            })
//            row.actionFor(type: .deselect, action: { t in
//                print("result type: \(t)")
//            })
//            
//            section.append(row)
            
        }
//        dataDisplayManager.append(section)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    deinit {
        
        print("deinit")
    }
}

