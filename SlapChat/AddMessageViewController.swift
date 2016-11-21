//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Victoria Melendez on 11/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddMessageViewController: UIViewController {

    let dataStore = DataStore.sharedInstance

    @IBOutlet weak var textField: UITextField!
 
    
    @IBAction func saveButton(_ sender: Any) {
        if textField.text != "" {
            dataStore.createNewData(message: textField.text!)
      print(dataStore.messages)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
    
    
}
