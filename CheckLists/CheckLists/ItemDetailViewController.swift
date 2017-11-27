//
//  ItemDetailViewController.swift
//  CheckLists
//
//  Created by pVasilchenko on 19.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//
protocol ItemDetailViewControllerDelegate: class{
    func itemDetailViewControllerDidCanceled(_controller: ItemDetailViewController)
    func itemDetailViewController(_controller: ItemDetailViewController, didFinishAdding item: CheckListItem )
    func itemDetailViewController(_controller: ItemDetailViewController, didFinishEditing item: CheckListItem)
}

import UIKit

class ItemDetailViewController: UITableViewController, UITextFieldDelegate{
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: CheckListItem?
    
    @IBOutlet var doneBarButton: UIBarButtonItem!
    @IBOutlet var textField: UITextField!
    
    @IBAction func cancel(){
//        dismiss(animated: true, completion: nil)
        delegate?.itemDetailViewControllerDidCanceled(_controller: self)
    }
    @IBAction func done(){
//        print("Text of the textField is: \(textField.text!)")
//        dismiss(animated: true, completion: nil)
        if let item = itemToEdit{
            item.text = textField.text!
            delegate?.itemDetailViewController(_controller: self, didFinishEditing: item)
        }else{
            let item = CheckListItem()
            item.text = textField.text!
            item.checked = false
            
            delegate?.itemDetailViewController(_controller: self, didFinishAdding: item)
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        if let item = itemToEdit{
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with:string) as NSString
        doneBarButton.isEnabled = (newText.length > 0)
        return true
    }
}
