//
//  DataModel.swift
//  CheckLists
//
//  Created by pVasilchenko on 03.12.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import Foundation

class DataModel{
    init(){
        loadChecklists()
    }
    var lists = [Checklist]()
    
    func documentsDirectory()->URL{
        let pathes = FileManager.default.urls(for: .documentDirectory,
                                              in: .userDomainMask)
        return pathes[0]
    }
    func dataFilePath() -> URL{
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    func saveChecklists(){
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    func loadChecklists(){
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path){
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            lists = unarchiver.decodeObject(forKey: "Checklists") as! [Checklist]
            unarchiver.finishDecoding()
        }
    }

}
