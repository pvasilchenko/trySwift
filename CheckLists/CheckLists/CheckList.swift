//
//  Checklist.swift
//  CheckLists
//
//  Created by pVasilchenko on 28.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class CheckList: NSObject, NSCoding {
    
    var iconName: String
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
        aCoder.encode(iconName, forKey: "IconName")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        items = aDecoder.decodeObject(forKey: "Items") as! [CheckListItem]
        iconName = aDecoder.decodeObject(forKey: "IconName") as! String
        super.init()
    }
    var name = ""
    var items = [CheckListItem]()
    init(name: String){
        self.name = name
        iconName = "No Icon"
        super.init()
    }
    func countUnchectedItems() -> Int{
        return items.reduce(0){ count, item in count + (item.checked ? 0 : 1) }
    }
    
}
