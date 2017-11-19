//
//  ViewController.swift
//  CheckLists
//
//  Created by pVasilchenko on 08.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items: [CheckListItem]
    required init?(coder aDecoder: NSCoder) {
        items = [CheckListItem]()
        
        let row0item = CheckListItem()
        row0item.checked = true
        row0item.text = "Walk the dog"
        items.append(row0item)
        
        let row1item = CheckListItem()
        row1item.checked = false
        row1item.text = "Brush teeth"
        items.append(row1item)
        
        let row2item = CheckListItem()
        row2item.checked = true
        row2item.text = "Lern iOS development"
        items.append(row2item)
        
        let row3item = CheckListItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = CheckListItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder:aDecoder)
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
    }
    func configureCheckmark(for cell: UITableViewCell, with item:CheckListItem){
        if item.checked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
    func configureText(for cell: UITableViewCell, with item: CheckListItem){
        let label = cell.viewWithTag(2480) as! UILabel
        label.text = item.text
    }
    @IBAction func addItem(){
        let newRowIndex = items.count
        let item = CheckListItem()
        item.text = "Adding checked"
        item.checked = false
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPathes = [indexPath]
        tableView.insertRows(at: indexPathes, with: .automatic)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at:indexPath.row)
        let indexPathes = [indexPath]
        tableView.deleteRows(at: indexPathes, with: .automatic)
    }
}

