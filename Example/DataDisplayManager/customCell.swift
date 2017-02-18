//
//  customCell.swift
//  DataDisplayManager
//
//  Created by sasha klavsut on 19.02.17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DataDisplayManager
class customCell: UICollectionViewCell,ConfigurableCell {
    public static var estimatedHeight: CGFloat {
        return 50
    }

    
    public static var rowHeight: CGFloat {
        return 50
    }

    public static var cellIdentifier: String {
        return "customCell"
    }

    

    @IBOutlet weak var data: UILabel!
    
    
    
    func configure(model: Model<String>, state: Bool) {
        data.text = model.data
        
    }
}
