//
//  AllListsTableViewController.swift
//  CheckLists
//
//  Created by pVasilchenko on 27.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class AllListsTableViewController: UITableViewController,
                                        ListDetaileViewControllerDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCheckList"{
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as! Checklist
        }else if segue.identifier == "AddChecklist"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ListDetaileViewController
            controller.delegate = self
            controller.checklistToEdit = nil
        }
    }
    
    var lists: [Checklist]
    
    required init?(coder aDecoder: NSCoder){
        lists = [Checklist]()
        super.init(coder: aDecoder)
        
        var list = Checklist(name: "Birthday")
        lists.append(list)
        list = Checklist(name: "House work")
        lists.append(list)
        list = Checklist(name: "Holidays preparation")
        lists.append(list)
        list = Checklist(name: "To-do")
        lists.append(list)
        
        for list in lists{
            let item = CheckListItem()
            item.text = "item for: \(list.name)"
            list.items.append(item)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(for: tableView)
        let checklist = lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        cell.tintColor = UIColor.orange
        return cell
    }
    func makeCell(for tableView: UITableView) -> UITableViewCell{
        let cellIdentifier = "Cell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier){
            return cell
        }else{
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
    }
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "ShowCheckList", sender: checklist)
    }
    
    func listDetaileViewControllerDidCencel(_controller: ListDetaileViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func listDetaileViewController(_controller: ListDetaileViewController, didFinishAdding checklist: Checklist) {
        let newRowIndex = lists.count
        lists.append(checklist)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPathes = [indexPath]
        tableView.insertRows(at: indexPathes, with: .automatic)
        
        dismiss(animated: true, completion: nil)
    }
    
    func listDetaileViewController(_controller: ListDetaileViewController, didFinishEditing checklist: Checklist) {
        if let index = lists.index(of: checklist){
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath){
                cell.textLabel!.text = checklist.name
            }
        }
        dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        lists.remove(at: indexPath.row)
        
        let indexPathes = [indexPath]
        tableView.deleteRows(at: indexPathes, with: .automatic)
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let navigationController = storyboard!.instantiateViewController(
                                withIdentifier: "ListDetailNavigationController")
                                         as! UINavigationController
        let controller = navigationController.topViewController
                                                 as! ListDetaileViewController
        controller.delegate = self
        let checklist = lists[indexPath.row]
        controller.checklistToEdit = checklist
        
        present(navigationController, animated: true, completion: nil)
    }
    func documentsDictionary()->URL{
        
    }
    
    
    
    
    
    
    
}
