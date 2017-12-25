//
//  ListDetailViewController.swift
//  CheckLists
//
//  Created by pVasilchenko on 28.11.2017.
//  Copyright © 2017 pVasilchenko. All rights reserved.
//

import Foundation
import UIKit

protocol ListDetaileViewControllerDelegate: class {
    func listDetaileViewControllerDidCancel(_ controller: ListDetaileViewController)
    
    func listDetaileViewController(_ controller: ListDetaileViewController,
                                  didFinishAdding checklist: CheckList)
    
    func listDetaileViewController(_ controller: ListDetaileViewController,
                                  didFinishEditing checklist: CheckList)
}

class ListDetaileViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetaileViewControllerDelegate?
    
    var checklistToEdit: CheckList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        delegate?.listDetaileViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let checklist = checklistToEdit {
            checklist.name = textField.text!
            delegate?.listDetaileViewController(self,
                                               didFinishEditing: checklist)
        } else {
            let checklist = CheckList(name: textField.text!)
            delegate?.listDetaileViewController(self,
                                               didFinishAdding: checklist)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarButton.isEnabled = (newText.length > 0)
        return true
    }
}

