//
//  ViewController.swift
//  CheckLists
//
//  Created by pVasilchenko on 08.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
    func itemDetailViewControllerDidCanceled(_controller: ItemDetailViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemDetailViewController(_controller: ItemDetailViewController, didFinishAdding item: CheckListItem) {
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        dismiss(animated: true, completion: nil)
        saveCheckListItems()
    }
    func itemDetailViewController(_controller: ItemDetailViewController, didFinishEditing item: CheckListItem){
        if let index = items.index(of: item){
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath){
                configureText(for: cell, with: item)
            }
        }
        dismiss(animated: true, completion: nil)
        saveCheckListItems()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "AddItem"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.delegate = self
        }else if segue.identifier == "EditItem"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
    

    var items: [CheckListItem]
    required init?(coder aDecoder: NSCoder) {
        items = [CheckListItem]()
        
//        let row0item = CheckListItem()
//        row0item.checked = true
//        row0item.text = "Walk the dog"
//        items.append(row0item)
//
//        let row1item = CheckListItem()
//        row1item.checked = false
//        row1item.text = "Brush teeth"
//        items.append(row1item)
//
//        let row2item = CheckListItem()
//        row2item.checked = true
//        row2item.text = "Lern iOS development"
//        items.append(row2item)
//
//        let row3item = CheckListItem()
//        row3item.text = "Soccer practice"
//        row3item.checked = false
//        items.append(row3item)
//
//        let row4item = CheckListItem()
//        row4item.text = "Eat ice cream"
//        row4item.checked = true
//        items.append(row4item)
//
        super.init(coder:aDecoder)
        loadCheckListItems()
        print("Document's folder is: \(documentDictionary())")
        print("Data file path is: \(dataFilePath())")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Checklist"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkListItem", for: indexPath)
        let item = items[indexPath.row]
        configureCheckmark(for: cell, with: item)
        configureText(for: cell, with: item)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        saveCheckListItems()
    }
    func configureCheckmark(for cell: UITableViewCell, with item:CheckListItem){
        let lable = cell.viewWithTag(2481) as! UILabel
        if item.checked{
            lable.text = "√"
        }else{
            lable.text = ""
        }
        
    }
    func configureText(for cell: UITableViewCell, with item: CheckListItem){
        let label = cell.viewWithTag(2480) as! UILabel
        label.text = item.text
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at:indexPath.row)
        let indexPathes = [indexPath]
        tableView.deleteRows(at: indexPathes, with: .automatic)
        saveCheckListItems()
    }
    func documentDictionary() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func dataFilePath() -> URL {
        return documentDictionary().appendingPathComponent("CheckList.plist")
    }
    func saveCheckListItems(){
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(items, forKey: "CheckListItem")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    func loadCheckListItems(){
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path){
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            items = unarchiver.decodeObject(forKey: "CheckListItem") as! [CheckListItem]
            unarchiver.finishDecoding()
        }
    }
}

