//
//  ViewController.swift
//  ToDoList
//
//  Created by Apple on 7/10/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var arrayItem = ["nguyen" , "nhu" , "kieu" , "bich" , "tram"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "toDoList", for: indexPath)
        cell.textLabel?.text = arrayItem[indexPath.row]
        return cell
    }
    
    //MARK - TableView Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
  
    }
    
    //MARK add new items
    @IBAction func addButtonPress(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            print(textField.text!)
            self.arrayItem.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (alertTextFile) in
            alertTextFile.placeholder = "add new item"
            textField = alertTextFile
        }
        present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

