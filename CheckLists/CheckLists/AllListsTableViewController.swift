//
//  AllListsTableViewController.swift
//  CheckLists
//
//  Created by pVasilchenko on 27.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class AllListsTableViewController: UITableViewController {
    
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
        cell.accessoryType = .disclosureIndicator
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowCheckList", sender: nil)
    }
}
