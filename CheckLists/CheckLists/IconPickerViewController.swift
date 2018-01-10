//
//  IconPickerViewController.swift
//  CheckLists
//
//  Created by pVasilchenko on 10.01.2018.
//  Copyright © 2018 pVasilchenko. All rights reserved.
//

import UIKit
protocol IconPickerViewControllerDelegate: class{
    func iconPicker(_picker: IconPickerViewController,
                    didPick iconName: String)
}
class IconPickerViewController: UITableViewController{
    weak var delegate: IconPickerViewControllerDelegate?
    let icons = [
        "No Icon",
        "Appointments",
        "Birthdays",
        "Chores",
        "Drinks",
        "Folder",
        "Groceries",
        "Inbox",
        "Photos",
        "Trips" ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        
        return cell
    }
    
}








