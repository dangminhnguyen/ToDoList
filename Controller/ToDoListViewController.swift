//
//  ViewController.swift
//  ToDoList
//
//  Created by Apple on 7/10/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var arrayItem = [Item]()
    
    let userdefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemNew = Item()
        itemNew.title = "dang"
        arrayItem.append(itemNew)
        let itemNew1 = Item()
        itemNew1.title = "minh"
        arrayItem.append(itemNew1)
        let itemNew2 = Item()
        itemNew2.title = "nguyen"
        arrayItem.append(itemNew2)
        
        if let item = userdefault.array(forKey: "todolist") as? [Item] {
         arrayItem = item
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "toDoList", for: indexPath)
        
        let item = arrayItem[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none   //Swift ternary operation
        tableView.deselectRow(at: indexPath, animated: true)
        return cell
    }
    
    //MARK - TableView Delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        arrayItem[indexPath.row].done = !arrayItem[indexPath.row].done
//        if arrayItem[indexPath.row].done == true {
//            arrayItem[indexPath.row].done = false
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }else{
//            arrayItem[indexPath.row].done = true
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        tableView.deselectRow(at: indexPath, animated: true)
     
    }
    
    //MARK add new items
    @IBAction func addButtonPress(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            print(textField.text!)
            let itemNew = Item()
            itemNew.title = textField.text!
            self.arrayItem.append(itemNew)
            self.userdefault.set(self.arrayItem, forKey: "todolist")
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

