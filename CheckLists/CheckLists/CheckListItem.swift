//
//  CheckListItem.swift
//  CheckLists
//
//  Created by pVasilchenko on 15.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import Foundation
class CheckListItem: NSObject, NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    override init(){
        super.init()
    }
    
    var text = ""
    var checked = false
    func toggleChecked(){
        checked = !checked
    }
}
