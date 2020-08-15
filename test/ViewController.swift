//
//  ViewController.swift
//  test
//
//  Created by Aldon Smith on 8/14/20.
//  Copyright © 2020 Aldon Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var item: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let item = item {
            reasonTextField.text = item.name
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as AnyObject? === saveButton {
            let name = reasonTextField.text ?? "" //Notice the nil coalescing operator (??) in the name line. It is used to return the value of an optional if the optional has a value, or return a default value otherwise.
            item = Item(name: name)
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isInAddMode = presentingViewController is UINavigationController
        
        if isInAddMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController!.popViewController(animated: true)
        }
        
    }
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
}

