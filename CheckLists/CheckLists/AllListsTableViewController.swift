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
    var dataModel: DataModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(for: tableView)
        let checklist = dataModel.lists[indexPath.row]
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
        
        let checklist = dataModel.lists[indexPath.row]
        performSegue(withIdentifier: "ShowCheckList", sender: checklist)
    }
    
    func listDetaileViewControllerDidCencel(_controller: ListDetaileViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func listDetaileViewController(_controller: ListDetaileViewController, didFinishAdding checklist: Checklist) {
        let newRowIndex = dataModel.lists.count
        dataModel.lists.append(checklist)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPathes = [indexPath]
        tableView.insertRows(at: indexPathes, with: .automatic)
        
        dismiss(animated: true, completion: nil)
    }
    
    func listDetaileViewController(_controller: ListDetaileViewController, didFinishEditing checklist: Checklist) {
        if let index = dataModel.lists.index(of: checklist){
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath){
                cell.textLabel!.text = checklist.name
            }
        }
        dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        dataModel.lists.remove(at: indexPath.row)
        
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
        let checklist = dataModel.lists[indexPath.row]
        controller.checklistToEdit = checklist
        
        present(navigationController, animated: true, completion: nil)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
