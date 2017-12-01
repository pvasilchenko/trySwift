//
//  Checklist.swift
//  CheckLists
//
//  Created by pVasilchenko on 28.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    
    var name = ""
    var items = [CheckListItem]()
    init(name: String){
        self.name = name
        super.init()
    }
}
