//
//  DataModel.swift
//  CheckLists
//
//  Created by pVasilchenko on 03.12.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [CheckList]()
    
    init() {
        loadChecklists()
        registerDefaults()
        handleFirstTime()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    func saveChecklists() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            lists = unarchiver.decodeObject(forKey: "Checklists") as! [CheckList]
            unarchiver.finishDecoding()
            sortChecklists()
        }
    }
    
    func registerDefaults() {
        let dictionary: [String: Any] = [ "CheckListIndex": -1,
                                          "FirstTime": true ]
        
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    func handleFirstTime() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        
        if firstTime {
            let checklist = CheckList(name: "List")
            lists.append(checklist)
            
            indexOfSelectedChecklist = 0
            userDefaults.set(false, forKey: "FirstTime")
            userDefaults.synchronize()
        }
    }
    func sortChecklists(){
        lists.sort(by: {checkList1, checkList2 in
            return checkList1.name.localizedStandardCompare(checkList2.name) == .orderedAscending })
    }
    
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: "CheckListIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "CheckListIndex")
            UserDefaults.standard.synchronize()
        }
    }
}
