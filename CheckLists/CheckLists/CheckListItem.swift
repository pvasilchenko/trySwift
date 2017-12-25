//
//  CheckListItem.swift
//  CheckLists
//
//  Created by pVasilchenko on 15.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import Foundation

class CheckListItem: NSObject, NSCoding {
    var text = ""
    var checked = false
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    
    func toggleChecked() {
        checked = !checked
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
}

