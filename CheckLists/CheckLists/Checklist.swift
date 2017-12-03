//
//  Checklist.swift
//  CheckLists
//
//  Created by pVasilchenko on 28.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        items = aDecoder.decodeObject(forKey: "Items") as! [CheckListItem]
    }
    
    
    var name = ""
    var items = [CheckListItem]()
    init(name: String){
        self.name = name
        super.init()
    }
}
