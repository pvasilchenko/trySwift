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
        let newRowIndex = checklist.items.count
        checklist.items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        dismiss(animated: true, completion: nil)
    }
    func itemDetailViewController(_controller: ItemDetailViewController, didFinishEditing item: CheckListItem){
        if let index = checklist.items.index(of: item){
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath){
                configureText(for: cell, with: item)
            }
        }
        dismiss(animated: true, completion: nil)
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
                controller.itemToEdit = checklist.items[indexPath.row]
            }
        }
    }
    
    var checklist: Checklist!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = checklist.name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return checklist.items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkListItem", for: indexPath)
        let item = checklist.items[indexPath.row]
        configureCheckmark(for: cell, with: item)
        configureText(for: cell, with: item)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = checklist.items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
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
        checklist.items.remove(at:indexPath.row)
        let indexPathes = [indexPath]
        tableView.deleteRows(at: indexPathes, with: .automatic)
    }
    
}

