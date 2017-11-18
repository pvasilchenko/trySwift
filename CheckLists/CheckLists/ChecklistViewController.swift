//
//  ViewController.swift
//  CheckLists
//
//  Created by pVasilchenko on 08.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var row0text = "Walk the dog"
    var row1text = "Brush teeth"
    var row2text = "Lern iOS development"
    var row3text = "Soccer practice"
    var row4text = "Eat ice cream"
    
    var row0item: CheckListItem!
    var row1item: CheckListItem!
    var row2item: CheckListItem!
    var row3item: CheckListItem!
    var row4item: CheckListItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkListItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0{
            label.text = row0item.text
        } else if indexPath.row == 1{
            label.text = row1item.text
        }else if indexPath.row == 2{
            label.text = row2item.text
        }else if indexPath.row == 3{
            label.text = row3item.text
        }else if indexPath.row == 4{
            label.text = row4item.text
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            if indexPath.row == 0{
                row0item.checked = !row0item.checked
            }else if indexPath.row == 1{
                row1item.checked = !row1item.checked
            }else if indexPath.row == 2{
                row2item.checked = !row2item.checked
            }else if indexPath.row == 3{
                row3item.checked = !row3item.checked
            }else if indexPath.row == 4{
                row4item.checked = !row4item.checked
            }
            
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath){
        
    }


}

