//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBAction func Add(_ sender: Any) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier != "thisSegue" { return }
            if let dest = segue.destination as? AddMessageViewController,
                let indexPath = tableView.indexPathForSelectedRow {

            }
        }
    }
    
    
    
    @IBAction func DescendWhenClicked(_ sender: Any) {
        DataStore.sharedInstance.descending()
        tableView.reloadData()
    }
    
 
    @IBAction func AscendWhenClicked(_ sender: Any) {
        DataStore.sharedInstance.ascending()
        tableView.reloadData()
        
    }
    
    
    
    
    let store = DataStore.sharedInstance
    
    var msgArr = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataStore.sharedInstance.createTestData()
        DataStore.sharedInstance.fetchData()
        DataStore.sharedInstance.createTestData()
        print(DataStore.sharedInstance.messages.count)
        
        
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DataStore.sharedInstance.fetchData()
        tableView.reloadData()
        
    }
        
    
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return DataStore.sharedInstance.messages.count
        }
        
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
            
            let messageHere = DataStore.sharedInstance.messages[indexPath.row].content
            cell.textLabel?.text = messageHere
            // Configure the cell...
            
            return cell
        }
    

    
        
    }
    
    


